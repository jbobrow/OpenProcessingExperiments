
PVector VectorOne;
PVector VectorTwo;
PVector VectorThree;
PVector ControlVector;

Image Image;
Controller Controller;

void setup(){
  size(1000, 1000);
  background(100);
  
  Image = new Image();
  Controller = new Controller();
   
  VectorOne = new PVector(200, -100);
  VectorTwo = new PVector(100, 200);
  ControlVector = new PVector(0.0, 0.0);
   
  
  translate(500, 500);
  

  
  noFill();
  stroke(150);
  
  line(0, 0, VectorOne.x, VectorOne.y);
  ellipse(VectorOne.x, VectorOne.y, 20, 20);
  
  line(0, 0, VectorTwo.x, VectorTwo.y);
  ellipse(VectorTwo.x, VectorTwo.y, 20, 20);
  
  VectorOne.sub(VectorTwo);
  
  line(0, 0, VectorOne.x, VectorOne.y);
  ellipse(VectorOne.x, VectorOne.y, 20, 20);
  
  VectorThree = VectorOne;
  
}

void draw(){
  background(100);
  
  ControlVector = Controller.ControlVector;
  
  translate(500, 500);
  Image.addVelocity(ControlVector);
  Image.update();
  Image.display();
  Controller.display(); 
  drawGrid(); 
}

void drawGrid(){
  int xpos, ypos;
  xpos = 0;
  ypos = 0;
  noFill();
  stroke(130);
  for (int i = 0; i < 108; i ++) {
   rect(xpos, ypos, 100, 100);
   xpos += 100;
   if (xpos > width){
    xpos = 0;
    ypos += 100;
   }
  }
}

void mousePressed(){
  float x = mouseX;
  float y = mouseY;
  x += -500;
  y += -500;
  Controller.press(x, y);
}

void mouseDragged(){
  float x = mouseX;
  float y = mouseY;
  x += -500;
  y += -500;
  Controller.dragged(x, y);
}

void mouseReleased(){
  Controller.select = false;
}

class Controller{
 PVector ControlVector;
 boolean select;
 
 Controller(){
   ControlVector = new PVector(0.0, 0.0);
   select = false;
 }
 
 boolean press(float mx, float my){
   if (dist(ControlVector.x, ControlVector.y, mx, my) < 10) {
    select = true;
    return true;
   } else {
    select = false;
    return false;
   }
 }
 
 void dragged(float mx, float my){
  if (select == true){
   ControlVector.x = mx;
   ControlVector.y = my;
  }
 }
 
 void display(){
    noFill();
    if (select == true){
    stroke(250);
    } else {
    stroke(150);
    }
    ellipse(ControlVector.x, ControlVector.y, 20, 20);
    line(0.0, 0.0, ControlVector.x, ControlVector.y); 
 }

}
class Image{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Image(){
   acceleration = new PVector(0.0, 0.0);
   velocity = new PVector(-1.0, 0.0);
   location = new PVector(200.0, 0.0);
  }
  
  void addVelocity(PVector force){
    //force.div(20);
    velocity = force;
  }
  
  
  void update(){
    location.add(velocity);
  }
  
  void display(){
    noFill();
    stroke(150);
    rectMode(CENTER);
    rect(location.x, location.y, 20, 20);
    rectMode(CORNER);
    pushMatrix();
    translate(location.x, location.y);
    stroke(220);
    line(0, 0, velocity.x, velocity.y);
    popMatrix();
  }

}


