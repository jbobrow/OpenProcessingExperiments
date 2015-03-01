
/*
Exercise IV: Poke, Rub, Tickle 
A small program that plays with paper plane
by Irene Ye Yuan 1/26/2015
*/

// set global variables for the paper planes
int max = 10;
int counter = 0;
boolean maxReached = false;
PaperPlane[] p;
// set cursor color, default as blue
color mouse = color(0,0,255,200);
float easing = 0.005;
boolean startEasing = false;

// set up canvas
void setup(){
  // initilize the plane array here
  p = new PaperPlane[max];
  // initialize all the elements in the array
  for(int i = 0; i < max; i++){
    // with random location
    p[i] = new PaperPlane(random(0,500), random(0,500));
  }
  // show one plane at first
  p[0].visible = true;
  counter++;
  // set canvas size and frame time
  size(500,500);
  frameRate(30);
}

// drawing on the canvas
void draw(){
  // set bg color as blue
  background(91,190,255);
  for(PaperPlane pp : p){
    // only update the visible elements
    if(pp.visible){
      if (startEasing){
        pp.drawPlane2();
        pp.over(mouseX,mouseY);
      }else{
        pp.drawPlane();
        pp.over(mouseX,mouseY);
      }
    }
  }
  // mark the location of the mouse with a little blue cross
  stroke(mouse);
  strokeWeight(2);
  line(mouseX-10,mouseY,mouseX+10,mouseY);
  line(mouseX,mouseY-10,mouseX,mouseY+10);
}

// when mouse is pressed, check each element and lock 
// the object if over variable is true
void mousePressed() {
  for(int i = 0; i < max; i++){
    if(p[i].overPlane) { 
      p[i].locked = true; 
    } else {
      p[i].locked = false;
    }
  }
}

// method for dragging the selected plane to mouse current
// location
void mouseDragged() {
  for(int i = 0; i < max; i++){
    if(p[i].locked){
      p[i].x = mouseX; 
      p[i].y = mouseY; 
      if ( mouseX < 0 ){p[i].x = 0;}
      if ( mouseX > width ){p[i].x = width;}
      if ( mouseY < 0 ){p[i].y = 0;}
      if ( mouseY > height ){p[i].y = height;}
    }
  }
}

// when mouse is released, reset all the objects
void mouseReleased() {
  for(int i = 0; i < max; i++){
     p[i].locked = false;
  }
}

// when mouse clicked, make a new plane visible, if 
// max number has not been reached
void mouseClicked() {
  if (counter < max ){
    p[counter].visible = true;
    p[counter].x = mouseX;
    p[counter].y = mouseY;
    counter++;
  }
  // if max number has been reached set cursor to red
  else{
    maxReached = true;
    startEasing = !(startEasing);
    mouse = color(0,0,255,200);
    if(startEasing){mouse = color(255,0,0,200); }
  }
}

// class for the paper plane object
class PaperPlane { 
  // variables for the plane motion
  float angle;
  PImage pp;
  float x, y;
  float vx, vy;
  float ay;
  boolean overPlane = false;
  boolean locked = false;
  boolean visible = false;
  // constructor
  PaperPlane (float mx, float my){
     pp=loadImage("paperPlane.png");  
     x = mx; y = my; angle = PI/4;
     vx = random(1,2); vy = random(1,2); ay = .001;
  } 
  // method for update position
  void updatePosition(){ 
    vy = vy + ay;
    x = x + vx;
    y = y + vy;
    if(vy > 10){vy = vy - 8;}
    if(vy < -10){vy = vy+8; }
  } 
  // method for check the boundary
  void checkBoundary(){
   if(x > width || x < 0){
     vx = -vx; vy=-vy; ay=-ay;
   }
   if(y > height || y < 0){
     vy=-vy; ay=-ay;
   }
  }
  // method for updating direction
  void updateAngle(){
    if(vy < 0 && vx > 0){
      angle = PI/4 - atan(abs(vy)/abs(vx));
    }
    else if(vy > 0 && vx > 0){
      angle = PI/4 + atan(abs(vy)/abs(vx));
    }
    else if(vy > 0 && vx < 0){
      angle =  PI/2 + PI/6 + atan(abs(vy)/abs(vx));
    }
    else if(vy < 0 && vx < 0){
      angle = PI + PI/6 + atan(abs(vy)/abs(vx));
    }
  }
  // if max number reached follow
  void follow(){
    vx = (mouseX - x)*easing;
    vy = (mouseY - y)*easing;
    x += vx ; 
    y += vy;
  }
  // method for drawing the plane on canvas
  void drawPlane(){
    updatePosition();
    checkBoundary();
    updateAngle();
    pushMatrix();
    translate(x-pp.width/2, y-pp.height/2);
    rotate(angle);
    translate(-pp.width/2, -pp.height/2);
    image(pp,0,0);
    popMatrix();
  }
  // method for drawing when following the mouse
  void drawPlane2(){
    follow();
    checkBoundary();
    updateAngle();
    pushMatrix();
    translate(x-pp.width/2, y-pp.height/2);
    rotate(angle);
    translate(-pp.width/2, -pp.height/2);
    image(pp,0,0);
    popMatrix();
  }
  // method for checking if it is over
  void over(float mouseX, float mouseY){
    if ( abs(mouseX- x - pp.width/2) < 60 && abs(mouseY- y-pp.height/2) < 60) {
      overPlane = true;
      mouse = color(0,255,0,200);
    } 
    else{
      overPlane = false;
      if (counter >= max ){mouse = color(255,0,0,200);}
      else{mouse = color(0,0,255,200);}
    }
  }
} 


