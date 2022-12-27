# ---------------------------------------------------------------------------- #
#                               SETTLEMENT CONFIG                              #
# ---------------------------------------------------------------------------- #
KEY_NAME_GENESIS=${KEY_NAME_GENESIS:-"local-user"}
KEY_NAME_DYM=${KEY_NAME_DYM:-"local-user"}
KEYRING_PATH=${KEYRING_PATH:-"$HOME/.dymension"}
SETTLEMENT_EXECUTABLE=${SETTLEMENT_EXECUTABLE:-dymd}
SETTLEMENT_CHAIN_ID="local-testnet"
SETTLEMENT_RPC="127.0.0.1:26657"


#TODO: make most params based on chain ID
# ---------------------------------------------------------------------------- #
#                                ROLLAPP CONFIG                                #
# ---------------------------------------------------------------------------- #
KEY_NAME_ROLLAPP=${KEY_NAME_ROLLAPP:-"rol-user"}
EXECUTABLE=${EXECUTABLE:-rollappd}
CHAIN_ID=${CHAIN_ID:-rollapp}
CHAIN_DIR=${CHAIN_DIR:-$HOME/.rollapp}
ROLLAPP_ID=${ROLLAPP_ID:-rollapp}
MONIKER=${MONIKER:-rollapp-sequencer}
NAMESPACE_ID=${NAMESPACE_ID:-000000000000FFFF}
ROLLAPP_RPC="127.0.0.1:26667"



# ---------------------------------------------------------------------------- #
#                                      IBC                                     #
# ---------------------------------------------------------------------------- #
KEY_NAME_IBC=${KEY_NAME_IBC:-"ibcrelayer"}
