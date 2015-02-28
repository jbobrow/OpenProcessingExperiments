
import peasy.*;
import processing.opengl.*;
PFont font;
PeasyCam cam;


MorpSystem sys;




PVector[] current;
PVector[] target ;

void setup() {
  size(800, 400, P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(1000);
  cam.setMaximumDistance(1500);


  
  current = new PVector[100];
  target = new PVector[100];

  for (int i=0;i<current.length;i++) current[i] = new PVector(random(width), random(height), 250+random(-500));
  for (int i=0;i<target.length;i++)   target[i] = new PVector(random(width), random(height), 250+random(-500));
  sys = new MorpSystem(current);
  
  rectMode(CENTER);
  
}

void drawBoxHull() {
  pushMatrix();
  pushStyle();
  noFill();
  strokeWeight(1);
  stroke(255);
 // translate(-width/2,-height/2,250);
   box(width,height,-500);
   
   popStyle();
  popMatrix();
  
}


void draw() {
  background(100,130,120);
  drawBoxHull();
  translate(-width/2,-height/2,0);
 
  //move Points to new Pos
  sys.update();
  //draw morphPoints
  sys.draw();

  pushStyle();
  strokeWeight(10);
  stroke(255);
  PVector a; 
  //iterates through morphed elements
  for (int i=0;i<sys.getLength();i++) {
    
  //gets the morphed element
    a = sys.getElement(i); 
    
    pushMatrix();
    translate(a.x, a.y,a.z);
    box(5);
    popMatrix();
  }
  popStyle();
  

}

void newMorphTarget() {
  //sets the new Target to object target 
  sys.setTarget(target);
  //defines new randowm target values with random length
  target = new PVector[1+(int)random(100)];

  for (int i=0;i<target.length;i++)   target[i] = new PVector(random(width), random(height), 250+random(-500));
  
}

void keyReleased() {
newMorphTarget();
}





class MorpSystem {

  float speed =0.03; //speed of Animation
  float ani=0;

  int cnum=7;
  int tnum=19;

  Pos[] c = new Pos[cnum];
  Pos[] t = new Pos[tnum];

  boolean finished=false;



  public MorpSystem(PVector[] cI) {
    c = new Pos[cI.length];

    for (int i = 0;i<cI.length;i++) {
      c[i] = new Pos(cI[i]);
    }

    setTarget(cI);

    reset();
  }


  public MorpSystem(PVector[] cI, PVector[] tI) {
    c = new Pos[cI.length];

    for (int i = 0;i<cI.length;i++) {
      c[i] = new Pos(cI[i]);
    }

    setTarget(tI);

    reset();
  }

  public void setTarget(PVector[] tI) {

    t = new Pos[tI.length];
    for (int i = 0;i<tI.length;i++) {
      t[i] = new Pos(tI[i]);
    }
    reset();
  }

  public void reset() {
    lookForTarget();
    ani=0;
  }


  void lookForTarget() {




    //only check for targets if the array of targets is not empty
    if (t.length>0) {

      //if number of orgin points is smaller then the destiny - 
      //then increase the origin points with random seeds from the existing ones

      if (c.length<t.length) resizeOrigin();
      for (int i=0;i<c.length;i++) {

        float distV=100000;
        float distC=0;
        int indexChosen=0;

        if (i%t.length==0) {
          for (int j = 0;j< t.length;j++) {
            t[j].chosen=false;
          }
        }

        for (int j = 0;j< t.length;j++) {
          if (!t[j].chosen) {

            distC=dist(c[i].c.x, c[i].c.y, c[i].c.z, t[j].c.x, t[j].c.y, t[j].c.z);

            if (distC<distV) {
              indexChosen = j;
              distV=distC;
            }
          }
        }
        t[indexChosen].chosen=true;
        c[i].t = new PVector(t[indexChosen].c.x, t[indexChosen].c.y, t[indexChosen].c.z);
        c[i].initMove();
      }
    }
  }

  void resizeOrigin() {

    int n=0;
    for (int i =c.length ;i<t.length;i++) {
      n =(int)random(c.length);
      Pos a = new Pos(new PVector(c[n].c.x, c[n].c.y, c[n].c.z));
      c = (Pos[]) append(c, a);
    }
  }

  public void update() {


    if (ani>=1) {
      finished = true;
    }
    else {
      finished = false;
    }

    if (!finished)
      moveToTarget();
    else {
      c=t;
      //c = new Pos[t.length];
      //for (int i = 0;i<t.length;i++) c[i]=t[i];
    }
  }

  public void setSpeed(float speedI) {
    speed=speedI;
  }

  public void moveToTarget() {
    ani+=speed;

    for (int i=0;i<c.length;i++) {
      c[i].move(ani);
    }
  }

  public void moveToTargetCustom(float ani) {
    for (int i=0;i<c.length;i++) {
      c[i].move(ani);
    }
  }

  public int getLength() {
    return c.length;
  }

  public PVector getElement(int index) {
    return c[index].c;
  }



  public void draw() {

    strokeWeight(3);

    stroke(255,50,50);
    for (int i=0;i<t.length;i++) {
      t[i].draw();
    }


    stroke(255);
    for (int i=0;i<c.length;i++) {

      c[i].draw();
    }
  }
}






class Pos {
  
  //The origin 
  PVector o = new PVector();   
  
  //The Position it is currently
  PVector c = new PVector(); 
  //The TargetPosition
  PVector t = new PVector();

  //chosen - if this point is selected as a target by another Point
  boolean chosen = false;




  public Pos() {
  }

  public Pos(PVector cI) {
    //Current and target is the same
    o = cI;
    c = cI;
    t = cI;
  }

  public Pos(PVector cI, PVector tI) {
    //Current and target is the same
    o = cI;
    c = cI;
    t = tI;
  }

  public void reset() {
    chosen=false;
  }
  
  public void initMove() {
   o = new PVector(c.x,c.y,c.z); 
  }

  void move(float ani) {
    c.x=o.x+(t.x-o.x)*sin(PI/2*ani);
    c.y=o.y+(t.y-o.y)*sin(PI/2*ani); 
    c.z=o.z+(t.z-o.z)*sin(PI/2*ani);
  }

  void draw() {

    point(c.x, c.y, c.z); 

    pushStyle();
    strokeWeight(1);
    stroke(255,0,0);
    line(c.x, c.y, c.z, t.x, t.y, t.z);
    popStyle();
  }
}


