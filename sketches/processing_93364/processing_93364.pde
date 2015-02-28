
aball anaball = new aball(random(width),random(height));
void setup() {
  size(700, 600);
  frameRate(400);
}
void draw() {
  //background(0);
  for(int i = 0; i < 3; i++) {
  anaball.drawaball();
  }
}
class aball {
  float x, y, xv, yv, d;
  aball(float xm, float ym){
    x=xm;
    y=ym;
  }
  void drawaball() {
    d=atan2(mouseX-x, mouseY-y);
   // if( ! (xv % sin(d) == 0 &&  yv % cos(d) == 0)) {
      xv+=(sin(d)/15);///(dist(mouseX, mouseY, x, y)/500);
      yv+=(cos(d)/15);///(dist(mouseX, mouseY, x, y)/500);
    //}
    x+=xv;
    y+=yv;
    ellipse(x, y, 20, 20);
  }
}
