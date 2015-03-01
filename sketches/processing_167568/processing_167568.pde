

//import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 


void setup() {
  size(600, 600);
  background(0);
   colorMode(HSB);
  //beginRecord(PDF, "every.pdf");
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

strokeWeight(random(5)); 
 stroke(random(255),100,255,50);
  translate(width/2, height/2); 
  rotate(r+50); 
 ellipse(0, 20, x, 50);
  ellipse(5, 20, 5, 50);
  line( 0, 0, x, y); 

  angle = angle +0.3;
  r = r - diff;

  if ( r == 0 || r == 200) { 
    diff =  diff * -1;
  }
}




