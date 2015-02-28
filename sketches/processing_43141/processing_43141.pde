
PGraphics buffer;
PImage img;

int len = 2;
int num = 5000;
float range = 0.2;
float E = (float) Math.E;
boolean lines = true;
float att = 0.001;
float rep = 10;
float rot = 10;

float[][] ax = new float[len][num];
float[][] ay = new float[len][num];
float[] vx = new float[num];
float[] vy = new float[num];
int[] h = new int[num];
int[] s = new int[num];
int[] b = new int[num];

void setup()
{
  size(500, 500, P2D);
  background(51);
  frameRate(30);
  colorMode(HSB);
  //smooth();

  buffer = createGraphics(width, height, P2D);

  for (int n = 0; n<num; n++) {
    for (int i = 0; i < len; i++) {
      ax[i][n] = width/2;
      ay[i][n] = height/2;
      vx[n] = random(-2, 2);
      vy[n] = random(-2, 2);
      h[n] = 360;
      s[n] = 20;
      b[n] = 98;
    }
  }
}

void draw()
{

  noStroke();
  fill(20, 20, 20, 0);
  rect(0, 0, width, height);

  for (int n = 1; n < num; n++) {
    // Shift all elements 1 place to the left
    for (int i=1; i<len; i++) {
      ax[i-1][n] = ax[i][n];
      ay[i-1][n] = ay[i][n];
    }

    // Put a new value at the end of the array
    ax[len-1][n] += random(-range, range)+vx[n];
    ay[len-1][n] += random(-range, range)+vy[n];
    // Calculate new velocity
    vx[n] = ax[len-1][n]-ax[len-2][n];
    vy[n] = ay[len-1][n]-ay[len-2][n];
    // Add spring acceleration towards mouse
    vx[n] -= (ax[len-1][n]-mouseX) * att;
    vy[n] -= (ay[len-1][n]-mouseY) * att;
    // Particles are scared of mouse!
    float dx = ax[len-1][n]-mouseX;
    float dy = ay[len-1][n]-mouseY;
    float d = sqrt(pow(dx, 2) + pow(dy, 2));
    vx[n] += rep * ((dx)/(pow(d, 2)));
    vy[n] += rep * ((dy)/(pow(d, 2)));
    // Particles are rotated at rate inversely proportional to distance
    if ((mouseButton == LEFT) && (mousePressed == true)) {
      vx[n] += (-dy / (d*d)) * rot;
      vy[n] += (dx / (d*d)) * rot;
    }
    // Constrain all points to the screen
    ax[len-1][n] = constrain(ax[len-1][n], 0, width);
    ay[len-1][n] = constrain(ay[len-1][n], 0, height);
    // Decelerate proportionally to speed
    vx[n] *= .98;
    vy[n] *= .98;
    
    float v = sqrt(pow(vx[n], 2) + pow(vy[n], 2));
    
    h[n] = 160 - 2 * int(v);
    s[n] = 200 - 10 * int(v);
    b[n] = 100 + 35 * int(v);


    // If lines is true, draw a line connecting the points
    if (lines) {
      for (int i=1; i<len; i++) {   
        int rval = 220;
        int gval = 230;
        int bval = 255;
        stroke(h[n], s[n], b[n]);
        strokeWeight(1.5);
        line(ax[i-1][n], ay[i-1][n], ax[i][n], ay[i][n]);
      }
    }
    else {
      for (int i=1; i<len; i++) {   
        float rval = 60;
        float gval = 80; 
        float bval = 255;
        stroke(h[n], s[n], b[n]);
        point (ax[i][n], ay[i][n]);
      }
    }
  }
}


//void mousePressed() {
//  if (mouseButton == LEFT) {
//    att *= 2;
//  }
//  else if (mouseButton == RIGHT) {
//    att *= 0.5;
//  }
//}
void keyPressed() {
  lines = !lines;
}


