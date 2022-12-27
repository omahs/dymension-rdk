BASEDIR=$(dirname "$0")
echo "$BASEDIR"
source "$BASEDIR"/shared.sh

# ---------------------------------- config ---------------------------------- #
RLY_CONFIG_PATH="$BASEDIR/../ibc/rly_config"
AMOUNT="1000000dym"

# ----------------------------------- init ----------------------------------- #
rm -r "$HOME/.relayer/"
rly config init

# -------------------------------- add chains -------------------------------- #
rly chains add -f "$RLY_CONFIG_PATH"/ibc-settlement.json settlement
rly chains add -f "$RLY_CONFIG_PATH"/ibc-rollapp.json rollapp

# --------------------------------- add keys --------------------------------- #
# settlement_mnemonic=`"$SETTLEMENT_EXECUTABLE" keys mnemonic "$KEY_NAME_IBC" --keyring-backend test`
# rly keys restore settlement "$KEY_NAME_IBC" "$settlement_mnemonic"
rly keys add settlement "$KEY_NAME_IBC"
SETTLEMENT_RELAYER_ADDRESS=`rly keys show settlement "$KEY_NAME_IBC"`

# rollapp_mnemonic=`"$EXECUTABLE" keys mnemonic "$KEY_NAME_IBC" --keyring-backend test`
rly keys add rollapp "$KEY_NAME_IBC"
ROLLAPP_RELAYER_ADDRESS=`rly keys show rollapp "$KEY_NAME_IBC"`


# --------------------------- fund relayer accounts -------------------------- #
AMOUNT_SETTLEMENT="1000000dym"
AMOUNT_ROLLAPP="100000000rap"

FUNDING_ADDRESS_SETTLEMENT="$("$SETTLEMENT_EXECUTABLE" keys show "$KEY_NAME_DYM" -a --keyring-backend test)"
FUNDING_ADDRESS_ROLLAPP="$("$EXECUTABLE" keys show "$KEY_NAME_ROLLAPP" -a --keyring-backend test)"


echo "Running: $SETTLEMENT_EXECUTABLE tx bank send $FUNDING_ADDRESS_SETTLEMENT $SETTLEMENT_RELAYER_ADDRESS $AMOUNT_SETTLEMENT"
$SETTLEMENT_EXECUTABLE tx bank send $FUNDING_ADDRESS_SETTLEMENT $SETTLEMENT_RELAYER_ADDRESS $AMOUNT_SETTLEMENT \
  --chain-id "$SETTLEMENT_CHAIN_ID" \
  --keyring-backend test


echo "Running: $EXECUTABLE tx bank send $FUNDING_ADDRESS_ROLLAPP $ROLLAPP_RELAYER_ADDRESS $AMOUNT_ROLLAPP"
$EXECUTABLE tx bank send $FUNDING_ADDRESS_ROLLAPP $ROLLAPP_RELAYER_ADDRESS $AMOUNT_ROLLAPP \
  --chain-id "$CHAIN_ID" \
  --keyring-backend test \
  --node "tcp://$ROLLAPP_RPC"