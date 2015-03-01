
int constant = 500;
float angle = 0.85;
int scalar = 100;
float speed = 0.1;
  
//Everything here just runs once
void setup() {
  size (600,600); 
  background(0);
  //frameRate(60);
  smooth();
}

void draw() {
  strokeWeight (20);
  float a = constant + sin(angle) * scalar;
  float b = constant + cos(angle) * scalar;
 
  bezier (0,0, a,0, 0,b, a, b);
  bezier (0,0, 0,b, a,0, a, b);
  
  //bezier (b,0, 0,0, b,a, 0,a);
  //bezier (b,0, b,a, 0,0, 0, a);
  
  fill(random(255));
  ellipse (a/2, b/2, 200, 200);
  
  angle = angle + speed;
  
}


