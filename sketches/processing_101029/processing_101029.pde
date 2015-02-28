
int parts, r;
PVector angle, center;

void setup() {
  size(400,300);
  background(255);
  noFill();
  stroke(0xaa,0xbb,0xcc);  
  parts = 20;
  r = 40;
  angle = new PVector(0,1);
  center = new PVector(width/2,height/2);
}

void draw() {
  background(255);
  for (int i=1;i<=parts;i++) {
    ellipse(center.x+angle.x*r,center.y+angle.y*r,5,5);
    //angle.rotate(TWO_PI/parts); //for java
    rotate2D(angle,TWO_PI/parts); //for javascript
    
  }
   //angle.rotate(TWO_PI/parts/10);
   rotate2D(angle,TWO_PI/parts/10);
}

void rotate2D(PVector v, float theta) { 
  //function by Vilhelm @ http://www.shiffman.net/2011/02/03/rotate-a-vector-processing-js/ 
  float xTemp = v.x;
  v.x = v.x*cos(theta) - v.y*sin(theta);
  v.y = xTemp*sin(theta) + v.y*cos(theta);
}


