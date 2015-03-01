
float rX= 0.7, rY, vX, vY, phi=PI;
float p=1500;
void setup()
{ size(1000, 1000, P3D);
  strokeWeight(3);  stroke(255);
}
void draw()
{
    background(0);        
    translate(width/2.0, height/2.0, 0);

vX = (vX+(mouseY-pmouseY)*0.0001)*19/20; rX += vX; rotateX(rX);
vY = (vY+(mouseX-pmouseX)*0.0001)*19/20; rY += vY; rotateY(rY);
 
   for (int i = 1; i <= p; ++i) {
     rotateY((phi*i -floor(phi*i))*2.0*PI);
     rotateZ(asin(2*i/p-1));
     point(0-0.01*p*p, 0); 
    }
 
   p -= 3;
 
 
 
   for (int j = 0; j >= p; --j) {
    pushMatrix();
    rotateY((phi*j -floor(phi*j))*2.0*PI);
    rotateZ(acos(2*j/p-1));
    point(10 + 1.3*p, 0);
    stroke(random(255),random(255),random(255),10000);
    popMatrix();  
  }  
 }
