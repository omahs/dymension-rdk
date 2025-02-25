package sequencers

import (
	sdk "github.com/cosmos/cosmos-sdk/types"

	"github.com/dymensionxyz/rollapp/x/sequencers/keeper"
	"github.com/dymensionxyz/rollapp/x/sequencers/types"
)

// InitGenesis initializes the capability module's state from a provided genesis
// state.
func InitGenesis(ctx sdk.Context, k keeper.Keeper, genState types.GenesisState) {
	// this line is used by starport scaffolding # genesis/module/init
	k.SetParams(ctx, genState.Params)
}

// ExportGenesis returns the capability module's exported genesis.
func ExportGenesis(ctx sdk.Context, k keeper.Keeper) *types.GenesisState {
	genesis := types.DefaultGenesis()
	genesis.Params = k.GetParams(ctx)

	// this line is used by starport scaffolding # genesis/module/export

	return genesis
}

func ValidateGenesis(data *types.GenesisState) error {
	//TODO: Add validation when gentx for sequencers works
	// if len(data.Validators) == 0 {
	// 	return types.ErrNoSequencerOnGenesis
	// }

	return data.Params.Validate()
}
