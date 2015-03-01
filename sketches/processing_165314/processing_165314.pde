
void setup()
{
  
  size(600,600, P3D);
  frameRate(500);
  background(173,255,26);
  noStroke();
  smooth();
    fill(173,255,26);

  
   
}

void draw()
{

for(int x = 15; x < 600; x +=30){
    for(int y = 0; y <600; y +=30)
    triangle(x,y, x-15,y +30,x +15,y +30);
      
  
  }

 translate(mouseX,mouseY,-500);
  float lx=0, ly=0, lz=1;
  
  //triangle origin
  float x = random(0, 600);
  float y = random(0, 600);
  float z = random(0, 600);
  
  //vector r=[rx ry rz] for one side
  float rx = random(0, 100);
  float ry = random(0, 100);
  float rz = random(0, 100);
  
  
  //vector s= [sx sy sz] for the other side
  float sx = random(0, 100);
  float sy = random(0, 100);
  float sz = random(0, 100);
  
  //compute cross product
  float cx=(ry*sz-ry*sy);
  float cy=-(rx*sz-rz*sx);
  float cz=(rx*sy-ry*sx);
  
  //compute unit normal vector
  float size = sqrt(cx*cx + cy*cy + cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;
  
  //determine brightness based on dot product between
  //unit normal vecotr and light vector
  float brightness = abs(cx*lx + cy*ly + cz*lz);
  
  fill(brightness * 255, 0, 255);
  beginShape();
  vertex(x, y, z);
  vertex(x+rx, y+ry, z+rz);
  vertex(x+sx, y+sy, z+sz);
  endShape();
}
