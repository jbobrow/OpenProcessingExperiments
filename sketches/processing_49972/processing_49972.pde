
class Brand {
   
  // instance variables
  String style;
  String customers;
  String history;
   
  // "outbound" relations
  Flannel[] flannel;
  Store[] store;
   
  // constructor
  Brand(String style_, String customers_, String history_, Flannel[] flannel_, Store[] store_) {
    style = style_;
    customers = customers_;
    history = history_;
    flannel = flannel_;
    store = store_;
  }
}

