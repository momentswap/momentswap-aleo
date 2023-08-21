// The 'momentswap' program.
program momentswap.aleo {
    record Identifier {
        owner: address,
        gates: u64,
        name: field,
        nick_name: field,
        phone_number: field,
        identification_number: field,
        nation: field,
    }

    record Moment {
        owner: address,
        gates: u64,
        metadata_uri: field,
        time: u64,
    }

    transition create_public_identifier (
        public creator: address, 
        public name: field, 
        public nick_name: field, 
        public phone_number: field, 
        public identification_number: field, 
        public nation: field) -> Identifier {
        assert_eq(self.caller, creator);
        let new_identifier: Identifier = Identifier{
            owner: creator,
            gates: 0u64,
            name: name,
            nick_name: nick_name,
            phone_number: phone_number,
            identification_number: identification_number,
            nation: nation,
        };
        return new_identifier;
    }

    transition create_private_identifier (
        creator: address, 
        name: field, 
        nick_name: field, 
        phone_number: field, 
        identification_number: field, 
        nation: field) -> Identifier {
        assert_eq(self.caller, creator);
        let new_identifier: Identifier = Identifier{
            owner: creator,
            gates: 0u64,
            name: name,
            nick_name: nick_name,
            phone_number: phone_number,
            identification_number: identification_number,
            nation: nation,
        };
        return new_identifier;
    }

    transition burn_public_identifier (public identifier: Identifier) {
        assert_eq(self.caller, identifier.owner);
        return ;
    }

    transition burn_private_identifier (identifier: Identifier) {
        assert_eq(self.caller, identifier.owner);
        return ;
    }

    transition create_public_moment (public creator: address, public param_metadata_uri: field, public param_time: u64) -> Moment {
        assert_eq(self.caller, creator);
        let new_moment: Moment = Moment{
            owner: creator,
            gates: 0u64,
            metadata_uri: param_metadata_uri,
            time: param_time,
        };
        return new_moment;
    }

    transition create_private_moment (creator: address, param_metadata_uri: field, param_time: u64) -> Moment {
        assert_eq(self.caller, creator);
        let new_moment: Moment = Moment{
            owner: creator,
            gates: 0u64,
            metadata_uri: param_metadata_uri,
            time: param_time,
        };
        return new_moment;
    }

    transition share_private_moment (moment: Moment, sharer: address) -> (Moment, Moment) {
        assert_eq(self.caller, moment.owner);
        let share_moment: Moment = Moment{
            owner: sharer,
            gates: 0u64,
            metadata_uri: moment.metadata_uri,
            time: moment.time,
        };
        return (moment, share_moment);
    }
    

    transition delete_public_moment (public moment: Moment)  {
        assert_eq(self.caller, moment.owner);
        
        return ;
    }

    transition delete_private_moment (public moment: Moment)  {
        assert_eq(self.caller, moment.owner);
        
        return ;
    }

    transition transfer_public (public sender: Moment, public receiver: address) -> Moment {
        assert_eq(self.caller, sender.owner);
        let new_moment: Moment = Moment{
            owner: receiver,
            gates: sender.gates,
            metadata_uri: sender.metadata_uri,
            time: sender.time,
        };
        return new_moment;
    }

    transition transfer_private (sender: Moment, receiver: address) -> Moment {
        assert_eq(self.caller, sender.owner);
        let new_moment: Moment = Moment{
            owner: receiver,
            gates: sender.gates,
            metadata_uri: sender.metadata_uri,
            time: sender.time,
        };
        return new_moment;
    }

    transition transfer_private_to_public (sender: Moment, public receiver: address) -> Moment {
        assert_eq(self.caller, sender.owner);
        let new_moment: Moment = Moment{
            owner: receiver,
            gates: sender.gates,
            metadata_uri: sender.metadata_uri,
            time: sender.time,
        };
        return new_moment;
    }

    transition transfer_public_to_private (public sender: Moment, receiver: address) -> Moment {
        assert_eq(self.caller, sender.owner);
        let new_moment: Moment = Moment{
            owner: receiver,
            gates: sender.gates,
            metadata_uri: sender.metadata_uri,
            time: sender.time,
        };
        return new_moment;
    }
    
}
