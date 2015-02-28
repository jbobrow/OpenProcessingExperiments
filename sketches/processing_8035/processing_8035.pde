
paddle [] p;
int wi=10,he=40;
float pspeed=3;
int mouseyt;
boolean normalplay=false;
int startround=0;
ball b;
float radius=5;
vector normup,normdown,normleft,normright;
vector borderup,borderup2,borderdown,borderdown2;
PFont font;
int scoreleft=0,scoreright=0;

void setup() {
  size(320,200);
  font = loadFont("CourierNew36.vlw"); 
  textFont(font);
  p=new paddle[2];
  p[0]=new paddle();
  p[0].p.x=10;
  p[0].p.y=10+random(180);
  p[1]=new paddle();
  p[1].p.x=300;
  p[1].p.y=10;
  b=new ball();
  b.p.x=100;
  b.p.y=100;
  b.v.x=3;
  b.v.y=3;
  normup=new vector();
  normup.x=0;
  normup.y=1;
  normdown=new vector();
  normdown.x=0;
  normdown.y=-1;
  normleft=new vector();
  normleft.x=1;
  normleft.y=0;
  normright=new vector();
  normright.x=-1;
  normright.y=0;
  borderup=new vector();
  borderup.x=0;
  borderup.y=0;
  borderup2=new vector();
  borderup2.x=319;
  borderup2.y=0;
  borderdown=new vector();
  borderdown.x=0;
  borderdown.y=199;
  borderdown2=new vector();
  borderdown2.x=319;
  borderdown2.y=199;
  noStroke();
  background(0);
  frameRate(30);
}

void draw() {
  background(0);
  text(str(scoreleft),130,30);
  text(str(scoreright),170,30);
  rect(p[0].p.x,p[0].p.y,wi,he);
  rect(p[1].p.x,p[1].p.y,wi,he);  
  ellipse(b.p.x,b.p.y,radius,radius);
  if (b.p.x<10) {
    scoreright++;
    startround=0;
  }
  if (b.p.x>310) {
    scoreleft++;
    startround=1;
  }
  if (scoreleft==10 || scoreright==10) {
    normalplay=false;
    startround=0;
    scoreleft=0;
    scoreright=0;
  }
  aimove(0);
  if (normalplay) {
    playermove(1);
  }
  else {
    aimove(1);
  }
  if (startround!=2) {
    if (startround==0) {
      b.p.x=p[0].p.x+wi;
      b.p.y=p[0].p.y+he/2;
    }
    else {
      b.p.x=p[1].p.x-radius;
      b.p.y=p[1].p.y+he/2;
    }
  }
  else {
    b.move();
    b.collide(borderup,319,borderup2,normup);
    b.collide(borderdown,319,borderdown2,normdown);
    vector temp=new vector(p[0].p);
    temp.add(new vector(wi,0));
    vector temp2=new vector(temp);
    temp2.add(new vector(0,he));
    b.collide(temp,he,temp2,normleft);
    temp=new vector(p[1].p);
    temp2=new vector(temp);
    temp2.add(new vector(0,he));
    b.collide(temp,he,temp2,normright);
  }
}

void mousePressed() {
  if (!normalplay) {
    normalplay=true;
    scoreleft=0;
    scoreright=0;
    startround=3;
  }
  if (startround==1) {
    startround=2;
    float a=5*PI/6;
    b.v.x=cos(a)*5;
    b.v.y=sin(a)*5;
    b.p.x=p[1].p.x-radius;
    b.p.y=p[1].p.y+he/2;    
  }
}

void mouseReleased() {
  if (startround==3) {
    startround=1;
  }
}

void aimove(int pad) {
  if (startround==pad) {
    startround=2;
    if (pad==0) {
      float a=PI/6;
      b.v.x=cos(a)*5;
      b.v.y=sin(a)*5;
      b.p.x=p[0].p.x+wi;
      b.p.y=p[0].p.y+he/2;
    }
    else {
      float a=5*PI/6;
      b.v.x=cos(a)*5;
      b.v.y=sin(a)*5;
      b.p.x=p[1].p.x-radius;
      b.p.y=p[1].p.y+he/2;    
    }  
  }
  else {
    vector p2=new vector(b.v);
    p2.mulscalar(random(3)+6);
    p2.add(b.p);
    if (random(100)<65) {
      p[pad].move(sign(int(p2.y-p[pad].p.y-he/2)),max(int(p2.y-he/2),0));
    }
  }
}

void playermove(int pad) {
  p[pad].move(sign(int(mouseyt-p[pad].p.y)),mouseyt);
}

void mouseMoved() {
  mouseyt=mouseY;
}

int sign(int i) {
  if (i<0) return -1;
  else return 1;
}

class ball {
  vector p,v;
  ball() {
    p=new vector();
    v=new vector();
  }
  void move() {
    p.add(v);
  }
  void collide(vector a,int l,vector b,vector normal) {
    vector pp=new vector(p.x+radius/2,p.y+radius/2);
    float d1=dist(pp.x,pp.y,a.x,a.y);
    float d2=dist(pp.x,pp.y,b.x,b.y);
    vector pp2=new vector(pp);
    pp2.sub(a);
    float dd=abs(normal.dotprod(pp2));
    if (dd<radius/2 && d1<l && d2<l) {
      v=v.mirror(normal);
    }
  }
}

class paddle {
  vector p;
  paddle() {
    p=new vector();
  }
  void move(int sgn, int target) {
    if (abs(target-p.y)<pspeed) {
      p.y=target;
    }
    else {
      p.y+=int(sgn*pspeed);
    }
    if (p.y<0) {
      p.y=0;
    }
    if (p.y>200-he) {
      p.y=200-he;
    }
  }
}

class vector {
  public float x,y;
  vector() {
    x=0;
    y=0;
  }
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
  void sub(vector v) {
    x-=v.x;
    y-=v.y;
  }
  float dotprod(vector v) {
    return x*v.x+y*v.y;
  }
  void mulscalar(float f) {
    x*=f;
    y*=f;
  }
  vector perpendicular() {
    vector ret=new vector();
    ret.x=-y;
    ret.y=x;
    return ret;
  }
  vector mirror(vector v) {
    float f=-2*dotprod(v)/v.dotprod(v);
    vector ret=new vector(v);
    ret.mulscalar(f);
    ret.add(this);
    return ret;
  }
}


