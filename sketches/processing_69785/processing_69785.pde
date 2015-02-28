
/**
*    ~ Vincent van Gogh's Turbolences ~
*      by kof 2012
*/


Hashtable h;
float tras = 10.0;
float b = 10;
float z;
PImage gogh;

int num = 10000;

void setup() {
  size(600, 440, P2D);

  gogh = loadImage("Vento.jpg");
  gogh.loadPixels();

  h= new Hashtable();
   for (int i = 0 ; i < num;i++) {
    h.put(i, new Particle(i, 2));
  }
  background(0);
}

void draw() {
  translate(noise(frameCount, 0)*tras/(noise(frameCount/30.0)*10.0), noise(0, frameCount)*tras/(noise(frameCount/30.0)*10));
  
  //tint(255,noise(frameCount/30.0)*30);
  //image(gogh,0,0);
  
  fill(0, 3);
  rect(-10, -10, width+10, height+10);
  for (int i = 0; i < h.size();i++) {
    Particle tmp = (Particle)h.get(i);
    if (i==num-(int)(noise(frameCount/3.0)*num))
      fastblur(g, 1);
    tmp.draw();
  }
}

class Particle {
  PVector p, v, a;
  float s;
  color c, cl;
  float lim;
  float d;
  int id;

  Particle follow, afraid;
  int fi, af;
  boolean newBorn = true;

  Particle(int _id, float _s) {
    id = _id;
    s = _s;
    p = new PVector(random(b, width-b), random(b, height-b));
    a =  new PVector(0, 0);
    v = new PVector(0, 0);
    lim = random(2.5, 2.7);
  }

  void getNewF() {
    fi  = (int)random(num);
    follow = (Particle)h.get(fi);

    af  = (int)random(num);
    afraid = (Particle)h.get(af);
  }

  void draw() {

    if (newBorn) {
      getNewF();
      newBorn = false;
    }

    bounce();

    p.add(v);
    v.add(a);


    PVector attract = new PVector(follow.p.x-p.x, follow.p.y-p.y);
    attract.mult(0.33);
    a.add(attract);

    attract = new PVector(follow.a.x-a.x, follow.a.y-a.y);
    attract.mult(0.02);
    a.add(attract);

    PVector detract = new PVector(p.x-afraid.p.x, p.y-afraid.p.y);
    detract.mult(0.01);
    a.add(detract);

    detract = new PVector(a.x-afraid.a.x, a.y-afraid.a.y);
    detract.mult(0.000033);
    a.add(detract);

    v.mult(0.99);
    a.mult(0.1);

    v.limit(lim);


    float theta = atan2(follow.p.y-p.y, follow.p.x-p.x);
    d = dist(follow.p.x, follow.p.y, p.x, p.y);
    c = gogh.pixels[(int)p.y*gogh.width+(int)p.y];
    stroke(c, (15-d/4.0)+5.0);

    if (d<40) {
      line(follow.p.x, follow.p.y, p.x, p.y);


      /*
      if (id%2000==0)
       {
       noFill();
       fill(0,90);
       pushMatrix();
       translate(p.x,p.y);
       rotate(theta);
       ellipse(0, 0, d, d);
       //rect(-10,-10,20,20);
       popMatrix();
       }
       */
    }
  }

  void border() {
    if (p.x<b||p.x>width-b||p.y<b||p.y>height-b) {
      p.x = random(b, width-b);//constrain(p.x, 1, width-1);
      p.y = random(b, height-b);//constrain(p.y, 1, width-1);
    }
  }

  void bounce() {
    if (p.x<b || p.x>width-b) {
      a.x*=-1;
      //v.x*=-1;
    }
    if (p.y<b || p.y>height-b) {
      //v.y*=-1;
      a.y*=-1;
    }
    border();
  }
}

void mouseDragged() {

  for (int i =0 ; i < h.size(); i++) {
    Particle tmp = (Particle)h.get(i);
    if (dist(tmp.p.x, tmp.p.y, mouseX, mouseY)<20 ) {
      tmp.newBorn = true;
    }
  }
}


