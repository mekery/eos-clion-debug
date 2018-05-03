/**
 *  @desc Debug
 *  @author Micle Bu, micle@oriovo.com
 *  @date 2018.05.03
 */

#include "debug.hpp"
#include <eosiolib/print.hpp>
using namespace eosio;

extern "C" {
    /**
     *  This method is called once when the contract is published or updated.
     */
    void init()  {
        eosio::print( "Init!\n" );
    }

    /**
     * The apply method implements the dispatch of actions to this contract
     * @param receiver
     * @param code
     * @param action
     */
    void apply( uint64_t receiver, uint64_t code, uint64_t action ) {
        if (action == N(foo)) {
            eosio::print("Running foo action ...\n");

            debug::foo f;
            read_action_data(&f, sizeof(debug::foo));

            eosio::name from;
            from.value = f.from;
            eosio::name to;
            to.value = f.to;
            eosio::print("Action data: from ", from, " to ", to, " amount ", f.amount, "\n");
            eosio::print(f);
        }

        // parameters
        eosio::name receiverName;
        receiverName.value = receiver;
        eosio::name codeName;
        codeName.value = code;
        eosio::name actionName;
        actionName.value = action;
        eosio::print("Apply: receiver-", receiverName, " code-", codeName, " action-", actionName, "\n");
    }
} // extern "C"