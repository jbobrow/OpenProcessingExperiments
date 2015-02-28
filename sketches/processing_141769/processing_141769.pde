
float angle = 0;
float r = 25; //radii of outer rotating circles
float rtwo = 3; //radii of golden circles
float n = 100; //number of golden circles

void setup() {
  size(500,500);
  background(59, 79, 88);
}

void draw() {
  background(59, 79, 88);
  noStroke();
  fill(69,216,184);
  
  
  pushMatrix();
  stroke(69,216,184);
  fill(69,216,184,100);
  translate(width/2,height/2);
  for (int i=0; i < 7; i++) {
    ellipse(0,-25,50,50);
    rotate(2*PI/6);
  }
  popMatrix();
  
  
  pushMatrix();
  noStroke();
  fill(217,169,80);
  translate(width/2,height/2);
  for (int i=0; i < n+1; i++) {
    ellipse(0,-150,rtwo,rtwo);
    rotate(2*PI/n);
  }
  popMatrix();
  
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(angle-PI/2);
  fill(69,216,184,255);
  ellipse(150*cos(2*PI/3),150*sin(2*PI/3),r,r);
  ellipse(150*cos(4*PI/3),150*sin(4*PI/3),r,r);
  ellipse(150*cos(6*PI/3),150*sin(6*PI/3),r,r);
  angle = (.005*PI + angle)%(2*PI);
  popMatrix();
   
}
