# Goal

ready-to-use scripts to query StatFin PXWeb API

# Requirements

```
sudo apt-get install curl
sudo apt-get install jq
```

# Usage

Start with catalog script:

```
./statfin_catalog.sh > px.txt
```

Then list all variables + possible values in the px files:
```
./px_variables.sh < px.txt
```

# Error handling

The catalog script reports HTTP statuses if not 200:

```
Fail: http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/rak/kora 404
Fail: http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/ymp/jmkrm 404
Fail: http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/ymp/tyjvp 404
Fail: http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/ymp/tvot 404
```

# To Do

Downloaded .px files without "code", e.g. http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/hin/jmhi/statfin_jmhi_pxt_001_fi.px
