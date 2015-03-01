
void setup() {
  size(600, 600, P3D);
  background(80,80,220);
}

void draw() {
  
  float lx =0, ly = 0, lz = 1;
  
  float x = random(0,600);
  float y = random(0,600);
  float z = random(0,600);
  
  float rx = random(0,100);
  float ry = random(0,100);
  float rz = random(0,100);
  
  float sx = random(0,100);
  float sy = random(0,100);
  float sz = random(0,100);
  
  float cx = (ry*sz-ry*sy);
  float cy = -(rx*sz-rz*sx);
  float cz = (rx*sy-ry*sx);
  
  float size = sqrt(cx*cx + cy*cy + cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;
  
  //float brightness = abs(cx*lx + cy*ly + cz*lz);
  
  
  fill(random(100),80,220);
  stroke(255);
  beginShape();
  vertex(x,y,z);
  vertex(x+rx,y+ry,z+rz);
  vertex(x+sx,y+sy,z+sz);
  endShape();
  
}
