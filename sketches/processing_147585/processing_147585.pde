
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/43535*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* 
 Original Code by: 
 Daniel C. Young
 Kaleidoscope
 10/22/2011
 
 This code is tweaked by:
 Sjef Fransen -- For Design Academy Eindhoven
 05 - 05 - 2014. 
 
 Load your own images and create a kaleidoscope with them. 
  1. Load the images into the sketch folder: Sketch --> Add File...
  2. Add the correct amount of images after PImage  eg. PImage keith1, keith2, keith3
  3. In setup(). Load the image to the corresponding object --> keith1 = loadImage("keith1.png"); 
  4. In draw().  draw the shape by calling: drawShape(keith1, amount of objects and, radius of circle); 
  5. To make it move. Set moveIt to true. 
  
  
 */

PImage background, eyes, niqaab;
float x,y;

PVector location; 
PVector velocity;

boolean moveIt; 

void setup(){
  size(600,600);
  
  background = loadImage("background.png"); //Place your own Illustration name here. 
  eyes = loadImage("eyes.png"); //Place your own illustration name here. 
  niqaab = loadImage("niqaab.png"); // Place your own Illustration name here. 
  
  location = new PVector(width/2,height/2);
  velocity = new PVector(2.5,2.1);

  moveIt = false;  // Boolean that enables movement. 
}

void draw(){
  background(#1C032C);
  float mx = map(mouseX,0,width,0,250);
  float ma = map(mouseX,0,width,45,1);
  
  if(moveIt) { 
    location.add(velocity); 
  }
  drawShape(niqaab, ma/2, mx+10);
//  drawShape(niqaab03, 36, mx+20);
  drawShape(background, ma, mx);
  drawShape(niqaab, 30, mx+20);
  
// Bounce off edges
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -0.8;
    if(location.x > width) {
      location.x = width; 
    } else {
      location.x = 0; 
    }
  }
 if (location.y > height || location.y < 0) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.8; 
   // location.y = height;
     if(location.y < 0) {
       location.y = 0;
     } else {
       location.y = height;
     }
  }
  
}

void drawShape(PImage _img, float _max, float _mx){
  pushMatrix();
  translate(location.x,location.y);
  for(float ang=0;ang<360-_max;ang+=_max){
    x = _mx * cos(radians(ang));
    y = _mx * sin(radians(ang));
    rotate(radians(ang));
    image(_img, x, y);
  }
  popMatrix();
}
//If mouse is pressed. Reposition the center or the kaleidoscope to the center of the image. 
void mousePressed() {
  //moveIt = !moveIt; 
  velocity.x = velocity.x * 2.5;
  velocity.y = velocity.y * 2.5; 
  location.x = mouseX;
  location.y = mouseY; 
  println("Velocity.x = " + velocity.x + " Velocity.y: " + velocity.y); 
}

//If 's' is pressed pause or play the movement of the kaleidoscope. 
void keyPressed() {
  if(key == 's') {
    moveIt = !moveIt;  
  }
  
}



