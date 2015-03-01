
import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Box> boxes;


float time=0;

  
 Boundary d;
 int wait=1001;
 
void setup() {
  
  size(1200,600,P2D);
  boxes = new ArrayList<Box>();
  
  box2d = new  Box2DProcessing(this);
    
  box2d.createWorld();
  
  box2d.setGravity(0, 0);
   
   strokeWeight(1);
   
  // d= new Boundary(width/2,height/2,100,100);
}
 
void draw() {
  
  
   stroke(0);
   
  //background(255);
  
   
 
 // box2d.setGravity(random(-13,13), random(-10,10));
   
 float cl=random(100);
   
   box2d.step();


 fill(255-cl,80);
   rect(0,0,1200*2,600*2);
  
 //fill(cl);
 
   
//d.display();
  if (wait>100 ) {
    Box p = new Box();
    boxes.add(p);
    wait=0;
  }
  wait++;
 
//Display all the Box objects.
  for (Box b: boxes) {
    b.display(time);
  }
  
   time+=0.5;
   
   for (int i = boxes.size()-1; i >= 0; i--) {
    Box p = boxes.get(i);
    if (p.done()) {
      boxes.remove(i);
    }
  }
}

void mousePressed(){

  saveFrame("###_polygon");

}


class Boundary{

float x,y;
float w,h;

Body b;

Boundary(float x_,float y_,float w_, float h_){
x = x_;
y = y_;
w = w_;
h = h_;


BodyDef bd = new BodyDef();

bd.type=BodyType.STATIC;

bd.position.set(box2d.coordPixelsToWorld(x,y));

b = box2d.createBody(bd);

float bow2dW = box2d.scalarPixelsToWorld(w);
float bow2dH = box2d.scalarPixelsToWorld(h);

PolygonShape ps = new PolygonShape();
ps.setAsBox(bow2dW,bow2dH);

b.createFixture(ps,1);





}

void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }


}
import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

class Box{
  
 float  w=200;
 float h=100;
 Body body;
 
  float k=random(3,40);
   float angle = PI*16 /k;
   float radius = 10;
 
  // set body
  
  Box() {
  BodyDef bd = new BodyDef();
  
  bd.type=BodyType.DYNAMIC;
  
  bd.position.set((box2d.coordPixelsToWorld(width/2,height/2)));
  bd.linearDamping = 0.8;
  bd.angularDamping = 0.9;
  
 //bd.bullet = true;
   
  body = box2d.createBody(bd);
  
 //set shape
 // PolygonShape ps= new PolygonShape();
  
 //float box2Dw = box2d.scalarPixelsToWorld(radius/2);
 //float box2Dh = box2d.scalarPixelsToWorld(radius/2);
  
 // ps.setAsBox(box2Dw, box2Dh);
 
 
  PolygonShape ps2 = new PolygonShape();
  float figw = box2d.scalarPixelsToWorld(radius);
  float figh = box2d.scalarPixelsToWorld(radius);
  ps2.setAsBox(figw,figh);
  
  
 /* FixtureDef fd= new FixtureDef();
  fd.shape=ps;
  fd.density=random(1);
  fd.friction=random(1);
  fd.restitution=random(1);*/
  
  FixtureDef f2= new FixtureDef();
  f2.shape=ps2;
 // f2.density=random(1);
  //f2.friction=random(1);
  //f2.restitution=random(1);
  
 //body.createFixture(fd);
 
 body.createFixture(f2);

  
  }
  
    void display(float time) {
      
//We need the Body’s location and angle.
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
 
  pushMatrix();
//Using the Vec2 position and float angle to translate and rotate the rectangle
  translate(pos.x,pos.y);
    
    rotate(-a);
    
    noFill();
  //  stroke(1);
    rectMode(CENTER);
   
  //  rect(j*3,j*3,j*3,j*3);
   // ellipse(j+(j*(4)),j+(j*4),j*3,j*3);
   
   for (int j=0;j<10;j++){
  translate(sin(PI/2*j*20)*100, 0);
      
   
    rotate(radians(time*0.5));
    strokeWeight(0.5); 
   beginShape();
   
     
for (int i=0; i<=k; i++){
 

 
  float x =  cos(angle*i) * radius;
  float y =  sin(angle*i) * radius;
  vertex(x*2, y*2);
  
  line(width/2,height/2 ,x*2,y*2);
  line(box2d.scalarPixelsToWorld(width/2),box2d.scalarPixelsToWorld(height/2) ,x*2,y*2);
  
  if ((angle*i)>=TWO_PI){
  
  radius+=0.02;
  }
}

 endShape(); 
   }
 popMatrix();
  
   
  }
     
     void killBody() {
    box2d.destroyBody(body);
  }
  
   boolean done() {
    // Let's find the screen position of the particle
   
    // Is it off the bottom of the screen?
    if (radius >500) {
      killBody();
      return true;
    }
    return false;
  }
  
}


