
void setup(){
  size(600,600,P3D);
  background(0);
}

void draw(){
  float lx=0,ly=0,lz=1;
  
  float x=random(0,600);
  float y=random(0,600);
  float z=random(0,600);
  
  float rx=random(0,100);
  float ry=random(0,100);
  float rz=random(0,100);
  
  float sx=random(0,100);
  float sy=random(0,100);
  float sz=random(0,100);
  
  float cx=(ry*sz-ry*sy);
  float cy=-(rx*sz-rz*sx);
  float cz=(rx*sy-ry*sx);
  
  float size=sqrt(cx*cx+cy*cy+cz*cz);
  cx=cx/size;
  cy=cy/size;
  cz=cz/size;
  
  float brightness=abs(cx*lx+cy*ly+cz*lz);
  float r=random(255);
  float g=random(255);
  float b=random(255);
  
  for(int x2=0; x2<width; x2+=50){
    for(int y2=0; y2<height; y2+=50){
      for(int z2=0; z2<600; z2+=50){
  fill(brightness*r,brightness*g,brightness*b);
  beginShape();
  vertex(x+x2,y+y2,z+z2);
  vertex(x+rx+x2,y+ry+y2,z+rz+z2);
  vertex(x+sx+x2,y+sy+y2,z+sz+z2);
  endShape();
  }
  }
  }
}
