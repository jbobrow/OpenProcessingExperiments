

float spin = 5.0;
float diameter = 5.0;
float angle;
 
float angle_rot;
int rad_points = 10;
 
void setup()
{
  size(300, 300);
  smooth();
}
 
void draw()
{
  background(#b08623);
   
  translate(100, 100);
  
  angle_rot = 0.5;
 
 
  for(int i=0; i<10; i++) {
    pushMatrix();
    fill(#b08623, .5);
    stroke(255);
    rotate(angle_rot + -20);
    ellipse(random(90,110), random (90,100), diameter, diameter);
    ellipse(random(110,80), random (110,90), diameter, diameter);
    ellipse(random(110,60), random (110,60), diameter, diameter);

    popMatrix();
   
    angle_rot += PI*2/2;
  }

 
  diameter = 300 * sin(angle) + 1;
   
  angle += 0.09;
  if (angle > TWO_PI) { angle = 0; }
}


