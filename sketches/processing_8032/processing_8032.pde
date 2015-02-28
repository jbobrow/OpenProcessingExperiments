
ArrayList particles=new ArrayList();
vector gravity=new vector(0,0.1);

void setup() {
  size(320,200);
  frameRate(30);
}

void draw() {
  Iterator i=particles.iterator();
  while (i.hasNext()) {
    particle p=(particle)i.next();
    p.move();
    if (p.outofscreen()) {
      i.remove();
    }
    else {
      //set(int(p.p.x),int(p.p.y),color(0,0,0));
      fill(p.c);
      ellipse(int(p.p.x),int(p.p.y),5,5);
    }
  }
  if (random(100)<20) {
    vector center=new vector(random(319-60),random(199-40));
    float num=random(30)+10;
    float velo=random(3)+0.5;
    for (float f=0;f<TWO_PI;f+=TWO_PI/num) {
      particle newp=new particle();
      newp.p=new vector(center);
      newp.v=new vector(velo*cos(f),velo*sin(f));
      newp.c=color(int(random(255)),int(random(255)),int(random(255)));
      particles.add(newp);
    }
  }
  filter(BLUR,1);
}

class vector {
  public float x,y;
  vector(vector v) {
    x=v.x;
    y=v.y;
  }
  vector(float a,float b) {
    x=a;
    y=b;
  }
  void add(vector v) {
    x+=v.x;
    y+=v.y;
  }
}

class particle {
  vector p;  //position
  vector v;  //velocity
  color c;
  void move() {
    v.add(gravity);
    p.add(v);
  }
  boolean outofscreen() {
    if (p.x<0 || p.x>319 || p.y<0 || p.y>199) {
      return true;
    }
    return false;
  }
}

/*void keyPressed() {
  saveFrame("m:/fireworks.jpg");
}*/

