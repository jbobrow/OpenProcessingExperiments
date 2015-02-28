
// Apologies for yet another recursive tree generation sketch :)
// Steven kay, Sep 2010

int NUM_LEGS=3; // how many legs?

// change to get suitable framerate... chosen to give around 20 fps
// on a 2GHz dual core. Your mileage may vary. Tweak these to give more
// impressive results if you have more RAM/CPU/GPU muscle than I do ;-)

int CUTOFF=5; // minimum atom size cutoff
int MAX_ATOMS=150; // maximum number atoms
int SPHERE_DETAIL=10; // change to get suitable framerate

// change the look...

float DECAY=.99; // Decay speed, this *MUST* be <1.0 (this is trapped to prevent a stack overflow)
float SPACING=.7; // how far apart to space the atoms, relative to radius (=1.0)
color root=color(255,255,255); // colour in the middle
color tip=color(0,255,255); // colour at the tips
float FORK_PROB=0.1; // likelihood of branches splitting. 

void setup() {
  size(512,512,P3D);
  doone();
  sphereDetail(SPHERE_DETAIL);
}

class abox {
  public float x,y,z,sz;
  public color col;
  public abox(float _x,float _y,float _z,float _sz,color _col) {
    x=_x;y=_y;z=_z;sz=_sz;col=_col;
  }
}

ArrayList boxes;
int ix=20;

void doone() {
  NUM_LEGS=int(random(1,4));
  DECAY=random(0.85,0.98);
  boxes=new ArrayList();
  ix=20;
  for (int i=0;i<NUM_LEGS;i++) {
    branch(0,0,0,i*TWO_PI/NUM_LEGS,-i*TWO_PI/NUM_LEGS,ix*.01,ix*.01,32.0);
    branch(0,0,0,i*TWO_PI/NUM_LEGS,i*TWO_PI/NUM_LEGS,-ix*.01,-ix*.01,32.0);
  }
}

void draw(){ 
  background(0);
  
  float phase=sin((frameCount/100)*TWO_PI);
  lightSpecular(204, 204, 204);
  directionalLight(200,255,255, -1, phase, 0);
  directionalLight(200,0,255, 0, 0,-.81);
  noStroke();
  fill(255);
  ellipseMode(CENTER);
  for (ix=0;ix<boxes.size();ix++) {
    abox a=(abox)(boxes.get(ix));
    pushMatrix();
    translate(256,256,0);
    rotateZ(0.04*frameCount);
    rotateX(0.03*frameCount);
    rotateY(0.05*frameCount);
    translate(a.x,a.y,a.z);
    fill(a.col);
    sphere(a.sz);
    popMatrix();
  }
  loadPixels();
  int scroll=frameCount%256;
  for (int ix=0;ix<pixels.length;ix++) {
    int x=(ix%width)+scroll;
    int y=ix/width;
    if ((pixels[ix]&0x00FFFFFF)==0) 
    //  if (random(0,100)>80)
      pixels[ix]=0xFF000000 | ((x^y)<<24) | ((y&x)<<16);
  }
  updatePixels();
  if (frameCount%128==0) doone();
  if (frameCount%128==0) print(frameRate+"fps\n");
}

void keyPressed() {
  doone();
  
  redraw();
}

void branch(float x,float y,float z,float ang,float zang,float turnspeed,float turnspeedz,float sz) {
  // need a stop condition
  if (sz>CUTOFF && boxes.size()<150 && DECAY<1.0) {
    color cc=lerpColor(tip,root,sz/32);
    boxes.add(new abox(x,y,z,sz,cc));
    float xx=x+SPACING*(sz*sin(ang));
    float yy=y+SPACING*(sz*cos(ang));
    z=z-.5*(sz*sin(zang));
    ang+=turnspeed;
    zang+=turnspeedz;
    sz=sz*DECAY;
    if (random(1)<FORK_PROB) {
       // fork into two branches
       branch(xx,yy,z,ang,zang,turnspeed,turnspeedz,sz);
       if (random(0,50)>50) {
         branch(xx,yy,z,ang,zang,-turnspeed,-turnspeedz,sz);
       } else {
         branch(xx,yy,z,ang,zang,-turnspeed,turnspeedz,sz);
       }
    } else {
      // continue current branch
      branch(xx,yy,z,ang,zang,turnspeed,turnspeedz,sz);
    }
  }
}

