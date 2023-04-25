# Данные википедии в PSQL

# not-only-sql-daten-banken

Репозиторий работ по курсу



## Сборка контейнера с базой данных
```sh
make build
```

## Запуск контейнера с базой данных

```sh 
make start
```

```sql
wikidataru.public> select public.links_only_clear.source_name,
                          public.links_only_clear.dest_name,
                          wdr.dest_name
                                   from public.links_only_clear
                                       cross join public.links_only_clear wdr
                                           where public.links_only_clear.dest_name=wdr.source_name
```

```sql
wikidataru.public> explain analyse select links_only_clear.source_name,
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
                                               where links_only_clear.dest_name=wdr.source_name and wdr.dest_name=wdr2.source_name and wdr2.dest_name='(25143) Итокава' and wdr.source_name='Лезгины'
```
