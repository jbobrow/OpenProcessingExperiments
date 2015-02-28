
float circle1x = 70;
float circle1y= 0;

float circle2x = 30;
float circle2y = 100;

float circle3x= -20;
float circle3y= 0;



void setup() {

  size(400, 450);
  smooth();
}

void draw() {

  background (225, 247, 209);

  float s = map(millis(), 0, 59, 0, 360); 
  float h = map(minute(), 0, 59, 0, 360); 
  float m = map(second(), 0, 59, 0, 360);
  


pushMatrix();
  translate (width/2, height/2);
  fill(183, 101, 134, 190);
  rotate(radians(h));
  ellipse(circle1x, circle1y, 180, 180);
  popMatrix();

  pushMatrix();
  translate (width/2, height/2);
  rotate(radians(m));
  fill(239, 37, 114, 190);
  ellipse(circle2x, circle2y, 198, 198);
  popMatrix(); 


  pushMatrix();
  translate (width/2, height/2);
  noStroke();
  rotate(radians(s));
  fill(217, 28, 92, 190);
  ellipse(circle3x, circle3y, 100, 100);
  popMatrix(); 



  

}
  // blend(int(circle1x),int(circle1y),180,180, int(circle2x), int(circle2y), 200,200, ADD);

