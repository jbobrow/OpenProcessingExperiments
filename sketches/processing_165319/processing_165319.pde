
void setup(){
size(600,600,P3D);
}

void draw(){
float lx=0, ly=0, lz=1;

float x1= random(width/2,600);
float y1= random(height/2,600);
float z1= random(0,600);

float rx= random(0,70);
float ry= random(0,70);
float rz= random(0,100);

float sx= random(0,100);
float sy= random(0,50);
float sz= random(0,50);

float cx=(ry*sz-rz*sy);
float cy=-(rx*sz-rz*sx);
float cz=(rx*sy-ry*sx);

float size= sqrt(cx*cx + cy*cy + cz*cz);
cx= cx/size;
cy= cy/size;
cz= cz/size;
  
float brightness = abs(cx*lx + cy*ly + cz*lz);

beginShape();
  fill(brightness*255,0,0);
  vertex(x1,y1,z1);
  vertex(x1+rx, y1+ry, z1+rz);
  vertex(x1+sx, y1+sy, z1+sz);
  
  fill(0,0,brightness*255);
  vertex(mouseX,mouseY,z2);
  vertex(mouseX+rx, mouseY+ry, z1+rz);
  vertex(mouseX+sx, mouseY+sy, z1+sz);

  endShape();
}

