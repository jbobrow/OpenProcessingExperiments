
//import processing.pdf.*;

float x, y;
float angle = 5; 
float r = 100;
float diff = 1; 


void setup() {
  size(600, 600);
  background(255);
//beginRecord(PDF, "every.pdf");
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(1); 
  stroke(0, 0, 255); 

  translate(width/2, height/2); 
  rotate(r/2); 

  ellipse(10, 10, 300, 500);
  //ellipse(10, 10, x, y);
  //ellipse(x, 0, x, 50);
  line( 0, 0, 10, 50); 
  line( 0, 0, 10, 50); 
  line( 0, 0, 50, 50); 

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 500) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

