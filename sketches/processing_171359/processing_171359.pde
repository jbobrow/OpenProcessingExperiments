
float rX= 0.7, rY, vX, vY, phi=PI; // golden ratio
int p=1;
float delta = 3;
void setup()
{ 
  size(600, 600, P3D);
  strokeWeight(3); 
  stroke(255);
  // frameRate(20);
}
void draw()
{
 
  translate(width/2.0, height/2.0, 0);
  vX *= 0.95; 
  vX += (mouseY-pmouseY)*1.6E-4; 
  rX += vX; 
   float r=0;
  float mouseYA = mouseY+r;
 
r+=0.009; 
  rotateX(rX);
  vY *= 0.95; 
  vY += (mouseX-pmouseX)*1.6E-4; 
  rY += vY; 
    float mouseXA = mouseX+r;
 
r+=0.009;
  rotateY(rY);
  p -= 2;
  background(170, 255, 190);
 
  for (int j = 0; j >= p; --j) 
  {
    pushMatrix();
    rotateY((2*phi*j -(phi*j))*PI+1);
    rotateX(sin(3*j/(float)p-1));
    fill(random(255), random(255), random(255), 10000);
    noStroke();
    float lx=0, ly=0, lz=1;
    float rx = random(0, 100);
    float ry = random(0, 100);
    float rz = random(0, 100);
    float sx = random(0, 100);
    float sy = random(0, 100);
    float sz = random(0, 100);
    float cx=(ry*sz-ry*sy);
    float cy=-(rx*sz-rz*sx);
    float cz=(rx*sy-ry*sx);
    float size = sqrt(cx*cx+ cy*ly+ cz*cz );
    cx = cx/size;
    cy = cy/size;
    cz = cz/size;
    float brightness = abs(cx*lx+cy*ly+cz*lz);
    fill(0, brightness * 255, 0, 120);
    // triangle(j, j+10, j+20, j+30, j, j+40);
    float k = map(j, -200, 0, 0, 1.15);
    // rotate(radians(270));
    beginShape();
    vertex(k*(45+j), k*(20+j));
    bezierVertex(k*(10+j), k*(20+j), k*(20+j), k*(60 +j), k*(30+ j), k*( 70+j));
    bezierVertex(k*(55+ j), k*(60+j), k*(65+j), k*(30+j), k*(45+j), k*(20+j));
    endShape();
    popMatrix();
    translate(0, 0, 0);
    lights();
    fill(#8E6821);
 
    sphere(65);
   
   
    pushMatrix();
    translate(56, 0, 30);//move the sphere to the center of the canvas
    fill(0);
    sphere(6);
    popMatrix();
    pushMatrix();
    translate(30, 0, 56);//move the sphere to the center of the canvas
    fill(0);
    sphere(6);
    popMatrix();
  }
}
