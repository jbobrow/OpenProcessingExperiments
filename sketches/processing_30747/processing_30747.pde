
import toxi.geom.*;

World world;
int num = 50;

void setup(){
  size(500,500);
  //frameRate(30);
  world = new World();
  
  for(int i = 0; i<num; i++){
    for(int n = 0; n<num; n++){
      int r = int(random(2));
      boolean b = true;
      if(r == 0){
        b = false;
      }else{
        b = true;
      }
      Node node = new Node(width/num*i,height/num*n,b);
      world.addNode(node);
    }
  }
  for(int i = 0; i<world.pop.size(); i++){
    Node node = (Node)world.pop.get(i);
    node.makeNeighbors(world.pop);
  }
  
}

void draw(){
  background(0);
  world.update(width/num,height/num);
  world.nextGeneration();
}

class Node{
  int x;
  int y;
  Vec2D pos;
  ArrayList neighbors;
  boolean state;
  
  Node(int _x, int _y,boolean _state){
    x = _x;
    y = _y;
    pos = new Vec2D(x,y);
    neighbors = new ArrayList();
    state = _state;
  }
  
  void update(int w, int h){
    if(state){
      fill(255,0,0);
    }else{
      fill(255);
    }
    rect(x,y,w,h);
  }
  
  void changeState(boolean b){
    state = b;
  }
  
  void makeNeighbors(ArrayList pop){
    neighbors = new ArrayList();
    for(int i = 0; i<pop.size(); i++){
      Node other = (Node)pop.get(i);
      if(pos.distanceTo(other.pos)<width/num*1.5 && pos.distanceTo(other.pos)>0){
        neighbors.add(i);
      }
    }
  }
}

class World{
  ArrayList pop;
  World(){
    pop = new ArrayList();
  }
  
  void addNode(Node node){
    pop.add(node);
  }
  
  void update(int w, int h){
    for(int i = 0;i< pop.size(); i++){
      Node node = (Node)pop.get(i);
      node.update(w,h);
    }
  }
  
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
}

