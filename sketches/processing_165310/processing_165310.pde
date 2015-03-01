
int csize=600, unitSize=100;
float delta=0;
void setup() {
  size(csize, csize, P3D);
  translate(width/2, height/2, 0);
}

void draw() {
  background(255);
  float lx=0, ly=0, lz =1;

  float x= mouseX;
  float y = mouseY;
  float z = random(0, csize);

  float rx = random(0, unitSize);
  float ry = random(0, unitSize);
  float rz = random(0, unitSize);

  float sx = random(0, unitSize);
  float sy = random(0, unitSize);
  float sz = random(0, unitSize);

  float cx = ry*sz-ry*sy;
  float cy =  rx*sz-rz*sx;
  float cz =  rx*sy-ry*sx;

  float size = sqrt(cx*cx+ cy*cy + cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;


  float brightness = abs(cx*lx + cy*ly + cz*lz) ;

  fill(random(200,255), random(200,255), brightness * 255, brightness * 255);
  noStroke();
  beginShape();
  vertex(x, y, z);
  vertex(x+rx, y+ry, z+rz);
  vertex(x+sx, y+sy, z+sz);
  endShape();
  beginShape();
  vertex(x, y, z);
  vertex(x-rx, y-ry, z-rz);
  vertex(x-sx, y-sy, z-sz);
  endShape();
}
