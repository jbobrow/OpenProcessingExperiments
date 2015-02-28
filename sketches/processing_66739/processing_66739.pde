
float bx;
float by;
int bs = 20;
boolean boxes = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0; 


void setup() 
{
  size(200, 250);
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS);  
}

void draw() 
{ 
  background(0);
  
    for ( int i = 0; i < 400; i++) { // will keep going until 255
    fill(255 - i, 105 - i, 75); //so super groovy!!!
    rect(i, 0, 1, 400); //gradient
  } 

//  
PImage myImage = loadImage("cupcake.jpg");
imageMode(CENTER);
image(myImage, width/2, height/2);
color getColor = myImage.get(mouseX, mouseY); 
noStroke();
fill(getColor);
//
     
  //mouse is over the box 
  if (mouseX > bx-bs && mouseX < bx+bs && 
      mouseY > by-bs && mouseY < by+bs) {
    boxes = true;  
    if(!locked) { 
      stroke(105); 
      fill(0);
    } 
  } else {
    stroke(105);
    fill(0);
    boxes = false;
  }
  
  //box
  rect(bx, by, bs, bs);
}

void mousePressed() {
  if(boxes) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  bdifx = mouseX-bx; 
  bdify = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-bdifx; 
    by = mouseY-bdify; 
  }
}

void mouseReleased() {
  locked = false;
}


