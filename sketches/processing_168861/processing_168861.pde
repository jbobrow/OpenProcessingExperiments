

//import processing.pdf.*;

float x, y;
float angle = 30; 
float r = 100;
float diff = 4; 


void setup() {
  size(600, 600);
  background(0);
  //beginRecord(PDF, "every.pdf");
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.1); 
  stroke(255, 150, 50); 

  translate(width/2, height/2); 
  rotate(r); 


  ellipse(0, 0, x, y);

  strokeWeight(0.03); 
  stroke(100, 0, 50); 
  
  ellipse(y, 0, x, 50);
  line( 20, 20, y, y); 

  angle = angle +50;
  r = r - diff;

  if ( r == 0 || r == 500) { 
    diff =  diff * -1;
  }
}


/*void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}*/

