
// BEAST  /////////////////////
//mjmurdock 2012 //////////////
///////////////////////////////

//global variables

PShape beast;
PShape beastTop;
PShape beastBottom;
PShape nom;


// tentacle variables
int numJoints = 25;
float[] x = new float[numJoints];
float[] y = new float[numJoints];
float[] ang = new float[numJoints];
float[] randAng = new float[numJoints];

float segmentLength = 15.0;
float aimX, aimY;

// brownian variables
int num = 30;
int range = 10;
float[] ax = new float[num];
float[] ay = new float[num];




void setup() {
  size(800, 800);
  smooth();

  // fill arrays
  for (int j =0; j<num; j++) {
    ax[j] = width/2;
    ay[j] = height/2;
  }

  // fill tenticle arrays
  for (int k=0; k<numJoints; k++) {
    randAng[k] = random(0, 360);
  }

  for (int i =0; i<numJoints; i++) {
    //    x[i] = random(width);
  }

  x[x.length-1] = width/2;
  y[x.length-1] = height/2;

  // load 'da graphics
  beast = loadShape("beast.svg");

  beastBottom = loadShape("beast_bottom.svg");
  beastTop = loadShape("beast_top.svg");
  nom = loadShape("nom.svg");
}

void draw() {
  frameRate(5);
  background(100);
  stroke(30, 100);

  shape(beast, 0, 0);



  if (mousePressed == true && (mouseY > 300) && (mouseY < 450) && mouseX > 65 && mouseX < 730) {
    background(100);

    // shift all elements
    for (int j = 1; j<num; j++) {
      ax[j-1] = ax[j];
      ay[j-1] = ay[j];


      // new value at end of array
      ax[num-1] += random(-range, range);
      ay[num-1] += random(-range, range);

      // make sure points are on screen
      ax[num-1] = constrain(ax[num-1], 0, width);
      ay[num-1] = constrain(ay[num-1], 0, height);

      pushMatrix();
      //      translate(width/2, height/2);
      //      rotate(sin(frameCount));

      reachSegment(0, random(width), ay[j]);
      for (int i=1; i<numJoints; i++) {

        reachSegment(i, aimX, aimY);
      }
      for (int i=x.length-1;  i>=1; i--) {
        positionSegment(i, i-1);
      }
      for (int i=0; i<x.length; i++) {
        segment(x[i], y[i], ang[i], (i+1)*2);
      }
      popMatrix();
      shape(beastBottom, 0, -sin(frameCount*2)*30);
      shape(beastTop, 0, sin(frameCount*2)*30);
      
      
      
    }
    shape(nom, random(-200, 200), random(-200, 200));
    
  }
  
}


// SPECIAL FUNCTIONS /////////////////////


void segment (float x, float y, float a, float lineWeight) {
  strokeWeight(lineWeight);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segmentLength, 0);
  popMatrix();
}

void positionSegment(int a, int b) {
  x[b] = x[a] + cos(ang[a]) * segmentLength;
  y[b] = y[a] + sin(ang[a]) * segmentLength;
}

void reachSegment(int i, float Xinput, float Yinput) {
  float dx = Xinput - x[i];
  float dy = Yinput - y[i];
  ang[i] = atan2(dy, dx);
  aimX = Xinput - cos(ang[i]+randAng[i]) * segmentLength;
  aimY = Yinput - cos(ang[i]+randAng[i]) * segmentLength;
}


