
float a;                 // Angle of rotation
float offset = PI/24.0;  // Angle offset between boxes
int num = 12;            // Number of boxes
 
void setup() 
{ 
  size(640, 360, P3D);
  noStroke();  
} 
 
 
void draw() 
{
  
  //lights();
  colorMode(RGB);
  background(154,159,171);
  translate(width/2, height/2); 
  
  for(int i = 0; i < num; i++) 
  {
    colorMode(HSB);
    float color = (map(i, 0, num-1, 0, 30));
    pushMatrix();
    fill(color,255,255);
    rotateY(a + offset*i);
    rotateX(a/2 + offset*i);
    box(200);
    popMatrix();
  }
  
  a += 0.01;    
} 
