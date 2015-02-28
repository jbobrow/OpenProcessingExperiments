
int d = 0;
float spin = 0.0;

void setup() {
  size(500, 500, P3D); 
}

void draw() {
  background(0);
  lights();
 
  pushMatrix();
  translate(250.0, 250.0, 0.0);
  rotateY(spin);
  drawSphere(0.0, 0.0, 100.0, 0, 5, d, 360); // origin X, origin Y, radius, level inward, degrees roatation, num of total degrees
  popMatrix();
  
  if (spin <= TWO_PI) spin = spin + 0.01;
  else spin = 0.0;
  
  if (d < 360) d++;
  else d = 0;
  
}

void drawSphere(float x, float y, float radius, int brighten, int level, int degreesCircle, int numPoints)
{

  fill(brighten, 255, 255 - brighten, 105); 
  pushMatrix();
  translate(x, y, 0);
  
  if (level == 5)  stroke(0,200,200,50);
  else noStroke();
  
  sphere(radius*2);
  popMatrix();

  if(level > 1)
  {
    level--;
    degreesCircle = degreesCircle * 2;
    
    float A = degreesCircle * (2*PI/numPoints);
    float CircleAx = cos(A)*radius;
    float CircleAy = sin(A)*radius;
    CircleAx = CircleAx + x;
    CircleAy = CircleAy + y;

    float B = (degreesCircle-(numPoints/2))*(2*PI/numPoints);
    float CircleBx = cos(B)*radius;
    float CircleBy = sin(B)*radius;
    CircleBx = CircleBx + x;
    CircleBy = CircleBy + y;
    
    radius = radius/2;
    brighten = brighten + 50;
    
    drawSphere(CircleAx, CircleAy, radius, brighten, level, degreesCircle, numPoints);
    drawSphere(CircleBx, CircleBy, radius, brighten, level, degreesCircle, numPoints); 
  }  

}

