
/**
 * scape_exp:04 
 */
 
float a;                          // Angle of rotation
float offset = PI/20;             // Angle offset between ellipses
int num = 50;                     // Number of ellipses

void setup() 
{ 
  size(500, 500, P3D);
  stroke(255);  
  for(int i=0; i<num; i++);
} 
 

void draw() 
{     
  background(52, 199, 255);
  translate(width/1, height/2);
  a += 0.01;   
  
  for(int i = 0; i < num; i++) {
    pushMatrix();
    noFill();
    rotateY(a + offset*i);
    rotateX(a/2 + offset*i);
    ellipse(150,150,500,500);
    popMatrix();
  }
 } 

