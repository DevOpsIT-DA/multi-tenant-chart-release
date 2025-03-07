# Makefile for Helm chart operations
# Note: Indentation MUST use tabs, not spaces

CHART_DIR = tenant-stack
RELEASE_NAME = tenant
NAMESPACE = default
VALUES_FILE = values.yaml

.PHONY: lint install upgrade template clean release

lint:
	helm lint $(CHART_DIR)

template:
	helm template $(RELEASE_NAME) $(CHART_DIR) -f $(VALUES_FILE) --namespace $(NAMESPACE)

install:
	helm install $(RELEASE_NAME) $(CHART_DIR) -f $(VALUES_FILE) --namespace $(NAMESPACE) --create-namespace

upgrade:
	helm upgrade --install $(RELEASE_NAME) $(CHART_DIR) -f $(VALUES_FILE) --namespace $(NAMESPACE)

uninstall:
	helm uninstall $(RELEASE_NAME) --namespace $(NAMESPACE)

clean:
	rm -rf $(CHART_DIR)/charts/
	rm -rf $(CHART_DIR)/*.tgz

# Edit chart values in a text editor
edit-values:
	$(EDITOR) $(VALUES_FILE)

release:
	@helm package $(CHART_DIR) -d chart-release
	@helm repo index .