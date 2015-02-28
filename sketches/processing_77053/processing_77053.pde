
class ControlLayer
{
  ArrayList<Layer> listLayer ;
  float rowHeight ;
  // max quantity of layers
  int maxLayer = 10 ;
  
  ControlLayer(float rowHeight)
  {
    this.rowHeight = rowHeight ;
    listLayer = new ArrayList<Layer>() ;
  }
  //////////////////
  void addLayer (PVector p, PVector s, int ID)
  {
    for ( Layer lyr : listLayer ) {
      
      if (lyr.detection() || listLayer.size() > maxLayer-1) {
        return ; 
      }
      
    }
    //Layer lyr = new Layer(p, s, rowHeight, Layer.ID1) ; // example to call the ID directly from the class Layer
   Layer lyr = new Layer(p, s, rowHeight, ID) ;
    listLayer.add(lyr) ;
}
  
  void display()
  {    
    for ( int i = 0 ; i < listLayer.size() ; i ++ ) {
      Layer lyr = (Layer) listLayer.get(i) ;
      lyr.drag(listLayer) ; 
      lyr.update() ;
      lyr.collision(listLayer) ;
      lyr.display() ;
      lyr.ranking( listLayer) ;
      lyr.info(lyr.rank(), (i+1)) ;      
    }
  }
}

