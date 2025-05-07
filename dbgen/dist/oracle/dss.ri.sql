ALTER TABLE part
    ADD CONSTRAINT pk_part PRIMARY KEY(p_partkey);

ALTER TABLE supplier
    ADD CONSTRAINT pk_supplier PRIMARY KEY(s_suppkey);

ALTER TABLE partsupp
    ADD CONSTRAINT pk_partsupp PRIMARY KEY(ps_partkey, ps_suppkey);

ALTER TABLE customer
    ADD CONSTRAINT pk_customer PRIMARY KEY(c_custkey);

ALTER TABLE orders
    ADD CONSTRAINT pk_orders PRIMARY KEY(o_orderkey);

ALTER TABLE lineitem
    ADD CONSTRAINT pk_lineitem PRIMARY KEY(l_linenumber, l_orderkey);

ALTER TABLE nation
    ADD CONSTRAINT pk_nation PRIMARY KEY(n_nationkey);

ALTER TABLE region
    ADD CONSTRAINT pk_region PRIMARY KEY(r_regionkey);

-- 1.4.2.3

ALTER TABLE partsupp
    ADD CONSTRAINT fk_partsupp_part FOREIGN KEY(ps_partkey) REFERENCES part(p_partkey);

ALTER TABLE partsupp
    ADD CONSTRAINT fk_partsupp_supplier FOREIGN KEY(ps_suppkey) REFERENCES supplier(s_suppkey);

ALTER TABLE customer
    ADD CONSTRAINT fk_customer_nation FOREIGN KEY(c_nationkey) REFERENCES nation(n_nationkey);

ALTER TABLE orders
    ADD CONSTRAINT fk_orders_customer FOREIGN KEY(o_custkey) REFERENCES customer(c_custkey);

ALTER TABLE lineitem
    ADD CONSTRAINT fk_lineitem_order FOREIGN KEY(l_orderkey) REFERENCES orders(o_orderkey);

ALTER TABLE lineitem
    ADD CONSTRAINT fk_lineitem_part FOREIGN KEY(l_partkey) REFERENCES part(p_partkey);

ALTER TABLE lineitem
    ADD CONSTRAINT fk_lineitem_supplier FOREIGN KEY(l_suppkey) REFERENCES supplier(s_suppkey);

ALTER TABLE lineitem
    ADD CONSTRAINT fk_lineitem_partsupp FOREIGN KEY(l_partkey, l_suppkey)
        REFERENCES partsupp(ps_partkey, ps_suppkey);

-- 1.4.2.4 - 1

ALTER TABLE part
    ADD CONSTRAINT chk_part_partkey CHECK(p_partkey >= 0);

ALTER TABLE supplier
    ADD CONSTRAINT chk_supplier_suppkey CHECK(s_suppkey >= 0);

ALTER TABLE customer
    ADD CONSTRAINT chk_customer_custkey CHECK(c_custkey >= 0);

ALTER TABLE partsupp
    ADD CONSTRAINT chk_partsupp_partkey CHECK(ps_partkey >= 0);

ALTER TABLE region
    ADD CONSTRAINT chk_region_regionkey CHECK(r_regionkey >= 0);

ALTER TABLE nation
    ADD CONSTRAINT chk_nation_nationkey CHECK(n_nationkey >= 0);

-- 1.4.2.4 - 2

ALTER TABLE part
    ADD CONSTRAINT chk_part_size CHECK(p_size >= 0);

ALTER TABLE part
    ADD CONSTRAINT chk_part_retailprice CHECK(p_retailprice >= 0);

ALTER TABLE partsupp
    ADD CONSTRAINT chk_partsupp_availqty CHECK(ps_availqty >= 0);

ALTER TABLE partsupp
    ADD CONSTRAINT chk_partsupp_supplycost CHECK(ps_supplycost >= 0);

ALTER TABLE orders
    ADD CONSTRAINT chk_orders_totalprice CHECK(o_totalprice >= 0);

ALTER TABLE lineitem
    ADD CONSTRAINT chk_lineitem_quantity CHECK(l_quantity >= 0);

ALTER TABLE lineitem
    ADD CONSTRAINT chk_lineitem_extendedprice CHECK(l_extendedprice >= 0);

ALTER TABLE lineitem
    ADD CONSTRAINT chk_lineitem_tax CHECK(l_tax >= 0);

-- 1.4.2.4 - 3

ALTER TABLE lineitem
    ADD CONSTRAINT chk_lineitem_discount CHECK(l_discount >= 0.00 AND l_discount <= 1.00);

-- 1.4.2.4 - 4

ALTER TABLE lineitem
    ADD CONSTRAINT chk_lineitem_ship_rcpt CHECK(l_shipdate <= l_receiptdate);
