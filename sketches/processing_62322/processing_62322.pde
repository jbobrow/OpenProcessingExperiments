
// Tiny_Fibonacci_Sphere.pde 5/2012
float rX=0.7, rY, vX, vY, phi=(sqrt(5)+1)/2-1; // golden ratio
int p=2000;
void setup() 
{ size(600, 600, P3D);
  strokeWeight(3);  stroke(0);
}
void draw()
{ background(255);         
  translate(width/2.0, height/2.0, 0);
  vX *= 0.95;  vX += (mouseY-pmouseY)*1.6E-4;  rX += vX;  rotateX(rX);  
  vY *= 0.95;  vY += (mouseX-pmouseX)*1.6E-4;  rY += vY;  rotateY(rY);  
  p += 1;
  for (int i = 1; i <= p; ++i, 
    pushMatrix(),
    rotateY((phi*i -floor(phi*i))*2.0*PI),
    rotateZ(asin(2*i/(float)p-1)),
    point(222.0, 0),
    popMatrix() );
}


