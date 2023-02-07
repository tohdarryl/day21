package sg.edu.nus.iss.workshop21.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders {
    private int id;
    private int employeeId;
    private int customerId;
    private Date orderDate;
    private Date shippedDate;
    private int shipperId;
    private String shipName;
    private String shipAddress;
    private String shipCity;
    private String shipStateProvince;
    private String shipZipPostalCode;
    private String shipCountryRegion;
    private double shippingFee;
    private double taxes;
    private String paymentType;
    private Date paidDate;
    private String notes;
    private double taxRate;
    //use Byte for tinyint (MySQL type)
    private Byte taxStatusId;
    private Byte statusId;
}
