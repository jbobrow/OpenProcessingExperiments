
//3D Tree Fractal   Doctor Mystery   02/13/2014

//DECLARE VARIABLES

Stick firstStick;
ArrayList<Stick> treeWorking, treeMaster;
float scalefactormax = 0;
float strokeThick = 0;
int rotatetimery = 0;
int rotatetimerx = 0;



//PREFERENCES

int itermax = 15;              //The number of iterations
float rotatemax = 0.625;            //How much the branches can spread out (radians)
float growprob = 0.6;          //number 0 to 1 larger = more grows
float splitprob = 0.7;         //number 0 to 1 larger = more splits
int splitmax = 2;              // 1 less than the max possible # of splits
float scalefactormin = 0.6;   //minimum scale factor  
float scalefactormaxinit = 1.2;   //max scale factor
float scalefactorscale = 0.995;  // how much the scale factor scales (I know)
float strokeweightinit = 5;    // inital strokeweight (pixels)
float strokescale = 0.3;       // how much the stroke weight scales every iteration (pixels)

void setup() {

  //SETUP

  size(750, 700, P3D);
  background(0);
  stroke(255);
  strokeThick = strokeweightinit;
  strokeWeight(strokeThick);
  noFill();

  strokeCap(PROJECT);

  //CREATE INITIAL STICK

  scalefactormax = scalefactormaxinit;
  firstStick = new Stick(0, 0, 0, new PVector(1, random(-120, -40), 0), 0);
  treeWorking = new ArrayList<Stick>();
  treeMaster = new ArrayList<Stick>();
  treeWorking.add(firstStick);
  treeMaster.add(firstStick);
  //  firstStick.display();

  buildTree();
  translate(width/2, height, -160);
  drawTree();
}


void draw() {
  background(0);
  translate(width/2, height, -160);

  //PRESS ANY KEY TO RESET (CLEAR TREE, NEW START, CLEAR SCREEN)

  if (keyPressed == true) {

    if (key == 'r') {
      background(0);
      scalefactormax = scalefactormaxinit;
      treeMaster = new ArrayList<Stick>();
      treeWorking = new ArrayList<Stick>();
      firstStick = new Stick(0, 0, 0, new PVector(1, random(-120, -40), 0), 0);
      treeWorking.add(firstStick);
      treeMaster.add(firstStick);
      buildTree();
      drawTree();
    }
    if (key == CODED) {
      if (keyCode == LEFT) {
        rotatetimery++;
      }
      if (keyCode == RIGHT) {
        rotatetimery--;
      }
//      if (keyCode == UP) {
//        rotatetimerx++;
//      }
//      if (keyCode == DOWN) {
//        rotatetimerx--;
//      }      
    }
  }
  rotateY(radians(rotatetimery));
//  rotateX(radians(rotatetimerx));
    box(30);
  drawTree();
}

//STICK UPDATE FUNCTION - creates the next stick from an input stick 
//with a new heading and size connected to the old one

Stick update(Stick INstick, int iterIndex) {

  Stick out;
  float rotatefactor = random(-rotatemax, rotatemax);
  //rotatefactor = degrees(rotatefactor);
  float scalefactor = random(scalefactormin, scalefactormax);

  scalefactormax = scalefactormax*scalefactorscale;

  PVector dirnew = new PVector(INstick.direction.x, INstick.direction.y, INstick.direction.z);
  dirnew = new PVector(dirnew.x*cos(rotatefactor)-dirnew.y*sin(rotatefactor), dirnew.x*sin(rotatefactor)+dirnew.y*cos(rotatefactor), dirnew.z);
  rotatefactor = random(-rotatemax, rotatemax);
  dirnew = new PVector(dirnew.x*cos(rotatefactor)-dirnew.y*sin(rotatefactor),dirnew.y, dirnew.x*sin(rotatefactor)+dirnew.z*cos(rotatefactor));
  dirnew.mult(scalefactor);


  out = new Stick (INstick.endx, INstick.endy, INstick.endz, dirnew, iterIndex);
  return out;
}


//updates the treeMaster arraylist
void buildTree() {
  for (int f = 0; f<itermax; f++) {

    int end = treeWorking.size();

    for (int i=0; i<end;i++) {

      float grow = random(1);
      if (grow<growprob) {

        float split = random(1);
        if (split<splitprob) {

          for (int h=0;h<round(random(1, splitmax)); h++) {
            treeWorking.add(update(treeWorking.get(i), f));
            treeMaster.add(treeWorking.get(treeWorking.size()-1));
          }
        }

        treeWorking.add(update(treeWorking.get(i), f));
        treeMaster.add(treeWorking.get(treeWorking.size()-1));    
        treeWorking.remove(i);
      }
    }
  }
}

//draws the master tree
void drawTree () {

  for (int k=0; k<treeMaster.size(); k++) {
    treeMaster.get(k).display();
  }
}







//STICK CLASS INPUT POINT AND PVECTOR TO RECIEVE START AND ENDPOINTS OF A LINE

class Stick {
  PVector direction;
  float startx;
  float starty;
  float startz;
  float endx;
  float endy;
  float endz;
  float stickStroke;
  int iteration;



  Stick(float INstartx, float INstarty, float INstartz, PVector INdirection, int iterationIndex) {
    direction = INdirection;
    startx = INstartx;
    starty = INstarty;
    startz = INstartz;
    endx = INstartx+INdirection.x;
    endy = INstarty+INdirection.y;
    endz = INstartz+INdirection.z;
    stickStroke = strokeweightinit -(iterationIndex*strokescale);
    iteration = iterationIndex;
  }

  void display() {
    strokeWeight(stickStroke);
    line(startx, starty, startz, endx, endy, endz);
  }

  void grow() {
    strokeWeight(stickStroke);

    for (int whatlettersdoIhaveleft = 0; whatlettersdoIhaveleft < 100; whatlettersdoIhaveleft++) {
      line(startx, starty, startz, startx+(direction.x*(whatlettersdoIhaveleft/40)), starty+(direction.y*(whatlettersdoIhaveleft/40)), startz+(direction.z*(whatlettersdoIhaveleft/40)));
    }
  }
}



