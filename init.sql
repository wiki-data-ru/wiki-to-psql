create extension citext;

drop table if exists wiki_links cascade;
create table if not exists wiki_links (
    wiki_link_id bigserial primary key,
    page_from bigint references page(page_id),
    page_to bigint references page(page_id)
);

drop table if exists page cascade;
create table page (
    page_id bigserial primary key,
    page_name varchar(32) unique,
    page_description citext,
    page_added timestamp default NOW()
);