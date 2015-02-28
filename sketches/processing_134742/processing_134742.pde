
import processing.dxf.*;

Mountains mountains;
float image_x = 1;
float image_speed = 1;
PImage image;
PVector grav = new PVector (0,.1); 

void setup() {
  size(600, 300);
  image = loadImage("mountains.jpg");
  mountains = new Mountains();
}

void draw() {
  image_x -= image_speed;
  image_x %= width;
  image(image, int(image_x), 0);
  image(image, int(image_x + width), 0);
  
  if (keyPressed == true){
    //speed = new PVector(0,-10);
  }
  else{
    //speed = new PVector(0,-.1);
  }
  
  mountains.applyForce(grav);
  mountains.update();
  mountains.display();
}
class Mountains{
  //Mountain mnt;
  
  PVector location;
  PVector grav;
  PVector speed;
  PVector accel;
  float mass;
  
 Mountains(){
    location = new PVector (width/2,height/2);
    speed = new PVector (0,1);
    accel = new PVector (0,-.4);
    mass = 16;
  }

  void display(){
    fill(256, 256, 0);
    ellipse(location.x, location.y, 34, 34); 
    strokeWeight(3);
    rect(location.x, location.y, 0, 10);
    
if(mousePressed == true){
fill(255, 255, 0);
ellipse(40, 40, 40, 40);
}

if(mousePressed == true){
background(168, 234, 233);
ellipse(mouseX-40, mouseY-10, 60, 60);
}
  
    stroke(200);
    fill(0, 255, 255);
    ellipse(140, 180, 40, mouseX/5);
  }  
  
  void update(){    
    speed.add(accel);
    location.add(speed);
    accel.mult(0); // gives us new accel each frame
  }  
    
  void applyForce(PVector force){
    PVector f = force.get();
    f.div(mass);
    accel.add(f);
  }  
}    


