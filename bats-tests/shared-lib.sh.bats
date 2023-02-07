#! /usr/bin/env bats

# import shared library functions under test, need to use the BATS 'load' function rather than 'source'
load "../lib/shared.sh"

# This function purges any known state, to be run during both setup and teardown
function delete_state {
    rm -f "$SIGN_REQUEST_FILE_PATH"
}

function setup {
    delete_state
}

function teardown {
    delete_state
}

@test "We can still download 'sign-request.py' from Github if needed" {
    # Check that constants are still being exported
    echo "$SIGN_REQUEST_FILE_URL" | grep "sign-request\.py"
    echo "$SIGN_REQUEST_FILE_PATH" | grep "sign_requests\.py"
    
    # ASSERT that the temporary location is empty,
    # then use the function under test to fetch the script, 
    # then ASSERT that the script exists
    [[ ! -f $SIGN_REQUEST_FILE_PATH ]]
    download_request_signer_script
    [[ -f $SIGN_REQUEST_FILE_PATH ]]
}