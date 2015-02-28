

int num_part = 10;
int time = 25000;
float px, py, px2, py2, pz, pz2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;

boolean isSetup = false;
PImage img;



// Build a container to hold the current rotation of the box
float boxRotation = 100;

void setup() {

  size(600,800);
  smooth();
  // Set the fill and stroke color for the box and circle
  fill(255);
  stroke(255);
  // Tell the rectangles to draw from the center point (the default is the TL corner)
  rectMode(width/2);

  img = loadImage("prince.jpeg");
 


}

void draw() {
  background(mouseY * (255.0/800), 100, 0);
  // Change our box rotation depending on how our finger has moved right-to-left
  boxRotation += (float) (pmouseX - mouseX)/100;

  // Draw the ball-and-stick
  line(width/2, height/2, mouseX, mouseY);
  image(img, mouseX,mouseY);
  image(img, mouseX/4,mouseY/2);
  image(img, mouseX, 40);

  // Draw the box
  pushMatrix();
  translate(width/2, height/2);
  rotate(boxRotation);
  image(img,150,150);
  popMatrix();
  
  for (int i = 0; i< width; i++){
    px2 = width/2 + cos(radians(angle2))*(radius);
    py2 = 75 + sin(radians(angle2))*(radius/2);
    pz2 = 150 + sin(radians(angle2))*(radius);
    point(width/2+radius+i, py2);
    angle2 -= frequency2;
  }
  
  // send small ellipse along sine curve
  // to illustrate relationship of circle to wave
  noStroke();
  fill(255,157,28);
  image(img,width/20+radius+x*2, py2);
  angle -= frequency;
  x+=10;

 

  // when little ellipse reaches end of window
  // reinitialize some variables
  if (x>= width-60) {
    x = 0;
    angle = 0;
  }

  // draw dynamic line connecting circular
  // path with wave
  stroke(5);
  line(px, py, width/8+radius+x, py);

  // output some calculations
  text("funky fresh", 35, 185);
  text(" " + px, 105, 185);
  text("f " + py, 215, 185);
  
  
  }
  
  
  
  // code from processing.org/learning tutorials page
   // android mode - modified code from that.
 
 
  


