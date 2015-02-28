
PImage head; //variable for the image file
float locX, locY; //variable for image location
float rot; //variable for image rotation

//variables for bubbles
float r; 
float g;
float b;
float a;

float diam;
float x;
float y;




void setup () {
  size (800, 500);
    background (0);
  smooth ();
  frameRate(30);
  //load image, initialize variables
  
  head=loadImage ("dean.png");
  locX=0;  //location of image x
 locY= width/3; // location of image y
  rot=0;// rotation variable value
}

void draw () {
  background (0);
 
    //fill all the variables with random values
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam=random(20);
  x=random(width);
  y=random(height);
  
  //use values to draw an ellipse
  noStroke();
  fill(r, g, b, a);
  ellipse(x, y, diam, diam);
  
  
  translate (locX, locY);
  rotate (rot); // use this value for rotate 
  image (head, 0, 0); // draw image

  locX=mouseX-1.5; 
  locY= mouseY+ 0.5;
  rot+= 0.08;
  if (locX>width) {
    locX=-head.width;
   
  }
}



