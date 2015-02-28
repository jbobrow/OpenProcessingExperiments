
int num = 7;
swarm[] array;
void setup() {
  size (400, 400);
  
  array = new swarm[num];
  
  for (int i = 0; i < num; i++) {
    array[i] = new swarm(0, random(0, width), random(0, height), random(-3, 3), random(-3, 3));
  }
}
void draw() {
  background(0);
  for(int a=0;a<num;a++) {
    array[a].draw();
  }
}
class particle {
  float baserad, num, turnspeed, d, ctpx, ctpy, xpos, ypos, circ, density, xspeed, yspeed;
  particle(float baseradvar, float turnspeedvar, float numvar, float ctpxvar, float ctpyvar, float circvar, float densityvar, float xspeedvar, float yspeedvar) {
    baserad = baseradvar;
    turnspeed = turnspeedvar;
    num = numvar;
    ctpx = ctpxvar;
    ctpy = ctpyvar;
    circ = circvar;
    xspeed=xspeedvar;
    yspeed=yspeedvar;
    num =( (circ/3)*numvar)+density;
    density = densityvar;
  }
  void create() {
    ctpx+=xspeed;
    ctpy+=yspeed;
    d+=turnspeed;
    xpos = ctpx+sin(d-num)*(noise(d-num)*baserad);
    ypos = ctpy+cos(d-num)*(noise(d-num)*baserad);
    ellipse(xpos, ypos, 3, 3);
      if(xpos<0) {
    xspeed *=-1;
  }
  if(xpos>width) {
    xspeed*=-1;
  }
  if(ypos<0) {
    yspeed*=-1;
  }
  if(ypos>height) {
    yspeed*=-1;
  }
  }
}
class swarm {
  float density;
particle[] list;
float xpos, ypos, d, xvel, yvel;
swarm(float density, float x, float y, float xvelvar, float yvelvar) {
  xpos = x;
  ypos = y;
  xvel = xvelvar;
  yvel = yvelvar;
    list = new particle[round(200-density)];
    
      for (int i = 0; i < round(200-density); i++) {
    list[i] = new particle(50, random(-0.03, 0.03), i, xpos, ypos, 50, density, xvel, yvel);
  }
}
void draw() {
  xpos+=xvel;
  ypos+=yvel;
      for (int i = 0; i < 200-density; i++) {
      list[i].create();
  }
    if(xpos>width) {
    xpos=1;
  }
  if(ypos<0) {
    ypos=height;
  }
  if(ypos>height) {
    ypos=1;
  }
        if(xpos<0) {
    xpos = width;
  }
}
}


