
Node[] node;

void setup(){
  size(900,450);
  smooth();
  node = new Node[1];
  for(int i=0;i<node.length;i++){
    node[i]= new Node(i,width/2,height/2);
  }
}

void draw(){
    background(200); 
   // fill(200,95); //for further awesomeness
  //  rect(0,0,width,height);
  for(int i=0;i<node.length;i++){
    node[i].display();
  }
}
/***********************************
*  NODEs -> unlimited possibilities ;)
***********************************/
class Node{
  int id;
  float x,y,pos,xx,yy;
  Moon[] moon;
  Node(int _id,float _x,float _y){
    id=_id;
    x=_x;
    y=_y;
   
    moon=new Moon[2];
    for(int i=0;i<moon.length;i++)
      moon[i]=new Moon(x,y,300,.01,20);
  }
  /***********************************/
  void display(){
    fill(0);
    ellipse(x,y,20,20);
    for(int i=0;i<moon.length;i++){
      line(x,y,moon[i].x,moon[i].y);
      moon[i].display();
      moon[i].update(x,y);
    }
  }
}

/***********************************
*  MOONs -> this is where the magic happenes :D
***********************************/
class Moon{
  float x,y,xx,yy,distance,pos,speed,size;
  boolean active;
  color col;
  Moon[] moon;
  Moon(float _x, float _y,float _distance,float _speed,float _size){
    distance=_distance*.6;
    active=false;
    col = color(random(255),0,0);
    pos=random(20);
    speed=2*_speed*random(.8,1.2);
    size=.8*_size;
    xx=_x;
    yy=_y;
    x=xx+distance*sin(pos);
    y=yy+distance*cos(pos);
    
    if(distance>20){
      active=true;
      moon = new Moon[2];
      for(int i=0;i<moon.length;i++)
        moon[i]=new Moon(x,y,distance,speed,size);
    }
  }
  /***********************************/
  void display(){
    fill(col);
    ellipse(x,y,size,size);
    
    if(!active)
      return;
      
    for(int i=0;i<moon.length;i++){
      line(x,y,moon[i].x,moon[i].y);
      moon[i].display();
    }
    
  }
  /***********************************/
  void update(float _x,float _y){
    xx=_x;
    yy=_y;
    
    pos += speed;
    
    x=xx+distance*sin(pos);
    y=yy+distance*cos(pos);
    if(active){
      for(int i=0;i<moon.length;i++){
        moon[i].update(x,y);
      }
    }
  }
}
