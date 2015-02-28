
float dx =2.618, dy =-0.041;
float xs, ys;
hslider s = new hslider(10, 10, 100, 25, 10);
void setup() {
  size(765, 765, P3D);
  colorMode(RGB);
noStroke();
}
void draw() {
  if(keyPressed) {
  switch(key) {
    case 'w':
    ys-=0.3;
    break;
    case 's':
    ys+=0.3;
    break;
    case 'a':
    xs+=0.3;
    break;
    case 'd':
    xs -= 0.3;
    break;
  }
  }
  background(255);
  fill(0);
  text(dy, 10, 50);
  text(dx, 10, 100);
  lights();
  rgbox(s.slvar+10);
  stroke(0);
  s.draw();
  s.drawellipse();
  noStroke();
}
void rgbox(float r) {
  pushMatrix();
  r=255/r;
  translate(width/2, height/2, 0);
  rotateX(dx);
  rotateY(dy);
    translate(-500/2, -500/2, -500/2);
    fill(255);
  for(int x = 0; x<500/r; x++) {
    for(int z = 0; z<500/r; z++) {
      for(int y = 0; y<int(abs(noise((x+xs)/7, (z+ys)/7)+1)*10)-r/6; y++) {
        pushMatrix();
        translate(x*r, y*r, z*r);
        box(r);
        popMatrix();
      }
    }
}
popMatrix();
}

 
class hslider{
  float slvar, x, y, xs, ex, max;
  hslider(float xv, float yv, float xsv, float maxvar, float stv) {
    xs = xsv;
    y=yv;
    x=xv;
    ex=x+stv;
    max=maxvar;
  }
  void draw() {
    line(x, y, x+xs, y);
    ellipse(ex, y, 15, 15);
    slvar = (ex-x)*(max/xs);
  }
  void drawellipse() {
    if(mousePressed && mouseY > y-15/2 && mouseY < y+15/2 && mouseX < x+xs && mouseX > x) {
      ex=mouseX;
    }
  }
}




