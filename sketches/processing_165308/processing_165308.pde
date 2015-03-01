
void setup()
{
  size(600, 600, P3D);
  background(0);
}

void draw()
{
  float lx=0, ly=0, lz=1;
  //orign
  float x= mouseX;
  float y= mouseY;
  float z= 1;

  //
  float rx= random(-200, 200);
  float ry= random(-200, 200);
  float rz= random(-200, 200);

  //
  float sx= random(-200, 200);
  float sy= random(-200, 200);
  float sz= random(-200, 200);


  //cross product
  float cx=( ry*sz -rz*sy );
  float cy=-( rx*sz -rz*sx);
  float cz=( rx*sy - ry*sx );


  float size = sqrt(cx*cx +cy*cy+ cz*cz );
  cx=cx/size;
  cy=cy/size;
  cz=cz/size;

  float brightness = abs(cx*lx +cy*ly +cz*lz); 

  noStroke();
  fill(brightness*255, brightness*255, brightness*255, 100);
  beginShape();
  vertex(x, y, z);
  vertex(x+rx, y+ry, z+rz);
  vertex(x+sx, y+sy, z+sz);
  endShape();
}

