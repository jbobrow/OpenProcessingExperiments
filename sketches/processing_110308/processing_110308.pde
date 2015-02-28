

float x, y;
float angle = 0;
float r = 400;
float diff = 1;
float a = 1;
float red = 10;
 
color col = color(23,221,206,a);
 
 
 
//
 
void setup() {
  size(600, 600);
  background(#17DDCE);

}
 
 
//
 
 
void draw() {
 
  fill(col);
   
   
  x = r * cos(angle);
  y = r * sin(angle);
 
 
 noStroke();
 stroke(255);
  
 
  
  translate(width/2, height/2);
  rotate(r);
 
  strokeWeight(0.5);
  ellipse(0, 0, x, y);
  strokeWeight(1);
  rect(x/2,y/2,2,2);
  rect(x/1.7,y/1.7,0.7,0.7);
 
  angle = angle + 2;
  r = r - diff;
   
  red = red + 10;
  a = a + 10;
 
  if ( r == 100 || r == 500) {
    diff =  diff * -1;
  }
}
 
 


