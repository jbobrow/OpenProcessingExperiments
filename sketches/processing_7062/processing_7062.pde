
int a = 70, b = 100, ha = a/2, hb = b/2;
void setup(){
  size(300,300,P3D);
}

void draw(){
  background(0);
  translate(width/2, height/2, - width/2);
  rotateX(-radians(mouseY));
  rotateY(radians(mouseX));
  pushMatrix();
  translate(-ha, -ha, ha);
  fill(255,0,0);
  box(a,a,a);
  popMatrix();
  pushMatrix();
  translate(hb, hb, -hb);
  fill(0,255,0);
  box(b,b,b);
  popMatrix();
  pushMatrix();
  translate(hb, -ha, ha);
  fill(0,255,255);
  box(b,a,a);
  popMatrix();
  pushMatrix();
  translate(-ha, -ha, -hb);
  fill(0,255,255);
  box(a,a,b);
  popMatrix();
  pushMatrix();
  translate(-ha, hb, ha);
  fill(0,255,255);
  box(a,b,a);
  popMatrix();
  pushMatrix();
  translate(hb, hb, ha);
  fill(255,255,0);
  box(b,b,a);
  popMatrix();
  pushMatrix();
  translate(hb,-ha,-hb);
  fill(255,255,0);
  box(b,a,b);
  popMatrix();
  pushMatrix();
  translate(-ha, hb, -hb);
  fill(255,255,0);
  box(a,b,b);
  popMatrix();
}

