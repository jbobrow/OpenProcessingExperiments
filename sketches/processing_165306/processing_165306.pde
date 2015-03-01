
void setup() {
  size(600,600,P3D);
  background(0);
  frameRate(50);
}

void draw() {
  float lx=0, ly=0, lz=1;
  
  float x = random(0,200);
  float y = random(500,600);
  float z = random(100,200);
  
  float rx = random(-50,300);
  float ry = random(-300,50);
  float rz = random(0,350);
  
  float sx = random(0,100);
  float sy = random(-50,100);
  float sz = random(0,100);
  
  float cx=(ry*sz-ry*sy);
  float cy=-(rx*sz-rz*sx);
  float cz=(rx*sy-ry*sx);
  
  float size = sqrt(cx*cx + cy*cy + cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;
  
  float brightness = abs(cx*lx + cy*ly + cz*lz);
  
  fill(55, brightness * 100, 0);
  beginShape();
  vertex(x, y, z);
  vertex(x+rx, y+ry, z+rz);
  vertex(x+sx, y+sy, z+sz);
  endShape();
}
