package sg.edu.nus.iss.workshop21.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.json.Json;
import jakarta.json.JsonArray;
import jakarta.json.JsonArrayBuilder;
import sg.edu.nus.iss.workshop21.model.Customers;
import sg.edu.nus.iss.workshop21.model.Orders;
import sg.edu.nus.iss.workshop21.repository.CustomersRepo;

@RestController
@RequestMapping("")
public class CustRestController {

    @Autowired
    CustomersRepo custRepo;

    @GetMapping(path = "api/customers", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Customers>> getCustomers(@RequestParam(defaultValue = "5") Integer limit,
            @RequestParam(defaultValue = "0") Integer offset) {
        List<Customers> cList = custRepo.findAll(limit, offset);

        if (cList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<>(cList, HttpStatus.OK);
        }
    }

    @GetMapping("api/customer/{id}")
    public ResponseEntity<Customers> getCustomerById(@PathVariable("id") Integer id) {
        Customers c = custRepo.findById(id);

        if (c == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<>(c, HttpStatus.OK);
        }
    }

    // @GetMapping("api/customer/{id}/orders")
    // public ResponseEntity<Orders[]> getOrdersByCustId(@PathVariable("id") Integer
    // id){

    // if(custRepo.findById(id) == null){
    // return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    // }

    // Orders[] o = custRepo.findOrdersByCustId(id);
    // return ResponseEntity
    // .status(HttpStatus.OK)
    // .contentType(MediaType.APPLICATION_JSON)
    // .body(o);

    // }

    @GetMapping("api/customer/{id}/orders")
    public ResponseEntity<String> getOrdersByCustId(@PathVariable("id") Integer id) {

        JsonArray result = null;
        // Query the database for orders
        List<Orders> oList = custRepo.findOrdersByCustId(id);

        // Build the result
        JsonArrayBuilder arrayBuilder = Json.createArrayBuilder();
        for (Orders o : oList)
        // Add Convert 'Orders' JavaObject to JsonObject and add into JsonArray
            arrayBuilder.add(o.toJSON());
        // Build JsonArray
        result = arrayBuilder.build();

        if (oList.isEmpty()) {
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .contentType(MediaType.APPLICATION_JSON)
                    .body("{\"error_mesg\": \"record not found\"}");
        }

        return ResponseEntity
                .status(HttpStatus.OK)
                .contentType(MediaType.APPLICATION_JSON)
                .body(result.toString());

    }
}
