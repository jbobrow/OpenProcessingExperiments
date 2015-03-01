



float x, y;
float angle = 0;
float r = 500;
float d =1;


void setup() {
  size(600, 600);
 


  background(0, 0, 48);
}


void draw() {

  x= r * sin(angle);
  y= r * cos(angle);


  
  strokeWeight(1);
  
  
  
  stroke(255, 33);
  noFill();
  translate(width/2, height/2);
  rotate(angle);
  
  ellipse(0, 0, x, y);


  angle += 100;
  r = r - d;

  if (r == 0 || r == 500) {
    d = d * -1;
  }




}
