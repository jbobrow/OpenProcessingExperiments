
import controlP5.*; 

ControlP5 controlP5; 
Bird bird; 
ArrayList birds; 
float maxvel=10; 
float maxmaxvel=10; 
int startbirds=20000; 
PVector mouse; 
float cap; 
boolean drawbg=true; 
boolean drawtrails=false; 
 
void setup() { 
  size(300,300,P2D); 
  background(0); 
  mouse = new PVector(mouseX,mouseY); 
  birds = new ArrayList(); 
  controlP5 = new ControlP5(this); 
  controlP5.addButton("background",0,20,20,80,19); 
  controlP5.addButton("trails",0,100,20,80,19); 
  for(int i=0;i<startbirds;i++) { 
    birds.add(new Bird(int(random(0,width)),int(random(0,height)),random(-1,1),random(-1,1),3,birds,birds.size()+1)); 
  } 
} 
 
void draw() { 
  if(drawbg){background(0);} 
  //if(drawtrails){fill(0,60);rect(0,0,width,height);} 
   
  controlP5.draw(); 
  for(int i=0;i<birds.size();i++) { 
    Bird bird = (Bird) birds.get(i); 
    bird.move(); 
    bird.display(); 
    bird.flock(); 
  } 
  mouse.x =mouseX; 
  mouse.y=mouseY; 
   
} 
void background() { 
  drawbg=!drawbg; 
} 
void trails() { 
  drawtrails=!drawtrails; 
  //if(drawtrails){drawbg=false;} 
} 
 
class Bird { 
   
  PVector location; 
  PVector velocity; 
  PVector acceleration=new PVector(0,0); 
  PVector dir=new PVector(0,0); 
  int siz; 
  ArrayList others; 
  int id; 
  float dirmag; 
  Bird other; 
   
  Bird(int startx,int starty, float startxvel,float startyvel,int siz_,ArrayList others_,int id_) { 
    location = new PVector(startx,starty); 
    velocity = new PVector(startxvel,startyvel); 
    siz=siz_; 
    others = others_; 
    id=id_; 
    if(id>1){other = (Bird) others.get(int(random(others.size())));} else { other = this;} 
  } 
  void flock() { 
      if(mousePressed) { 
        dir = PVector.sub(mouse,location); 
        dirmag=dir.mag(); 
        dir.normalize(); 
        dir.mult(0.5); 
        //cap=maxmaxvel; 
      } else { 
        dir = PVector.sub(other.location,location);  
        dir.normalize(); 
        dir.mult(.01); 
      } 
 
      acceleration=dir; 
       
       
    //} 
  } 
  void move() { 
    velocity.add(acceleration); 
    velocity.limit(maxvel); 
     
    location.add(velocity); 
    velocity.mult(0.994); 
     
 
  } 
   
  void display() { 
    stroke(velocity.mag()*40+50,acceleration.mag()*100+100,velocity.mag()*100+100,dirmag+20); 
    strokeWeight(1); 
    if(!drawtrails){ 
      point(location.x,location.y); 
    } else { 
      line(location.x,location.y,location.x-velocity.x*3,location.y-velocity.y*3); 
    }   
} 
   
 
} 


