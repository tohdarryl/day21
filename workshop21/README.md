# workshop21

## SQL query
1. For query for rows of data from DB, with limit, offset
```
List<Customer> cList = jdbctemplate.query( <SQLQuery> , BeanPropertyRowMapper.newInstance(Customer.class), limit, offset)
```

2. For query for single row of data from DB, filtered using customer id
```
Customer c = jdbctemplate.queryForObject( <SQLQuery> , 
BeanPropertyRowMapper.newInstance(Customer.class), id)
```