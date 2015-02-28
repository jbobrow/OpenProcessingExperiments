
//Tree Fractal   Doctor Mystery   01/02/2014

//DECLARE VARIABLES

Stick firstStick;
ArrayList<Stick> tree;
int iteration = 0;
float scalefactormax = 0;
float strokeThick = 0;


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

  size(650, 700);
  background(255, 255, 255);
  stroke(0, 0, 0);
  strokeThick = strokeweightinit;
  strokeWeight(strokeThick);

  strokeCap(PROJECT);

  //CREATE INITIAL STICK

  scalefactormax = scalefactormaxinit;
  firstStick = new Stick(width/2, height, new PVector(1, random(-120, -40)));
  tree = new ArrayList<Stick>();
  tree.add(firstStick);
  firstStick.display();
}


void draw() {

  //PRESS ANY KEY TO RESET (CLEAR TREE, NEW START, CLEAR SCREEN)

  if (keyPressed == true) {
    background(255, 255, 255);
    iteration = 0;
    scalefactormax = scalefactormaxinit;
    tree = new ArrayList<Stick>();
    firstStick = new Stick(width/2, height, new PVector(1, random(-120, -40)));
    tree.add(firstStick);
    firstStick.display();
    strokeThick = strokeweightinit;
    strokeWeight(strokeThick);
  }

  //main loop that builds the tree

  if (iteration<=itermax) {

    int end = tree.size();

    for (int i=0; i<end;i++) {

      float grow = random(1);
      if (grow<growprob) {

        float split = random(1);
        if (split<splitprob) {

          for (int h=0;h<round(random(1, splitmax)); h++) {

            tree.add(update(tree.get(i)));
            tree.get(tree.size()-1).display();
          }
        }

        tree.add(update(tree.get(i)));
        tree.get(tree.size()-1).display();    
        tree.remove(i);
      }
    }

    iteration++;

    strokeThick -= strokescale;
    strokeWeight(strokeThick);
  }
}

//STICK UPDATE FUNCTION - creates the next stick from an input stick 
//with a new heading and size connected to the old one

Stick update(Stick INstick) {

  Stick out;
  float rotatefactor = random(-rotatemax, rotatemax);
  //rotatefactor = degrees(rotatefactor);
  float scalefactor = random(scalefactormin, scalefactormax);

  scalefactormax = scalefactormax*scalefactorscale;

  PVector dirnew = new PVector(INstick.direction.x, INstick.direction.y);
  dirnew = new PVector(dirnew.x*cos(rotatefactor)-dirnew.y*sin(rotatefactor), dirnew.x*sin(rotatefactor)+dirnew.y*cos(rotatefactor));
  dirnew.mult(scalefactor);


  out = new Stick (INstick.endx, INstick.endy, dirnew);
  return out;
}

//STICK CLASS INPUT POINT AND PVECTOR TO RECIEVE START AND ENDPOINTS OF A LINE

class Stick {
  PVector direction;
  float startx;
  float starty;
  float endx;
  float endy;


  Stick(float INstartx, float INstarty, PVector INdirection) {
    direction = INdirection;
    startx = INstartx;
    starty = INstarty;
    endx = INstartx+INdirection.x;
    endy = INstarty+INdirection.y;
  }


  void display() {
    line(startx, starty, endx, endy);
  }
}



