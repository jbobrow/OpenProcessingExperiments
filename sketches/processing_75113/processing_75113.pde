
// Based of of code found at http://answers.oreilly.com/topic/1261-create-fractal-plants-with-processing/ // 

int BRANCHES = 6; //Number of branches per line
int DEPTH = 7; // Recursive depth
float MIN_ANGLE = 5.0; //Minimum angle for new branch
float MAX_ANGLE = 80.0; //Maximum angle for a new branch
float MIN_LENGTH = 0.1; //Minimum length of new branch, as a pct of current length
float MAX_LENGTH = 0.8; //Minimum length of new branch, as a pct of current length
int I_LENGTH = 300; //Length of initial iteration
float[] angles = new float[15];
float[] lengths = new float[15];

// Implements a Vector
class Vector {
  int x, y;
  float r, theta;

  Vector (int _x, int _y, float _r, float _theta) {
    x = _x; //Origin x
    y = _y; //Origin y
    r = _r; //Length
    theta = _theta; // Angle
  }

  int getEndPointX() { 
    return int(x + r*cos(theta/57.3));
  }

  int getEndPointY() {
    return int(y + r*sin(theta/57.3));
  }
}

//Recursive function that creates a fractal "plant" 
void fractal(Vector v, int N) {
  if (N > 0) {
    line(v.x, v.y, v.getEndPointX(), v.getEndPointY()); //Draw the current vector
    for (int i = 0; i < BRANCHES; i++) { 
      //Create a random vector based on the current one
      Vector r = new Vector (v.x, v.y, v.r, v.theta); //New random vector that will branch off the current line
      r.r = v.r*lengths[i]; //Select a length
      r.x = r.getEndPointX(); //shift the x-origin
      r.y = r.getEndPointY(); //shift the y-origin
      r.theta += angles[i]; // shift the angle a bit
      fractal(r, N-1); //Recurse
    }
  }
}


//Draw the first image
void setup() {
  size(800, 800);
  background(255);
  fill(255, 250);
  stroke(0, 100);
  strokeWeight(1);
  smooth();
  keyPressed();
}

// keep draw() here to continue looping while waiting for keys
void draw() {
}

//Draw a new image each time a key is pressed
void keyPressed() { 
  rect(0, 0, width-1, height);
  Vector seed = new Vector(width/2, 0, I_LENGTH, 90);
  int dir = 1; //control alternating direction of the branch
  for (int i = 0; i < BRANCHES; i++) {
    lengths[i] = random(MIN_LENGTH, MAX_LENGTH); //Select a random length
    angles[i] = dir*random(MIN_ANGLE,MAX_ANGLE); // shift the angle a bit
    dir = dir * -1; //Alternate branch direction
  }
  fractal (seed, DEPTH);
}


