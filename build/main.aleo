program momentswap.aleo;

record Identifier:
    owner as address.private;
    gates as u64.private;
    name as field.private;
    nick_name as field.private;
    phone_number as field.private;
    identification_number as field.private;
    nation as field.private;

record Moment:
    owner as address.private;
    gates as u64.private;
    metadata_uri as field.private;
    time as u64.private;


function create_public_identifier:
    input r0 as address.public;
    input r1 as field.public;
    input r2 as field.public;
    input r3 as field.public;
    input r4 as field.public;
    input r5 as field.public;
    assert.eq self.caller r0;
    cast r0 0u64 r1 r2 r3 r4 r5 into r6 as Identifier.record;
    output r6 as Identifier.record;


function create_private_identifier:
    input r0 as address.private;
    input r1 as field.private;
    input r2 as field.private;
    input r3 as field.private;
    input r4 as field.private;
    input r5 as field.private;
    assert.eq self.caller r0;
    cast r0 0u64 r1 r2 r3 r4 r5 into r6 as Identifier.record;
    output r6 as Identifier.record;


function burn_public_identifier:
    input r0 as Identifier.record;
    assert.eq self.caller r0.owner;


function burn_private_identifier:
    input r0 as Identifier.record;
    assert.eq self.caller r0.owner;


function create_public_moment:
    input r0 as address.public;
    input r1 as field.public;
    input r2 as u64.public;
    assert.eq self.caller r0;
    cast r0 0u64 r1 r2 into r3 as Moment.record;
    output r3 as Moment.record;


function create_private_moment:
    input r0 as address.private;
    input r1 as field.private;
    input r2 as u64.private;
    assert.eq self.caller r0;
    cast r0 0u64 r1 r2 into r3 as Moment.record;
    output r3 as Moment.record;


function share_private_moment:
    input r0 as Moment.record;
    input r1 as address.private;
    assert.eq self.caller r0.owner;
    cast r1 0u64 r0.metadata_uri r0.time into r2 as Moment.record;
    output r0 as Moment.record;
    output r2 as Moment.record;


function delete_public_moment:
    input r0 as Moment.record;
    assert.eq self.caller r0.owner;


function delete_private_moment:
    input r0 as Moment.record;
    assert.eq self.caller r0.owner;


function transfer_public:
    input r0 as Moment.record;
    input r1 as address.public;
    assert.eq self.caller r0.owner;
    cast r1 r0.gates r0.metadata_uri r0.time into r2 as Moment.record;
    output r2 as Moment.record;


function transfer_private:
    input r0 as Moment.record;
    input r1 as address.private;
    assert.eq self.caller r0.owner;
    cast r1 r0.gates r0.metadata_uri r0.time into r2 as Moment.record;
    output r2 as Moment.record;


function transfer_private_to_public:
    input r0 as Moment.record;
    input r1 as address.public;
    assert.eq self.caller r0.owner;
    cast r1 r0.gates r0.metadata_uri r0.time into r2 as Moment.record;
    output r2 as Moment.record;


function transfer_public_to_private:
    input r0 as Moment.record;
    input r1 as address.private;
    assert.eq self.caller r0.owner;
    cast r1 r0.gates r0.metadata_uri r0.time into r2 as Moment.record;
    output r2 as Moment.record;
