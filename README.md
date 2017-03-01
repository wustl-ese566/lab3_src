# lab3_src
 
**[Click](http://classes.engineering.wustl.edu/ese566/Lab/Lab3_description.pdf) to view the description of this lab.**

## Discription
This code is for Lab 3 of class ESE566A Modern System-on-Chip Design, Spring 2017, Washington University in St. Louis. The lab is a simple cache controller design. Through this lab you will learn the basic concept of cache controller. 

We say it is a simple cache controller because we simplified the design a lot compare to a real cache controller:
1. We fix all the bus width to word (4-byte) for both host and ram side interface.
2. We assume the external memory never assert the busy flag.

### Task 1
Given the baseline cache controller, you should design your own direct-map and two-way associative cache controller.
The file CacheController.v in TwoWayAssociative folder is the template for your design.

### Task 2
Use design compiler to compile both direct-map and two-way associative cache controller and place and route in encounter. Then in your report, compare the power, area, timing and other facts that you think are important of these different cache controller and briefly explain the result. It is better to visualize your experimental results(tables and/or plots).
