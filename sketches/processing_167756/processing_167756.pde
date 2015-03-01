

//import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 


void setup() {
  background(10);
  colorMode(HSB);
  size(600, 600);
  //beginRecord(PDF, "every.pdf");
  smooth();
  strokeWeight(1);
}

void draw() {

  stroke(1, 80, 80, 20);

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(1); 
 stroke(random(255),100,255,50);

  translate(width, height); 
  rotate(r); 

  rect(0, 0, x, y);
  rect(x, 0, x, 100);
  line( 0, 0, x*2, y*2); 
   rect(0, 0, x/2, y/2);
  line( 0, 0, x, 200); 

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}

