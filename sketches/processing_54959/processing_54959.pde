
/*/learned how to do the chain from
<http://processing.org/learning/topics/chain.html> /*/
 
Spring2D s1, s2, s3, s4;
 
//movement of the objects
float gravity = 6.0;
float mass = 2.0;
 
int value=color(0,255,0); //color of the objects
int blink=0; //to control blinking
 
  
void setup() {
  size(500, 500); //size of the canvas
  background(255); //initial background color
  smooth(); //smooth lines
  

   
  //Inputs: x, y, mass, gravity
  s1 = new Spring2D(0.0, width/2, mass, gravity);
  s2 = new Spring2D(0.0, width/2, mass, gravity);
  s3 = new Spring2D(0.0, width/2, mass, gravity);
  s4 = new Spring2D(0.0, width/2, mass, gravity);
}
 
void draw(){
  rectMode(CORNER);
  stroke(0); //stroke color, black
  strokeWeight(25);
  fill(255,255,250,10); //square color and its opacity (over the background)
  rect(10,10,480,480); //square over the background
  smooth();
 
  //yellow
  noStroke();
  smooth(); //smooth the line
  fill(232,170,mouseX-200,80);
  ellipse(mouseX-55,mouseY-78,200,200);
   
  //big head
  strokeWeight(5); //thickness of the stroke
  smooth();
  stroke(0);
  fill(random(190),130,mouseX);
  ellipse(mouseX-72,mouseY-88,100,100);

  //small head
  smooth();
  fill(random(190),130,mouseX);
  ellipse(mouseX,mouseY-20,50,50);

  /*connects objects together and links them with the line, each object follows
  the previous one/*/
  s1.update(mouseX, mouseY);
  s1.display(mouseX, mouseY);
  s2.update(s1.x, s1.y);
  s2.display(s1.x, s1.y);
  s3.update(s2.x, s2.y);
  s3.display(s2.x, s2.y);
  s4.update(s3.x, s3.y);
  s4.display(s3.x, s3.y);
  
  if (blink==0) {  
   strokeWeight(5); //thickness of the stroke
   fill(255); //color (black)
   ellipse(mouseX-90,mouseY-90,40,40);
   fill(0); //color (white)
   ellipse(mouseX-85,mouseY-85,20,20);
   
    //right eye
   strokeWeight(5); //thickness of the stroke
   fill(255);
   ellipse(mouseX-50,mouseY-90,40,40);
   fill(0);
   ellipse(mouseX-45,mouseY-85,20,20);
  
   //small left eye
   strokeWeight(5); //thickness of the stroke
   fill(255);
   ellipse(mouseX-10,mouseY-25,15,15);
   fill(0);
   ellipse(mouseX-12,mouseY-27,5,5);
  
   //small right eye
   strokeWeight(5); //thickness of the stroke
   fill(255);
   ellipse(mouseX+5,mouseY-25,15,15);
   fill(0);
   ellipse(mouseX+3,mouseY-27,5,5);
  
  
   } else { //draw line (replaces the eye)
    stroke(0);
    strokeWeight(3);
    line(mouseX-110, mouseY-90, mouseX-75,mouseY-90);
    line(mouseX-70, mouseY-90, mouseX-35,mouseY-90);
    strokeWeight(2);
    line(mouseX-15,mouseY-25,mouseX-5,mouseY-25);
    line(mouseX,mouseY-25,mouseX+10,mouseY-25);
   }
}
 
class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  //movement of the object
  float gravity;
  float mass;
  //radius of the ellipse
  float radius = 20;
  float stiffness = 0.2;
  float damping = 0.6; //controls speed
   
  //stating each value
  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
   
//controls movement of the ellipses
void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity; //objects will not jump into position s1
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
}
   
void display(float nx, float ny) {
    //noStroke(); //no stroke around the ellipses on the body
    strokeWeight(3); //thickness of the stroke
    smooth(); //smooth the line
    fill(random(190),130,mouseX); //random colors for the body
     
    /*/the size of the diameter of the ellipses that constantly changes,
   learned from <http://www.openprocessing.org/sketch/1933> /*/
    float diametro = random (2,30);
    ellipse (x, y, diametro, diametro); //the body (4 ellipses)
 
   
    stroke(0); //stroke is black
    strokeWeight(3); //thickness of the stroke
    smooth(); //smooth the line
    line(x, y, nx, ny); //line through the body
     
    //line(x, y, nx-50, ny-50); //legs
  }
}


/*/void keyPressed() {
  if (key==' ') {
    value = color(random(255),random(255),random(255));
  } 
  else {
    value = color(random(255),random(255),random(255));
  }
} /*/

//replaces the eyes with lines when mouse is pressed
void mousePressed(){
  if (blink==0){
    blink=1;
  } else {blink=1;
    }
}

//replaces the lines with eyes when mouse is released
void mouseReleased(){
  if (blink==1){
    blink=0;
  } else{blink=0;
    }
}
