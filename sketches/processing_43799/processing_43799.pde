
class Creature {
  PVector pos, dir;
  float speed;
  float size;
  float degree;
  float sine;
  int nlegs;
  int[] nsegs;
  float[] wsegs;
  float[] hsegs;
  float[]stren;
  float[]fdegrees;
  public Creature(float x, float y) {
    pos=new PVector(x, y);
    dir=new PVector(random(-5, 5), random(-5, 5) );
    this.speed=random(5, 100)/100*5;
    this.size=random(6, 30);
    degree=random(360);

    nlegs=(int)random(1, 12);
    nsegs=new int[nlegs];
    wsegs=new float[nlegs];
    hsegs=new float[nlegs];
    stren=new float[nlegs];
    fdegrees=new float[nlegs];
    for (int i=0;i<nlegs;i++) {
      nsegs[i]=(int)random(3, 20);
      wsegs[i]=random(4, size);
      hsegs[i]=random(6, size);
      stren[i]=random(0.2, 0.8);
      fdegrees[i]=random(360);
    }
  }
  public void draw() {

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(sine);
    float atem=size/4+size/4*sine;
    ellipse(0, 0, size+atem, size+atem);

    degree = degree>=360 ? 0 : degree+speed;
    sine=sin(radians(degree));
    for (int i=1;i<=nlegs;i++) {
      leg(
      360/nlegs*i, 
      wsegs[i-1], 
      hsegs[i-1], 
      nsegs[i-1], 
      stren[i-1], 
      sin(radians(fdegrees[i-1])));
      fdegrees[i-1] = fdegrees[i-1]>=360 ? 0 : fdegrees[i-1]+speed;
    }
    popMatrix();
    float cose=cos(radians(degree));
    pos.x+=dir.x*sine;
    pos.y+=dir.y*cose;
  }
  
  void leg(float dir, float w, float h, int seg, float strength, float fsin) {
    pushMatrix();
    rotate(radians(dir));
    translate(0, this.size/2);
    float segm=w/seg;
    for (int i=0;i<seg;i++) {
      float tw=segm*(seg-i);
      rect(0, 0, tw, h);
      translate(0, h*0.75);
      rotate(fsin*strength);
    }
    popMatrix();
  }
}


