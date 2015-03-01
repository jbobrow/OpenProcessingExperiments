

//import processing.pdf.*;

float x, y;
float angle = 0; 
float r =100;
float d = 1;
//changethenumbrt


void setup() {
  size(600, 600);
  background(#FF0303);
 // beginRecord(PDF, "every.pdf");
}

void draw() {

  noFill(); 
  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.3); 
  stroke(#FF03EF); 
  translate(width/2, height/2); 
  rotate(0); 

  ellipse(0, 0, x, y);
  
  stroke(#FF393C);
  ellipse(0, 0, y, x);
  
  stroke(#FFF700);
  line( 0, 0, x, y);

  angle = angle + 1;
  r = r + d;

  if ( r == 0 || r == 600) { 
    d =  d * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

