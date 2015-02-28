
//global variables
int counter, counter2;
float xg = 58, yg = 46;
int trunkSegments = int(random(4, 7));
int nodeLimit = 20000;
PVector[]pts = new PVector[nodeLimit];
int branchLimit = 620;
float trunkLength = int(random(130, 180));
float[]lean2 = new float[trunkSegments+1];
float radius = 8; //radius of trunk/branches
color c1 = color(0, 0, 255);
color c2 = color(0, 255, 0);

// initialize sketch
void setup() {
  size(900, 600);
  createGradient(c1, c2);
  //background(140, 180, 180);
  stroke(70, 40, 0);

  // create tree turnk
  trunk();
}

void trunk() {
  //draw trunk
  for (int i=0; i<trunkSegments; i++) {
    float lean = myRand(5); //affects straightness of trunk & branches
    strokeWeight(radius+5); //affects thickness of trunk
    line(width/2+lean2[i], height-(trunkLength/trunkSegments)*i, 
    width/2+lean, height-(trunkLength/trunkSegments)*(i+1));
    lean2[i+1] = lean;
  }
  // set inital branch point from top of trunk
  pts[0] = new PVector(width/2+lean2[trunkSegments], 
  height-trunkLength);

  //create branches
  branch(pts);
}


void branch(PVector[]pts) {
  int stemCount=2;
  
  if (counter2<branchLimit) {
    //set branch thickness
    strokeWeight(radius);
    
  if (counter2<10) {
     yg -= random(0.3);
     xg -= random(0.5);

      if (radius>2) {
        radius *= 0.9; //when larger than 1 (example: 1.1), screen goes green
      }                //when larer than 1.5 (ex: 1.6), screen goes brown!
    }
    // draw leafy branches
    else if (counter2>=200) {
      // at top of tree branches get thinner and more numerous
      stemCount = (int)(random(2, 50));
      // leaf color
      stroke(random(70), random(80, 180), random(60), 180);

      yg -= myRand(.65);
      xg += myRand(1.5);

      radius *= .1;
    }
    for (int j=0; j<stemCount; j++) {
      // randomize branch postions
      float xx= myRand(70);
      float yy= myRand(50);

      //commented out line below generates straight branches
      //angularTree(pts[counter2].x, pts[counter2].y, pts[counter2].x+xg+xx, pts[counter2].y-yg+yy);

      // generates organic looking branches
      curvyTree(pts[counter2].x, pts[counter2].y, pts[counter2].x+xg+xx, pts[counter2].y-yg+yy);

      //fill up pts array to be passed back recursivley to branch function
      pts[counter+1] = new PVector(pts[counter2].x+xg+xx, pts[counter2].y-yg+yy);

      // alternate branches left and right
      xg *= -1;

      // keep track of nodes
      counter++;
    }

    // keeps track of branches
    counter2++;

    //recursive call
    branch(pts);
  }
}

// generates angularc looking branches
void  angularTree (float x1, float y1, float x2, float y2) {
  line(x1, y1, x2, y2);
}


// generates organic looking branches
void  curvyTree (float x1, float y1, float x2, float y2) {

  int sections = 35; //the larger the number, the blurrier. Very small
                    //number makes straighter "leaves". Note: large number
  float xd = x2-x1; //almost makes it look like a painting!
  float yd = y2-y1;

  float twist;
  float[]twist2 = new float[sections+1];

  for (int i =0; i<sections; i++) {
    twist = myRand(2); //twist of branches
    line(x1+xd/sections*i+twist2[i], y1+yd/sections*i, x1+xd/sections*(i+1)+twist, y1+yd/sections*(i+1));
    twist2[i+1] = twist;
  }
}

//generate a random val between (-2*n, 2*n)
float myRand(float val) {
  return random(2.2*val)+random(-2.2*val); //keeps tree at center and expands
}    //*2 to make leaves cover         //decently symmetrically
     //more of the tree
     
void createGradient(color c1, color c2) {
  int pixelCount = width*height;

  float r1 = red(c1);
  float g1 = green(c1);
  float b1 = blue(c1);

  float r2 = red(c2);
  float g2 = green(c2);
  float b2 = blue(c2);

  float deltaR = (r2-r1)/pixelCount;
  float deltaG = (g2-g1)/pixelCount;
  float deltaB = (b2-b1)/pixelCount;

  loadPixels();
  for (int i=0; i<pixelCount; i++) {
    color pix = color(r1+(0.7*deltaR*i), g1+(0.7*deltaG*i), b1+(0.7*deltaB*i));
    pixels[i] = pix;
  }
  updatePixels();
}


