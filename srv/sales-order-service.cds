using sales.order as db from '../db/schema';

service SalesOrderService {
  entity SalesOrders as projection on db.SalesOrders;
  entity SalesOrderItems as projection on db.SalesOrderItems;
}