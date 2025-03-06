# multi-tenant-chart-release
Chart release repository for multi tenant deployment

### how to build the helm chart

```bash
 helm package tenant-stack -d chart-release
```

this command will create a tar.gz file in the `chart-release` directory.

### indexing the helm chart

```bash
helm repo index .
```

this command will create an index.yaml file in the current directory. 
later, the index.yaml file and the tar.gz file must be hosted in the public or private helm repository.
when i push to github repository there is a github action that will automatically update github pages with the new chart.
