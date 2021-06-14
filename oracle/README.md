# OracleDatabase

[Link de acesso: http://localhost:8088/apex/f?p=4950 ](http://localhost:8088/apex/f?p=4950)

## startup

```sh
$ docker exec -it --user=oracle oracle bash
```

### Sql

```sh
$ sqlplus
```

Enter user-name: system

Enter password: oracle

### unlock hr account

```sql
SQL> alter user hr identified by hr account unlock;
```

Enter user-name: hr

Enter password: hr

```sql
SQL> desc employees;
```

### Access workspace

[http://localhost:8088/apex/f?p=4500](http://localhost:8088/apex/f?p=4500)

```sql
SQL> select * from employees;
```
