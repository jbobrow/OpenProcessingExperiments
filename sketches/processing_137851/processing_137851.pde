
//Assignment 3, LeeAnn Iassogna
//Goal was to create a piece to revisit, one that produced a diverse image every time. I looked to evoke cascading qualities and undulating effects in the ellipses juxtaposed against the sharp, sporadic, angular, quads, reminiscent of sound and noise imagery.  Amusingly natured, has flexibility to return and carry out a completely different sequence, each generating a unique canvas, trying to top your last still.  
 
//global variables
int stepX;
int stepY;
color strokeColor = color(10, 100);
int numFrames = 4;
int frame = 0;
int value = 0;
PImage [] images = new PImage[numFrames];

//setup
void setup() {
  size(600, 900);
  background(7);
  frameRate(3);
  images[0]= loadImage("leeannA.png");
  images[1] = loadImage("annA.png");
  images[2] = loadImage("leeannB.png");
  images[3] = loadImage("annB.png");
}
//draw
void draw() {
  tint(value);
     frame = (frame+1) % numFrames;
 int offset = 0;
 for (int x = 0; x < width; x += images[0].width) { 
    image(images[(frame+offset) % numFrames], 0, -200);
    offset+=2;
    image(images[(frame+offset) % numFrames], 0, 0);
    offset+=3;
    image(images[(frame+offset) % numFrames], 0, 200);
    offset+=2;
     image(images[(frame+offset) % numFrames], 0, 400);
    offset+=5;
    image(images[(frame+offset) % numFrames], 0, 600);
    offset+=2;
     image(images[(frame+offset) % numFrames], 0, 800);
    offset+=2;
    
  //background ellipse grid
    colorMode(HSB, 1600, height, 300);
  stepX = mouseX+10;
  stepY = mouseY+10;
  for (int gridY = 0; gridY < height; gridY+=stepY){
  for (int gridX = 0; gridX < width; gridX+=stepX){
    stroke(strokeColor);
    fill(400, height-gridY, 100);
    ellipse(500, gridY, mouseX, 3);
  }
  }
 } 
  //mouse input
    if (mousePressed){
   pushMatrix();
    translate(width/2, 800);
    scale(.78);
    rotate(radians(600));
    map(mouseY+500, random(width), height, mouseX+600, height);
    
    //style
    strokeWeight(random(3));
    stroke(700, mouseX, mouseY);
    noFill();
    
    //quad, mouse pressed
    beginShape();
    quad(100, mouseY, mouseX, random(height), random(width), random(height), random(width), 900);
popMatrix();



}
}

//keyboard input
void keyPressed () {
if (key == DELETE || key == BACKSPACE) background(7);
if (key == 's' || key == 'S') saveFrame("screenshot.png");

switch(key){
  case '1':
  strokeColor = color(78, 1100);
  break;
  case '2':
  strokeColor = color(500, 5, 82, 10);
  break;
  case '3':
  strokeColor = color(22, 700, 750, 333);
  break;
  
}
}
void mouseDragged() {
  value = value += 10;
  if (value > 200) {
    value = 0;
  }
}


