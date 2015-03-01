
//import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 50;
float diff = 5*2; 


void setup() {
  size(400, 400);
  background(#020003);
 // beginRecord(PDF, "every.pdf");
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.5); 
  stroke(#9D05EA, 100); 

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);
  ellipse(x*4, 40, x, 20);
  line( 10, 0, x, y); 

  angle = angle +0.08;
  r = r - diff ;

  if ( r == 0 || r == 100) { 
    diff =  diff * -1;
  }


}




