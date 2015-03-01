
float rX= 0.7, rY, vX, vY, phi=PI; // golden ratio
int p=500;
void setup()
{ size(900, 900, P3D);
  strokeWeight(3);  stroke(255);
}
void draw()
{
    background(0);        
    translate(width/2.0, height/2.0, 0);
    vX *= 0.95;  vX += (mouseY-pmouseY)*1.6E-4;  rX += vX;  rotateX(rX); 
    vY *= 0.95;  vY += (mouseX-pmouseX)*1.6E-4;  rY += vY;  rotateY(rY); 
 
 
 
   for (int i = 1; i <= p; ++i) {
     rotateY((phi*i -floor(phi*i))*2.0*PI);
     rotateZ(asin(2*i/(float)p-1));
triangle(i,i+10,i+20,i+30,i,i+40);

    }
 
   p -= 2;
 
 
 
   for (int j = 0; j >= p; --j) {
    pushMatrix();
    rotateY((phi*0.5*j -floor(phi*0.5*j))*2.0*PI);
    rotateZ(atan(2*j/(float)p-1));
 //    fill(random(255),random(255),random(255),10000);
noStroke();
float lx=0, ly=0, lz=1;
float x = random(0,600);

float y = random(0,600);

float z = random(0,600);

float rx = random(0,100);

float ry = random(0, 100);

float rz = random(0,100);

float sx = random(0,100);
float sy = random(0,100);
float sz = random(0,100);

float cx=(ry*sz-ry*sy);
float cy=-(rx*sz-rz*sx);
float cz=(rx*sy-ry*sx);

float size = sqrt(cx*cx+ cy*ly+ cz*cz );
cx = cx/size;
cy = cy/size;
cz = cz/size;

float brightness = abs(cx*lx+cy*ly+cz*lz);
fill(brightness * 255,0,0);
triangle(j,j+10,j+20,j+30,j,j+40);

    popMatrix();  
  }  
 }
