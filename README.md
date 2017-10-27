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

Then list all variables in the px files:
```
# to be done
```

# Error handling

The script reports HTTP statuses if not 200:

```
Fail: http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/rak/kora 404
Fail: http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/ymp/jmkrm 404
Fail: http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/ymp/tyjvp 404
Fail: http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/ymp/tvot 404
```
