
int n = 30;
int radius = 40;
float[] velocity = new float[2]; //stands for speed in units per framecount!
float[][] positions = new float[n][2]; 
int[] goLeftRight = new int[n];  // +1 is goRight and -1 is goLeft
int[] goUpDown = new int[n]; // +1 is goUp and -1 is goDown

void setup() 
{
  size(600, 600);
  noStroke();
  frameRate(50);

  //initialise positions
  for (int i=0; i<n; i++) {
    positions[i][0] = random(radius, width-radius);
    positions[i][1] = random(radius, height-radius);
  }

  //initialise directions
  for (int i=0; i<n; i++) {
    if (random(-1, 1) <= 0) goLeftRight[i] = -1;
    else goLeftRight[i] = 1;
    if (random(-1, 1) <= 0) goUpDown[i] = -1;
    else goUpDown[i] = 1;
  }

  //initialise speeds
  velocity[0] = 2;
  velocity[1] = 2.3;
}

void draw() {
  background(0);

  for (int i=0; i<n; i++) {
    fill(random(255), random(255), random(255));

    positions[i][0] = positions[i][0] + goLeftRight[i]*velocity[0];
    positions[i][1] = positions[i][1] + goUpDown[i]*velocity[1];

    if ((positions[i][0] + radius/2 > width) || (positions[i][0] <radius/2)) { //chnage direction if we are hitting side!
      goLeftRight[i] = -1 * goLeftRight[i];
    }
    if ((positions[i][1] + radius/2 > height) || (positions[i][1] <radius/2)) { //chnage direction if we are hitting top or bottom!
      goUpDown[i] = -1 * goUpDown[i];
    }

    ellipse(positions[i][0], positions[i][1], radius, radius);
  }
}



