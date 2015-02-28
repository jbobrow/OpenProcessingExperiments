
Node[] node;
int corners = 12;
int nodes = 100;
void setup(){
  background(100);
  smooth();
  size(900,450);
  node = new Node[nodes]; 
  for(int i=0;i<node.length;i++){
    node[i]= new Node(i);
  }
}
void draw(){
  background(100);
  grid();
  for(int i=0;i<node.length;i++){
    node[i].update();
    node[i].display(); 
  }
}

void grid(){
  stroke(80);
  strokeWeight(1);
  for(int i=0;i<width;i+=20){
    line(i,0,i,height);
  }
  for(int i=0;i<height;i+=20){
    line(0,i,width,i);
  }
}


class Node{
  PVector pos,base,min,tension;
  PVector vel=new PVector(0,0);
  PVector acc=new PVector(0,0);
  float rad = 10;
  int id;
  
  Node(int _id){
    id=_id;
    base=new PVector(0,0);
    pos=new PVector(random(width),random(height));
    int maxNodes = corners;
    int offset=10+3*id*id/100;   
    base.x=sin(
            radians(
              360/maxNodes*id
              )) * 
               offset + 
                  (width/2);
    base.y=cos(
            radians(
              360/maxNodes*id
              )) * 
                offset + 
                  (height/2);  
  }
  
  void display(){
    noStroke();
  //  fill(255,0,0);
  //  ellipse(base.x,base.y,9,9); //anchor-points
    fill(0);
    ellipse(pos.x,pos.y,rad,rad);
    stroke(0);
    strokeWeight(2);
    if(id+1<node.length) 
      line(pos.x,pos.y,node[id+1].pos.x,node[id+1].pos.y);
    if(id+corners<node.length)
      line(pos.x,pos.y,node[id+corners].pos.x,node[id+corners].pos.y);
  }
  
  void update(){
    //return to basePoint if moved, bouncyness
    
    PVector mouse = new PVector(mouseX,mouseY);
    if( pos.dist(mouse)<2*rad){ 
      pos.set(mouse);
    }else{
    acc.x = 0.1 * (base.x-pos.x);
    acc.y = 0.1 * (base.y-pos.y);
    
    vel.add(acc);
    vel.mult(0.9);
    
    pos.add(vel); 
    acc = new PVector(0,0);
    tension();
    } 
  }

  void tension(){
    // movement through other points!
    
    
    //find a more elegant way to write this! 
    
    int target = 0;
        if(id+1<node.length){
          PVector dir = new PVector(node[id+1].pos.x,node[id+1].pos.y);
          dir.sub(pos);
          dir.normalize();
          float distance = pos.dist(node[id+1].pos);
          dir.mult(distance*distance*.0001);
          acc.add(dir);
          pos.add(acc);
      } 
      if(id-1>=0){
          PVector dir = new PVector(node[id-1].pos.x,node[id-1].pos.y);
          dir.sub(pos);
          dir.normalize();
          float distance = pos.dist(node[id-1].pos);
          dir.mult(distance*distance*.0001);
          acc.add(dir);
          pos.add(acc);
      }
        if(id+corners<node.length){
          PVector dir = new PVector(node[id+corners].pos.x,node[id+corners].pos.y);
          dir.sub(pos);
          dir.normalize();
          float distance = pos.dist(node[id+corners].pos);
          dir.mult(distance*distance*.0001);
          acc.add(dir);
          pos.add(acc);
        }
        if(id-corners>=0){
          PVector dir = new PVector(node[id-corners].pos.x,node[id-corners].pos.y);
          dir.sub(pos);
          dir.normalize();
          float distance = pos.dist(node[id-corners].pos);
          dir.mult(distance*distance*.0001);
          acc.add(dir);
          pos.add(acc);
        }
  }
}                               
