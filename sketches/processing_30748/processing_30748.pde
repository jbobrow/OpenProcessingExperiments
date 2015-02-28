
class World{
  ArrayList pop;
  World(){
    pop = new ArrayList();
  }
  
  void addNode(Node node){
    pop.add(node);
  }
  
  void update2D(int w, int h){
    for(int i = 0;i< pop.size(); i++){
      Node node = (Node)pop.get(i);
      node.updateLiveNeighbors();
      node.update2D(w,h);
    }
  }
  
  void update3D(int bs){
    for(int i = 0; i<pop.size(); i++){
      Node node = (Node)pop.get(i);
      node.updateLiveNeighbors();
      node.update3D(bs);
    }
  }
  
  void nextGeneration(){
    ArrayList newLive = new ArrayList();
    for(int i = 0;i< pop.size(); i++){
      Node node = (Node)pop.get(i);
      int up = 0;
      for(int n = 0; n<node.neighbors.size();n++){
        int nei = (Integer)node.neighbors.get(n);
        Node other = (Node)pop.get(nei);
       if(other.pos.z < node.pos.z){
         up++;
       }
      }
      
      if(node.state==false && node.liveNeighbors==3 && up==5){
        newLive.add(true);
      }else if((node.state==true)&&(node.liveNeighbors==10)&&(up>=4)&&(up<=6)){
        newLive.add(true);
      }else if(node.state==true && node.liveNeighbors<=1){
        newLive.add(false);
      }else{
        newLive.add(false);
      }
    }
    for(int i = 0; i<pop.size(); i++){
      Node node = (Node)pop.get(i);
      boolean b = (Boolean)newLive.get(i);
      node.changeState(b);
    }
  }
  
  /*
  void nextGeneration(){
    ArrayList newLive = new ArrayList();
    for(int i = 0;i< pop.size(); i++){
      Node node = (Node)pop.get(i);
      int live = 0;
      for(int n = 0; n<node.neighbors.size();n++){
        int nei = (Integer)node.neighbors.get(n);
        Node other = (Node)pop.get(nei);
        if(other.state){
          live++;
        }
      }
      
      if(node.state==false && live==3){
        newLive.add(true);
      }else if((node.state==true)&&(live==2 || live==3 || live==6)){
        newLive.add(true);
      }else if(node.state==true && live<=1){
        newLive.add(false);
      }else{
        newLive.add(false);
      }
    }
    for(int i = 0; i<pop.size(); i++){
      Node node = (Node)pop.get(i);
      boolean b = (Boolean)newLive.get(i);
      node.changeState(b);
    }
  }
  */
}

