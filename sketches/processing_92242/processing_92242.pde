
ArrayList<Part> parts;
PShape m;
float fx, fy, lx, ly;
color bgc = #4D3E52;
int a = 200;
float count = 0;
void setup() {
  size(500, 500, P2D);
  //  smooth();
  fill(0, bgc);
  rect(0, 0, width, height);
  parts = new ArrayList();
}
void mousePressed() {
  count=0;
  parts = new ArrayList();
  fx = mouseX;
  fy = mouseY;
  a = int(random(20)+110);
}
void mouseDragged() {
  // lx = mouseX;
  //ly = mouseY;
  //make();
}
void draw() {
  noStroke();
  fill(bgc);
  rect(0, 0, width, height);
  if (mousePressed)
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

  pushMatrix();
  noFill();
  stroke(255);

  popMatrix();

  pushMatrix();
  translate(fx, fy);

  drawLine(color(120, 90, 210, 205), 1,parts.size()-1);
  popMatrix();
  a = parts.size();
  count+=.01;
  for (int i=0;i<a;i++) {


    pushMatrix();
    if (parts.size()>0) {
      //    Part _p = parts.get(int(random(parts.size()-1)));
      //      Part _p = parts.get(int(float(i)/float(a)*parts.size()));
      Part _p = parts.get(i);
      translate(fx+_p.position.x, fy+_p.position.y);
    

    rotate(radians(i*5+count));

    //    shape(m);
    colorMode(HSB);

  
    drawLine(color(123, float(i)/float(a)*90, 210, 205), .3*_p.size, i);
    if(_p.size<1){
    _p.size+=.05;
    }
    }
    popMatrix();
  }
}
void drawLine(color c, float scale, int n) {
  stroke(c);
  //  strokeWeight(2);
  for (int j = 0;j<n;j++) {
    //    m.stroke(s--);
    Part p1 = parts.get(j);
    Part p2 = parts.get(j+1);
    //    p1.update();
    //    point(p1.position.x*scale+random(10)-5, p1.position.y*scale+random(10)-5);
    line(p1.position.x*scale, p1.position.y*scale, p2.position.x*scale, p2.position.y*scale);
  }
}

void make() {
  Part p = new Part(mouseX-fx, mouseY-fy, 0);
  count+=.5;
  p.xoff = count;
  parts.add(p);
}
void keyPressed() {
  if (key == 's') {
    saveFrame("images/screen_#####.png");
  }
}
class Part {
  PVector position = new PVector(0, 0);
  float size = 1;
  float xoff = 0;
  float yoff = 1;
  
  Part(float x, float y, float size) {
    position.x=x;
    position.y=y;
    this.size = size;
  }
  void update() {
    size=random(5);
    xoff+=.01;
    yoff+=.01;
    position.x+=map(noise(xoff), 0, 1, -.5, .5);
    position.y+=map(noise(yoff), 0, 1, -.5, .5);
  }
}

