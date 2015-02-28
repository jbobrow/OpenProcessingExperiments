
ArrayList<Part> parts;
PShape m;
float fx, fy, lx, ly;
color bgc = #4D3E52;
int a = 100;
float count = 0;
void setup() {
  size(500, 500);
  //  smooth();
  //fill(0, bgc);
  rect(0, 0, width, height);
  parts = new ArrayList();
}
void mousePressed() {
  count=0;
  parts = new ArrayList();
  fx = mouseX;
  fy = mouseY;
  a = int(random(2)+12);
}

void draw() {
  noStroke();
  fill(bgc);
  rect(0, 0, width, height);
  if(mousePressed)
  make();
  if (parts.size()>1) {
    Part _p = parts.get(parts.size()-1);
    if (!mousePressed) {
      parts.remove(_p);
      count-=.2;
    }
    _p = parts.get(parts.size()-1);
    lx = _p.position.x+fx;
    ly = _p.position.y+fy;
  }
  for (int i=0;i<a;i++) {
    pushMatrix();
    translate(lx, ly);
    //scale(noise(i));
    //rotate(radians(float(i)/float(a)*parts.size()));
    rotate(radians(float(i)/float(a)*count*20));
    //shape(m);
    //colorMode(HSB);

    //drawLine(color(150,150, 255*float(i)/float(a),155));
    drawLine(color(map(noise(count), 0, 1, 120, 245)));
    popMatrix();
  }
}
Part p1;
Part p2;
void drawLine(color c) {
  stroke(c);
  for (int j = 0;j<parts.size()-1;j++) {

    p1 = parts.get(j);
    p2 = parts.get(j+1);

    point(p1.position.x+fx-lx+random(10)-5,p1.position.y+fy-ly+random(10)-5);
    line(p1.position.x+fx-lx, p1.position.y+fy-ly, p2.position.x+fx-lx, p2.position.y+fy-ly);
  }
}

void make() {
  Part p = new Part(mouseX-fx, mouseY-fy);
  count+=.2;
  p.xoff = count;
  parts.add(p);
}
class Part {
  PVector position = new PVector(0, 0);
  Part(float x, float y) {
    position.x=x;
    position.y=y;
  }  
}
