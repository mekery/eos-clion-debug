/**
 *  @desc Debug
 *  @author Micle Bu, micle@oriovo.com
 *  @date 2018.05.03
 */

#include <eosiolib/eosio.hpp>

namespace debug {

    /// @abi action
    struct foo {
        account_name from;
        account_name to;
        uint64_t amount;

        void print() const {
            eosio::name fromName;
            fromName.value = from;
            eosio::name toName;
            toName.value = to;
            eosio::print("Foo from ", fromName, " to ", toName, " with amount ", amount, "\n");
        }
    };
}
