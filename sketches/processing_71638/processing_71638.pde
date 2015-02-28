
class Network{
  Particle p;
  ArrayList gGrid;
  ArrayList lGrid;
  
  
  Network(){
    gGrid=new ArrayList();
  }
  
  //set network
  void setNode(int index, Particle pNode){
    lGrid=new ArrayList();
    lGrid.add(pNode);
    gGrid.add(lGrid);
  }
 
  void setNeighbor(int index, Particle pNeighbor){
     lGrid=(ArrayList)gGrid.get(index);
     lGrid.add(pNeighbor);
  }
 
  //get network
  Particle getNode(int index){
    lGrid=(ArrayList)gGrid.get(index);
    p=(Particle)lGrid.get(0);
    return p;
  }
  
  Particle getNeighbor(int index, int i){
    lGrid=(ArrayList)gGrid.get(index);
    p=(Particle)lGrid.get(i);
    return p;
  }
  
  //size
  int getSize(){
    return gGrid.size();
  }
  int getNeighborSize(int index){
    lGrid=(ArrayList)gGrid.get(index);
    return lGrid.size();
  }
        
}

  

