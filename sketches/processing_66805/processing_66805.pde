
//============= GLOBAL VARIABLES =============
int numOfWaves = 5;      //num of waves allowed
int strokeWidth = 12;    //width of the stroke line
int sWidth = 800;        //screen width
int sHeight = 600;      //screen height
float diagonal = sqrt(sq(sWidth) +sq(sHeight));   //diagonal of srceen size for radius of circle(ellipse)
Wave[] waves = new Wave[numOfWaves];
int count = 0;              //counter of the waves

//============= SETUP =============
void setup() {
  //size(sWidth, sHeight);
  size(800,600);
  smooth();
  frameRate(30);

  //initializing array of waves
  for (int i = 0; i < numOfWaves; i++) {
    waves[i] = new Wave(0, 0, false);
  }
}

//============= DRAW =============
void draw() {
  background(255);
  
    //draw each waves
    for (int i = 0; i < numOfWaves; i++) {
      waves[i].display();
    }
}

//============= FUNCTIONS =============
// add position of new waves
void mousePressed() {
  waves[count].is_on = true;
  waves[count].xpos = mouseX;
  waves[count].ypos = mouseY; 
  count++;
  if (count >= numOfWaves) count = 0;
}

// declare new object Wave
class Wave {
  boolean is_on;
  int xpos;
  int ypos;
  float osscilator;

  Wave(int mX, int mY, boolean isOn) {
    xpos = mX;
    ypos = mY;
    is_on = isOn;
    osscilator = 0;
  }

  void display() {
    if (is_on) {
      noFill();
      osscilator +=0.001;
      strokeWeight(strokeWidth);
      for (int j = 0; j < 2*diagonal; j += strokeWidth*2) {      //waves by drawing series of circles(ellipses)
        stroke(0, abs((sin(j*osscilator)*255)/numOfWaves));
        ellipse(xpos, ypos, j, j);
      }
    }
  }
}


