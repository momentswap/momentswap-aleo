program space.aleo;

record SpaceANS:
    owner as address.private;
    gates as u64.private;
    expire_seconds as u64.private;
    primary_space_id as u64.private;
    domain_name as field.private;

