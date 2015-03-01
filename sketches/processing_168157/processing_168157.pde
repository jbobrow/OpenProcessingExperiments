
float delta = 10, alpha = 100;
float r = 200;
float X1, Y1=10;
boolean isAlphaMax = false;
void setup() {
  size(600, 600, P3D);
  frameRate(60);
  //noCursor();
}
 
void mousePressed(){
 if(alpha >200 || alpha<100)
   isAlphaMax = ! isAlphaMax;
 if(isAlphaMax)
   alpha-=50;
 else
   alpha+=50; 
  
}
void draw() {
 
  background(0);
  stroke(255);
  strokeWeight(1);
 
  rotateX(radians(mouseX));
  translate(width/2, height/2, 0);
 
  for (float deg2 =0; deg2 < 360; deg2 += delta) {
    float phi = radians(deg2);
    for (float deg = 0; deg < 360; deg +=delta) {
      float theta = radians(deg);
      float x = r * sin(phi)*cos(theta);
      float y = r * sin(phi)*sin(theta);
      float z = r * cos(phi);
      if (mousePressed){
        
          drawTri(x, y, z);
      }
      else point(x, y, z);
    }
  }
 
  for (int i=0; i<10000; i++) {
 
    rotate(radians(random(0, 360)));
    int randomLength = int(random(10, height/2));
    stroke(map(randomLength, 0, height/2, 255, 0));
 
    line(0, 0, 0, randomLength);
  }
}
 
void drawTri(float x, float y, float z) {
 
  float lx =0, ly =0, lz =1;
 
  float rx= random(-alpha, alpha);
  float ry= random(-alpha, alpha);
  float rz= random(-alpha, alpha);
 
  float sx= random(-alpha, alpha);
  float sy= random(-alpha, alpha);
  float sz= random(-alpha, alpha);
 
  float cx =  (ry*sz - ry*sy);
  float cy = -(rx*sz - rz*sx);
  float cz = (rx*sy - ry*sx);
 
  float size= sqrt( cx*cx + cy*cy + cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;
 
  float brightness = abs(cx*lx + cy * ly + cz *lz);
  
  noStroke();
  fill (brightness*255);
 
  beginShape();
  vertex(x, y, z);
  if(random(0,2)%2==0)
    vertex(x+rx, x+ry, z+rz);
  else
    vertex(x-rx, x-ry, z-rz);
    
  if(random(0,2)%2==0)
    vertex(x+sx, x+sy, x+sz);
  else
    vertex(x-sx, x-sy, x-sz);
  endShape();
}

