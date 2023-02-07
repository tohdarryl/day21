package sg.edu.nus.iss.workshop21.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import sg.edu.nus.iss.workshop21.model.Customers;
import sg.edu.nus.iss.workshop21.model.Orders;

@Repository
public class CustomersRepo {

    @Autowired
    JdbcTemplate jdbcTemplate;

    String selectSQL = "select * from customers limit ? offset ?";
    String selectByIdSQL = "select * from customers where id = ?";
    String selectOrdersByCustId = "select * from orders where customer_id = ?";

    public List<Customers> findAll(Integer limit, Integer offset) {
        return jdbcTemplate.query(selectSQL, BeanPropertyRowMapper.newInstance(Customers.class), limit, offset);
    }

    public Customers findById(Integer id){
        return jdbcTemplate.queryForObject(selectByIdSQL, BeanPropertyRowMapper.newInstance(Customers.class), id);
    }

    public Orders[] findOrdersByCustId(Integer id){
        List<Orders> oList = jdbcTemplate.query(selectOrdersByCustId, BeanPropertyRowMapper.newInstance(Orders.class), id);
        Orders[] o = new Orders[oList.size()];  
        return oList.toArray(o);
    }
}
