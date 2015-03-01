
void setup()
{
  size(700, 700, P3D);

}
void draw()
{
  background(74, 140, 128);
  translate(width/2, height/2, 0);
  drawBackLight();
  drawMouth(0,100,200);
  pushMatrix();
 
  rotateZ(radians(90));
  rotateY(radians(180));
  rotateY(radians(mouseY/5+25));
  rotateZ(radians(-mouseX/5+75));
  
  noStroke();
  fill(242,236,155);
  drawSphere(0, 0, 0, 200);
  fill(255, 255, 255);
  drawEye(160, -20);
  drawEye(160, 20);
 
  popMatrix();
 
   fill(242,236,155);
   drawSphere(0, 450, 0, 250);
   drawSphere(-200, 0, 0, 40);
   drawSphere(200, 0, 0, 40);
   
   pushMatrix();
   rotateZ(radians(90));
   rotateY(radians(270));
   rotateX(radians(45));
   drawHat(0,0,200,70,180);
   rotateX(radians(-90));
   drawHat(0,0,200,50,130);
   popMatrix();
}
void drawSphere(float x, float y, float z, float r) {
  //fill(242,236,155);
  noStroke();
  pushMatrix();
  translate(x, y, z);
  sphere(r);
  popMatrix();
}
void drawEye(float x, float y) {
  fill(255);
  drawSphere(x, y, 30, 40);
  fill(0);
  drawSphere(x+30, y, 30, 15);
}
 
 
void drawMouth(float x, float y, float z) {
  pushMatrix();
  translate(x, y, z);
  stroke(0);
  noFill();
  beginShape();
  curveVertex(-100,-100,0);
  curveVertex(-100,-50,0);
  curveVertex(-75,-35,0);
  curveVertex(0,0,0);
  curveVertex(75,-35,0);
  curveVertex(100,-50,0);
  curveVertex(100,-100,0);
  endShape();
  popMatrix();
}
void drawBackLight() {
  
  float lx=0, ly=0, lz=-1;
   
  float x=random(-600,600);
  float y= random(-600,600);
  float z=0;
   
  float rx=random(-100,100);
  float ry=random(-100,100);
  float rz=0;
   
  float sx=random(-100,100);
  float sy=random(-100,100);
  float sz=0;
   
  float cx=(ry*sz-ry*sy);
  float cy=-(rx*sz-rz*sx);
  float cz=0;
   
  float size = sqrt(cx*cx+cy*cy+cz*cz);
  cx=cx/size;
  cy=cy/size;
  cz=cz/size;
   
  float brightness = abs(cx*lx+cy*ly+cz*lz);
   
   
   
 noStroke();
fill(242,109*brightness,61,random(50,250));
  beginShape();
vertex(0,0,0);
vertex(x+rx,y+ry,z+rz);
vertex(x+sx, y+sy, z+sz);
 
 
 
  endShape();
  
}
 
 
void drawHat(float x, float y, float z, float r, float h) {
  pushMatrix();
  translate(x, y, z);
  
  float delta = 3;
 
  for (float az =0; az<h; az+=5) {
    for (float deg = 0; deg<360; deg+=delta) {
      if(az%60 >30) stroke(255);
      else stroke(242,12,31);
      float theta = radians(deg);
      float ax = r*cos(theta);
      float ay = r*sin(theta);
      point(ax, ay, az);
    }
    r-=2;
  }
  popMatrix();
}


