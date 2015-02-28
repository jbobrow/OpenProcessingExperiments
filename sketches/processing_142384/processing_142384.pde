
float a;                 // Angle of rotation
float offset = PI/24.0;  // Angle offset between boxes
int num = 12;            // Number of boxes

void setup() { 
  size(640, 360, P3D);
  noStroke();  
} 
 

void draw() {
  
  lights();
  
  background(0, 0, 0);
  translate(width/6, height/2); 
  
  for(int i = 0; i < num; i++) {
    float gray = map(i, 0, num-1, 0, 200);
    pushMatrix();
    fill(random(155),random(0),random(100));
    rotateY(a + offset*i);
    rotateX(a/2 + offset*i);
    box(400);
    popMatrix();
  }
  
  a += 0.01;    
} 

