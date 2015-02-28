
// Color Snake by Edward Loveall
// Just make some square points run around the screen in different colors at random
// Click to reset
// http://www.edwardloveall.com/

int[] position = new int[2];
int b = 0; //Point Bias (for teting)
int framerate = 30; //Framerate... duh

// color arrary
int c1 = 255;
int c2 = 127;
int divs = 4;
color[] c = {
  color(c1, c2, 0), color(c1, 0, c2), color(c2, c1, 0), color(c2, 0, c1), color(0, c2, c1), };

void setup() {
  size(401, 401); //For Prettyness, must be a (multipul of 4)+1
  background(0);
  int o = 1; //overall start bias (for testing)
  position[0] = (width/2)+o;
  position[1] = (height/2)+o;
  framerate = 30;
}

void draw() {
  int colors = int(random(4));
  noStroke();
  fill(c[colors]);
  frameRate(framerate);
  rect(position[0]+b, position[1]+b, 3, 3);

  // X Position in range test and shift
  if (position[0] > 4 && position[0] <= width-4) {
    position [0] += round(random(-1, 1))*4;
  } 
  else {
    if (position[0] > 4) {
      position[0] -= 4;
    } 
    else {
      position[0] += 4;
    }
  }
  
  // Y Position in range test and shift
  if (position[1] > 4 && position[1] <= height-4) {
    position [1] += round(random(-1, 1))*4;
  } 
  else {
    if (position[1] > 4) {
      position[1] -= 4;
    } 
    else {
      position[1] += 4;
    }
  }
  
  //White Cursor point to keep track
  fill(255);
  rect(position[0]+b, position[1]+b, 3, 3);
}

// Invokes setup() when mouse is clicked, resetting everything
void mousePressed () {
  setup();
}

//changes framerate with UP and DOWN keys
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      framerate += 4;
    }
    if (keyCode == DOWN) {
      framerate -= 4;
    }
  }
}

