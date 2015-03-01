
float delta=1;
float r=200;

void setup()
{
  size(600,600,P3D);
  

}

void draw()
{
  background(150);
  
  pushMatrix();
  
  translate(width/2, height/2, 0);
  rotateX(radians(286));
  
  
  r=200;
  for(float z=0; z<200; z+=5){
    for(float deg=0; deg<360; deg+=delta){
      float theta = radians(deg);
      float x = r*cos(theta);
      float y = r*sin(theta);
      strokeWeight(5);
      stroke(#090D2E);
      point(x,y,z);
    }
    r-=5;;
  }
  
  popMatrix();
  
  float lx=0, ly=0, lz=1;
  float x = random(100,400);
  float y = random(0,300);
  float z = random(0,100);
  
  float rx = random(0,100);
  float ry=random(0,100);
  float rz=random(0,100);
  
  float sx = random(0,100);
  float sy = random(0,100);
  float sz = random(0,100);
  
  float cx=(ry*sz-ry*sy);
  float cy=-(rx*sz-rz*sx);
  float cz=(rx*sy-ry*sx);
  
  float size = sqrt(cx*cx +cy*cy +cz*cz);
  cx=cx/size;
  cy=cy/size;
  cz=cz/size;
  
  float brightness = abs(cx*lx+cy*ly+cz*lz);
  
  fill(brightness*255,100,0);
  beginShape();
  vertex(x,y,z);
  vertex(x+rx,y+ry,z+rz);
  vertex(x+sx, y+sy, z+sz);
  endShape();
  
  
}


