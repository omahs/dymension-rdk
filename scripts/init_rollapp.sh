BASEDIR=$(dirname "$0")
echo "$BASEDIR"
source "$BASEDIR"/shared.sh


TOKEN_AMOUNT=${TOKEN_AMOUNT:-1000000000000000000000rap}
STAKING_AMOUNT=${STAKING_AMOUNT:-500000000000000000000rap}


#init rollapp
rm -rf "$CHAIN_DIR"

$EXECUTABLE tendermint unsafe-reset-all
$EXECUTABLE init "$MONIKER" --chain-id "$CHAIN_ID"


sed -i'' -e 's/^minimum-gas-prices *= .*/minimum-gas-prices = "0rap"/' "$CHAIN_DIR"/config/app.toml
sed -i'' -e 's/bond_denom": ".*"/bond_denom": "rap"/' "$CHAIN_DIR"/config/genesis.json
sed -i'' -e 's/mint_denom": ".*"/mint_denom": "rap"/' "$CHAIN_DIR"/config/genesis.json


$EXECUTABLE keys add "$KEY_NAME_ROLLAPP" --keyring-backend test
$EXECUTABLE add-genesis-account "$KEY_NAME_ROLLAPP" "$TOKEN_AMOUNT" --keyring-backend test
$EXECUTABLE gentx "$KEY_NAME_ROLLAPP" "$STAKING_AMOUNT" --chain-id "$CHAIN_ID" --keyring-backend test
$EXECUTABLE collect-gentxs