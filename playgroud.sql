select * from page;
select * from wiki_links;
select count(*) from wiki_links;

TRUNCATE wiki_data_ru;

-- [CSV INSERT]

SELECT t.*, CTID
                   FROM public.links_only_clear t
                   LIMIT 501

explain analyse select links_only_clear.source_name,
       links_only_clear.dest_name,
       wdr.dest_name
                from links_only_clear
                    cross join links_only_clear wdr
                        where links_only_clear.dest_name=wdr.source_name;

explain analyse select links_only_clear.source_name,
       links_only_clear.source_url,
       links_only_clear.dest_name,
       links_only_clear.dest_url,
       wdr.dest_name,
       wdr.dest_url,
       wdr2.dest_name,
       wdr2,wdr.dest_url
                from links_only_clear
                    cross join links_only_clear wdr
                        cross join links_only_clear wdr2
                            where links_only_clear.dest_name=wdr.source_name and wdr.dest_name=wdr2.source_name and wdr2.dest_name='(25143) Итокава' and wdr.source_name='Лезгины';

explain select links_only_clear.source_name,
       links_only_clear.source_url,
       links_only_clear.dest_name,
       links_only_clear.dest_url,
       wdr.dest_name,
       wdr.dest_url,
       wdr2.dest_name,
       wdr2,wdr.dest_url
                from links_only_clear
                    cross join links_only_clear wdr
                        cross join links_only_clear wdr2
                            where links_only_clear.dest_name=wdr.source_name and wdr.dest_name=wdr2.source_name;
;



