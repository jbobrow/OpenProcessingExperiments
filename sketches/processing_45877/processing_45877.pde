
//import processing.opengl.*;
import toxi.geom.*;

//initialize fireflies array
ArrayList fireflIES;

//initialize bugs array
ArrayList bugS;


//=====================================================================//SETUP
void setup() {
  size(900, 600, P3D);
  colorMode(HSB);
  smooth();

//-----------------------------------------------------------------------

  //initialize fireflies array
  fireflIES = new ArrayList();
  
  //initialize bugs array
  bugS = new ArrayList();


//---------------------------------------------------GENERATE FIREFLIES
  for (int i = 0; i < 5; i++) {
    Vec3D origin = new Vec3D(random(width), random(height), 0);
    firefly Fly = new firefly(origin);
    fireflIES.add(Fly);
  }
//---------------------------------------------------GENERATE BUGS
  for (int j = 0; j < 750; j++) {
    Vec3D origin = new Vec3D(random(width), random(height), 0);
    bug buggy = new bug(origin);
    bugS.add(buggy);
  }
}

//======================================================================//DRAW
void draw() {
  //background(0);
  fill(0,8);
  noStroke();
  rect(0,0,width,height);
  
  //-----------------------------------------------------Draw fireflies
  for (int i = 0; i < fireflIES.size(); i++) {
    firefly F = (firefly) fireflIES.get(i);
    F.run();
  }
  
  //-----------------------------------------------------Draw bugs
  for (int j = 0; j < bugS.size(); j++) {
    bug B = (bug) bugS.get(j);
    B.run();
  }
//  print(frameRate + "  /  ");
}

class bug {
  //===========================================================================GLOBAL VARIABLES
  Vec3D loc = new Vec3D (0, 0, 0);
  Vec3D speed = new Vec3D(random(-2, 2), random(-2, 2), 0);
  Vec3D acc = new Vec3D();
  Vec3D grav = new Vec3D(0, 0.2, 0);
  float bright = random(50, 255);
  float weight = (random(1, 8));
  float minToPredator = 100;
  float noiseScale=0.00001;
  
  //================================================================================CONSTRUCTOR
  bug(Vec3D _loc) {
    loc = _loc;
  }
  
  //==================================================================================FUNCTIONS
  //----------------------------------------------------------------------------RUN
  void run() {
    display();
    move();
    mcFly();
    flock();
  }
  
  //--------------------------------------------------------------------------FLOCK
  void flock() {
    separate(5);
    cohesion(0.002);
    align(0.2);
    separateA(50);
  }
  
  //-----------------------------------------------------------align
  void align(float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < bugS.size();i++) {
      bug other = (bug) bugS.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 40) {
        steer.addSelf(other.speed);
        steer.x=noise(steer.x);
        steer.y=noise(steer.y);
        count++;
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  //--------------------------------------separateF (from fireflies)
  void separateA(float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < fireflIES.size();i++) {
      firefly other = (firefly) fireflIES.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < minToPredator*3) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  //--------------------------------------------------------cohesion
  void cohesion(float magnitude) {
    Vec3D sum = new Vec3D();
    int count = 0;
    for (int i = 0; i < bugS.size();i++) {
      bug other = (bug) bugS.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 60) {
        sum.addSelf(other.loc);
        count++;
      }
    }
    if (count > 0) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D steer = sum.sub(loc);
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  //--------------------------------------------------------separate
  void separate(float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < bugS.size();i++) {
      bug other = (bug) bugS.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 30) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }

    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  //-------------------------------------------------------------------------MCFLY
  void mcFly() {
    if (loc.x > width) {
      loc.x = 0;
    }
    if (loc.x < 0) {
      loc.x = width;
    }
    if (loc.y > height) {
      loc.y = 0;
    }
    if (loc.y < 0) {
      loc.y = height;
    }
  }

  //---------------------------------------------------------------------------MOVE
  void move() {
    speed.addSelf(acc);
    speed.limit(3);
    loc.addSelf(speed);
    acc.clear();
  }

  //------------------------------------------------------------------------DISPLAY
  void display() {
    color colourF = color(47, 99, bright);
    //stroke(colourF);
    noStroke();
    fill(colourF);
    strokeWeight(weight);
    //point(loc.x, loc.y);
    ellipse(loc.x, loc.y , weight, weight);
  }
}

class firefly {
  //===========================================================================GLOBAL VARIABLES
  Vec3D loc = new Vec3D (0, 0, 0);
  Vec3D speed = new Vec3D(random(-2, 2), random(-2, 2), 0);
  Vec3D acc = new Vec3D();
  Vec3D grav = new Vec3D(0, 0.2, 0);
  color colorB = color(36, 200, random(50, 255));
  int weight = (int)(random(8, 12));




  //================================================================================CONSTRUCTOR
  firefly(Vec3D _loc) {
    loc = _loc;
  }

  //==================================================================================FUNCTIONS
  //----------------------------------------------------------------------------RUN
  void run() {
    display();
    move();
    mcFly();
    flock();
  }
  //--------------------------------------------------------------------------FLOCK
  void flock() {
    separate(5);
    cohesion(0.001);
    cohesionB(0.004);
    align(0.1);
    alignB(0.3);
  }
  //-----------------------------------------------------------align
  void align(float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < fireflIES.size();i++) {
      firefly other = (firefly) fireflIES.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 40) {
        steer.addSelf(other.speed);
        count++;
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  //--------------------------------------alignB (towards bugs)
  void alignB(float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < bugS.size();i++) {
      bug other = (bug) bugS.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 120) {
        steer.addSelf(other.speed);
        count++;
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }


  //--------------------------------------------------------cohesion
  void cohesion(float magnitude) {
    Vec3D sum = new Vec3D();
    int count = 0;
    for (int i = 0; i < fireflIES.size();i++) {
      firefly other = (firefly) fireflIES.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 60) {
        sum.addSelf(other.loc);
        count++;
      }
    }
    if (count > 0) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D steer = sum.sub(loc);
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }
  
    //--------------------------------------------------------cohesionB
  void cohesionB(float magnitude) {
    Vec3D sum = new Vec3D();
    int count = 0;
    for (int i = 0; i < bugS.size();i++) {
      bug other = (bug) bugS.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 60) {
        sum.addSelf(other.loc);
        count++;
      }
    }
    if (count > 0) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D steer = sum.sub(loc);
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }
  
  //--------------------------------------------------------separate
  void separate(float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < fireflIES.size();i++) {
      firefly other = (firefly) fireflIES.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 30) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }


  //-------------------------------------------------------------------------BOUNCE
  void bounce() {
    if (loc.x > width) {
      speed.x = speed.x  * -1;
    }
    if (loc.x < 0) {
      speed.x  = speed.x  * -1;
    }
    if (loc.y > height) {
      speed.y = speed.y * -1;
    }
    if (loc.y < 0) {
      speed.y = speed.y * -1;
    }
  }
  
  //-------------------------------------------------------------------------MCFLY
  void mcFly() {
    if (loc.x > width) {
      loc.x = 0;
    }
    if (loc.x < 0) {
      loc.x = width;
    }
    if (loc.y > height) {
      loc.y = 0;
    }
    if (loc.y < 0) {
      loc.y = height;
    }
  }

  //---------------------------------------------------------------------------MOVE
  void move() {

    speed.addSelf(acc);

    speed.limit(2);

    loc.addSelf(speed);

    acc.clear();
  }


  //------------------------------------------------------------------------DISPLAY
  void display() {
    stroke(colorB);
    strokeWeight(weight);
    //noStroke();
    point(loc.x, loc.y);
  }
}


