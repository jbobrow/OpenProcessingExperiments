
//import processing.pdf.*;

float x, y;
float angle = 5; 
float r = 5;
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

  strokeWeight(0.5); 
  stroke(random(100, 255), random(0, 100), random(100, 255)); 

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);
  //ellipse(x, 0, x, 50);
  
  line( 0, 0, x*2, y*2); 

  angle = angle +5;
  r = r - diff;

  if ( r == 0 || r == 600) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
