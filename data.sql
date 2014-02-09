# Table Structures

# Entity 
# Parent Business Entity
create table Entity (
    EntityID serial primary key,
    Name varchar(200),
    TradeName varchar(200),
    LocationID integer,
    License varchar(50)
);

# Store
# Each Store (or vehicle?) for a given Business Entity
create table Store (
    StoreID serial primary key,
    EntityID integer,
    TradeName varchar(200),
    LocationID integer,
    License varchar(50)
);

# Locations
# A physical location - the parent entity and a store
# could share the same location item if it's a single store
# business.
# I'm also thinking that vehicles could have multiple locations
# if they have a preset route
create table Locations (
    LocationID serial primary key,
    Phone char(12),
    Location point,
    Address1 varchar(100),
    Address2 varchar(100),
    City varchar(100),
    State char(2),
    Zip char(10),
    Country varchar(50),
    County varcar(50)
);

# StoreTags
# One entry for each store/tag combination
create table StoreTags (
    StoreID integer,
    TagID integer
);

# Contacts
# One entry for each store/person combination
create table Contacts (
    StoreID integer,
    PersonID integer,
    Purpose text
);

# Schedules
# One entry for each store/schedule combination
create table Schedules (
    StoreID integer,
    ScheduleID integer
);

# ScheduleHours
# Each Schedule will have one/many Hour entries
# the DOW or Date will control what the start/end time
# represents. If DOW only then it's the default for that
# DOW and there could be further exception/override DOW/Date
# items to enable holiday or other closed/reduced hours items.
create table ScheduleHours (
    ScheduleID integer,
    ItemDOW integer,
    ItemDate date,
    StartHour integer,
    EndHour integer
);

# Tags
# All of the defined tags along with help/description text
create table Tags (
    TagID serial primary key,
    TagName char(50),
    TagDescription text
);

# People
# yep, contact info for people (kept very simple to avoid privacy issues)
create table People (
    PersonID serial primary key,
    Name varchar(100),
    Phone char(12)
);
