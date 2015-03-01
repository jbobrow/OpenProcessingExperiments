

//import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 200;
float diff = 1; 


void setup() {
  size(600, 600);
  background(255);
//  beginRecord(PDF, "nuclear.pdf");
}

void draw() {
  noFill(); 
  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(1); 
  stroke(random(300),100,200,100); 

  translate(width/2, height/2); 
  rotate(r); 

  line( 0, 0, x, y); 


  strokeWeight(0.5); 
  stroke(random(300),100,255,50); 

  translate(width/3, height/3); 
  rotate(r); 

  rect(0, 0, x, y);
  
  angle = angle +30;
  r = r - diff;

  if ( r == 0 || r == 250) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

