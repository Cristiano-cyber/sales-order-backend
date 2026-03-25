namespace sales.order;

using { cuid, managed } from '@sap/cds/common';

entity SalesOrders : cuid, managed {
  orderNumber  : String(10);
  customerName : String(100);
  orderDate    : Date;
  totalAmount  : Decimal(15,2);
  status       : String(20) enum {
    Open = 'Open';
    Confirmed = 'Confirmed';
    Delivered = 'Delivered';
    Cancelled = 'Cancelled';
  };
  items        : Composition of many SalesOrderItems on items.salesOrder = $self;
}

entity SalesOrderItems : cuid {
  salesOrder   : Association to SalesOrders;
  productName  : String(100);
  quantity     : Integer;
  unitPrice    : Decimal(10,2);
  totalPrice   : Decimal(15,2);
}