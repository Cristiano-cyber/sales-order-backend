using { managed } from '@sap/cds/common';

namespace sales;

entity SalesOrderHeaders: managed {
  key id: UUID;
      customer: Association to Customers;
      totalAmount: Decimal(15,2);
      Items: Composition of many SalesOrderItems on Items.header = $self;
}

entity SalesOrderItems {
  key id: UUID;
      header: Association to SalesOrderHeaders;
      product: Association to Products;
      quantity: Integer;
      price: Decimal(15,2);
}

entity Customers {
  key id: UUID;
      firstName: String(100);
      lastName: String(100);
      email: String(255);
}

entity Products {
  key id: UUID;
      name: String(255);
      price: Decimal(15,2);
}



/* namespace sales.order;

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

*/