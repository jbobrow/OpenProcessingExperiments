
//201012703 Sang won Lee
//import processing.pdf.*;

float x, y;
float angle = 0;
float r = 400;
float diff = 1; 

color col = color(255,207,175,40);

void setup() {

  size(600, 600);
  background(0);
//  beginRecord(PDF, "201012703_sangwonLee.pdf");
}

void draw() {

  fill(col); 

  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.1);  
  stroke(255);   
 

 
  translate(width/2, height/2); 
  rotate(r);  

  ellipse(x, 0, x, 20);

  fill(255,247,175,20);
  ellipse(300,300, x,y);

  line( 0, 0, x, y);

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}
//void keyPressed() {
//  if (key == 'q') {
//    endRecord();
//    exit();
//  }
//}
