
PShape img;
void setup(){
  frameRate(24);
  img=loadShape("heart.svg");
  size(2200,1400);
}
void draw(){
  background(0);
for (int i=0;i<img.getChildCount();i++){
  PShape tri=img.getChild(i);
  pushMatrix();
  translate(400,300);
  for (int j=0;j<tri.getVertexCount();j++){
    float dxy=frameCount*frameCount/40.0;
    tri.setVertex(j,tri.getVertexX(j)+random(-dxy,dxy),tri.getVertexY(j)+random(-dxy,dxy));
  }
  shape(tri);
  popMatrix();
}
}



