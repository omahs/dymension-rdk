BASEDIR=$(dirname "$0")
source "$BASEDIR"/shared.sh

echo '# ------------------------------ run the ibc relayer ----------------------------- #'
rly start "$RELAYER_PATH" --debug-addr ""