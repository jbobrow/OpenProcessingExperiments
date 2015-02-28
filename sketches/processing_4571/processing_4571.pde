
/**
 * scape_exp_01 
 */
 
float a;                          // Angle of rotation
float offset = PI/20;             // Angle offset between boxes
int num = 5;                      // Number of boxes


void setup() 
{ 
  size(500, 500, P3D);
  stroke(255);  
  for(int i=0; i<num; i++);
} 
 

void draw() 
{     
  background(0, 0, 0);
  translate(width/1, height/2);
  a += 0.01;   
  
  for(int i = 0; i < num; i++) {
    pushMatrix();
    noFill();
    rotateY(a + offset*i);
    rotateX(a/2 + offset*i);
    box(500);
    popMatrix();
  }
} 

