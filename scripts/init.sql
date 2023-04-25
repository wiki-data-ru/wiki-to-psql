create extension citext;



drop table if exists page cascade;
create table page (
    page_id bigserial primary key,
    page_name varchar(32) unique,
    page_image_base64 citext,
    page_summary citext,
    page_added timestamp default NOW()
);

drop table if exists wiki_links cascade;
create table if not exists wiki_links (
    wiki_page_id bigserial primary key,
    page_source varchar(1024) references page(page_name),
    page_source_url varchar(1024) not null,    
    page_dest varchar(1024) references page(page_name),
    page_dest_url varchar(1024)
);