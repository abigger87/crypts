%lang starknet
%builtins pedersen range_check ecdsa

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import storage_read
from starkware.cairo.common.math import assert_not_zero

## @title CryptFactory
## @description Factory which enables deploying a Crypt for any ERC20 token.
## @description Adapted from Rari Capital's Vaults: https://github.com/Rari-Capital/vaults
## @author Alucard <github.com/a5f9t4>


#############################################
##                 STORAGE                 ##
#############################################

@storage_var
func INITIALIZED() -> (res: felt):
end

#############################################
##               CONSTRUCTOR               ##
#############################################

@constructor
func constructor{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr
}(
    owner: felt
):
    NAME.write(0x0) # TODO: encode string to bytes
    SYMBOL.write(0x0) # TODO: encode string to bytes

    UNDERLYING.write(underlying)
    BASE_UNIT.write(10**18)

    return()
end

#############################################
##             CRYPT DEPLOYMENT            ##
#############################################

## @notice Deploys a new Crypt which supports a specific underlying token.
## @dev Reverts on double-deploys.
## @param underlying The underlying Crypt ERC20 token.
func deployCrypt{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr
}(underlying: felt) -> (deployed: felt):
    ## Deploy a new Crypt

    # vault = new Vault{salt: address(underlying).fillLast12Bytes()}(underlying);

    return (0)
end

#############################################
##            CRYPT LOOKUP LOGIC           ##
#############################################

## @notice Computes a Crypt's address from its accepted underlying token.
## @param underlying The underlying ERC20 token.
func getCryptFromUnderlying{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr
}(underlying: felt) -> (crypt: felt):
    # TODO: compute crypt address from underlying

    return (0)
end

## @notice Returns if a Crypt at an address has already been deployed.
## @param crpyt The address of a Crypt which may not have been deployed yet.
## @return A boolean indicating whether the Crypt has been deployed already.
func isCryptDeployed{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr
}(vault: felt) -> (deployed: felt):
    alloc_locals
    let (local storage: felt) = storage_read(vault)
    if storage == 0:
        return (0)
    else:
        return (1)
    end
end
