#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

# The private key and address of the bank.
# Swap these into program.json, when running transactions as the first bidder.
# "private_key": "APrivateKey1zkpHtqVWT6fSHgUMNxsuVf7eaR6id2cj7TieKY1Z8CP5rCD",
# "address": "aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a"

# The private key and address of the user.
# Swap these into program.json, when running transactions as the second bidder.
# "private_key": "APrivateKey1zkp75cpr5NNQpVWc5mfsD9Uf2wg6XvHknf82iwB636q3rtc"
# "address": "aleo1zeklp6dd8e764spe74xez6f8w27dlua3w7hl4z2uln03re52egpsv46ngg"

# Swap in the private key and address to program.json.
echo "{
  \"program\": \"momentswap.aleo\",
  \"version\": \"0.0.0\",
  \"description\": \"\",
  \"development\": {
      \"private_key\": \"APrivateKey1zkpHtqVWT6fSHgUMNxsuVf7eaR6id2cj7TieKY1Z8CP5rCD\",
      \"address\": \"aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a\"
  },
  \"license\": \"MIT\"
}" > program.json

# create_public_account
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  public_domain_name  |         sui    |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run create_public_account aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a 7566697field;

# create_private_account
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  private_domain_name  |         sui   |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run create_private_account aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a 7566697field;


# burn_public_account
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  burn_public_account  |         sui   |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run burn_public_account "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    domain_name: 7566697field.private,
    _nonce: 57521402236049957071750783705378613942123953670216468086528148619175310513group.public
}";


# burn_private_account
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  burn_private_account  |        sui   |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run burn_private_account "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    domain_name: 7566697field.private,
    _nonce: 57521402236049957071750783705378613942123953670216468086528148619175310513group.public
}";


# create_public_moment
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  create_public_moment  |        sui   |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run create_public_moment aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a 13298649544522489735317862022990397104084220483917467810694527882671470151026591688175478131field 10000u64;


# delete_public_moment
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  delete_public_moment  |        sui   |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run delete_public_moment "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    metadata_uri: 1410441015758891625902009715147341271747846773496812835022414996323727951771field.private,
    time: 10000u64.private,
    _nonce: 1229123227472045247678275196046320312059603450344399430495223117081748009192group.public
}";

# transfer_public
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  transfer_public  |        sui   |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_public "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    metadata_uri: 1410441015758891625902009715147341271747846773496812835022414996323727951771field.private,
    time: 10000u64.private,
    _nonce: 1229123227472045247678275196046320312059603450344399430495223117081748009192group.public
}" aleo1zeklp6dd8e764spe74xez6f8w27dlua3w7hl4z2uln03re52egpsv46ngg;

# transfer_private
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  transfer_private  |        sui   |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_private "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    metadata_uri: 1410441015758891625902009715147341271747846773496812835022414996323727951771field.private,
    time: 10000u64.private,
    _nonce: 1229123227472045247678275196046320312059603450344399430495223117081748009192group.public
}" aleo1zeklp6dd8e764spe74xez6f8w27dlua3w7hl4z2uln03re52egpsv46ngg;

# transfer_private_to_public
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  transfer_private_to_public  |  sui   |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_private_to_public "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    metadata_uri: 1410441015758891625902009715147341271747846773496812835022414996323727951771field.private,
    time: 10000u64.private,
    _nonce: 1229123227472045247678275196046320312059603450344399430495223117081748009192group.public
}" aleo1zeklp6dd8e764spe74xez6f8w27dlua3w7hl4z2uln03re52egpsv46ngg;

# transfer_public_to_private
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  delete_public_moment  |        sui   |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_public_to_private "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    metadata_uri: 1410441015758891625902009715147341271747846773496812835022414996323727951771field.private,
    time: 10000u64.private,
    _nonce: 1229123227472045247678275196046320312059603450344399430495223117081748009192group.public
}" aleo1zeklp6dd8e764spe74xez6f8w27dlua3w7hl4z2uln03re52egpsv46ngg;