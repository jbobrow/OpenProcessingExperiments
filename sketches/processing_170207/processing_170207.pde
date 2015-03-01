
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/167568*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

//import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 100;
float diff = 1; 


void setup() {
  size(600, 600);
  background(50);
   colorMode(HSB);
  //beginRecord(PDF, "every.pdf");
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

strokeWeight(random(5)); 
 stroke(random(255),190,205,50);
  translate(width/2, height/2); 
  rotate(r+400); 
 ellipse(90, 140, x, 10);
  ellipse(50, 20, 5, 100);
  line( 0, 10, x, y); 

  angle = angle +0.3;
  r = r - diff;

  if ( r == 0 || r == 200) { 
    diff =  diff * -1;
  }
}





