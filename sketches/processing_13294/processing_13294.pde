
/**
 * Orbits
 * by Jaewoong Hwang
 *
 * try clicking any circle
 * [G] show/hide gird
 * [D] draw/erase dot tracks
 *
 * for the class 'visualization'
 */

// variables for CIRCLES 
int n = 0;        // count number of circles
float[]x = {};      // stores circles' x position
float[]y = {};      // stores circles' y position
float[]r = {};      // stores circles' size
int[]parent = {};   // stores circles' parents' number
float[]r_anchor = {};      // stores circles' movement radius
float[]x_anchor = {};  // stores circles' x pos of movement anchor
float[]y_anchor = {};  // stores circles' y pos of movement anchor
float[]spd = {};    // stores circles' movement speed
float[]c = {};      // stores circles' grayscale color
float[]rad = {};    // stores circles' now radian value

// variables for an ORBIT newly being made
int n_parent;    // indicates which number of circle is parent
boolean nowMaking = false;  // becomes true until the mouse is pressed
boolean missed = false;     // becomes true when clicking missed
boolean alreadyMade = false;    // prevent making 2 or more circles in a time

// variables for DOTS
boolean drawDots = false;   // decides whether draw dots or not
int max_dot = 5000;          // set number of maximum dots
int interval_dot = 1;      // frame interval for making dots
int i_dot = 1;              // count interval
int n_dot = 0;              // indicate where to store new dot
float[]x_dot = new float[max_dot];
float[]y_dot = new float[max_dot];

int lastChecked = -1;      // for checking
int nChecking = -1;        // mouseon circle number

boolean drawGrid = true;

PImage title;


void setup() {
  size(800, 400);
  smooth();
  
  // set the mother circle who is placed center and never moves
  x = append(x, width / 2);
  y = append(y, height / 2);
  r = append(r, 40);
  parent = append(parent, 0);
  r_anchor = append(r_anchor, 0);
  x_anchor = append(x_anchor, x[0]);
  y_anchor = append(y_anchor, y[0]);
  spd = append(spd, 0);
  c = append(c, 50);
  rad = append(rad, 0);
  n = 1;
  
  title = loadImage("title.png");
  imageMode(CENTER);
}

void draw() {
  background(255);
  
  // draw grid
  if(drawGrid == true) {
    stroke(220);
    strokeWeight(1);
    for(int m = 50; m < width; m = m + 50) {
      line(m, 0, m, height);
      line(0, m, width, m);
    }
  }
  
  // draw dots
  if(drawDots == true) {
    strokeWeight(1);
    for(int o = 0; o < max_dot; o++) {
      if(o <= n_dot) {
        stroke((n_dot - o) * 255 / max_dot);
      } else if(o > n_dot) {
        stroke((max_dot - (o - n_dot)) * 255 / max_dot);
      }
      point(x_dot[o], y_dot[o]);
    }
  }
    
  // make movement and draw circles
  for(int j = 0; j < n; j++) {
    rad[j] += spd[j];
    if(rad[j] > TWO_PI) rad[j] = rad[j] - TWO_PI;  // to prevent overflow
    
    x_anchor[j] = x[parent[j]];
    y_anchor[j] = y[parent[j]];
    
    x[j] = x_anchor[j] + sin(rad[j]) * r_anchor[j];
    y[j] = y_anchor[j] + cos(rad[j]) * r_anchor[j];
    
    noStroke();    
    if((j == nChecking) || (parent[j] == nChecking)) {
      noFill();
      stroke(255, 180, 0);
      
      if(!(parent[j] == nChecking)) {
        strokeWeight(0.5);
        ellipse(x_anchor[j], y_anchor[j], r_anchor[j] * 2, r_anchor[j] * 2);
      }
      
      strokeWeight(3);
    }

    fill(c[j]);
    if((nowMaking == true) && (j == n_parent)) {
      fill(c[j] + (255 - c[j]) / 3);
    }
    
    ellipse(x[j], y[j], r[j] * 2, r[j] * 2);
    
    if(drawDots == true) makeDot(x[j], y[j]);
  }
  
  // draw the guideline for newly being made orbit
  if(nowMaking == true) {
    stroke(c[n - 1]);
    strokeWeight(2);
    noFill();
    line(x[n_parent], y[n_parent], x[n - 1], y[n - 1]);
    ellipse(x[n_parent], y[n_parent], r_anchor[n - 1] * 2, r_anchor[n - 1] * 2);
    r_anchor[n - 1] = r_anchor[n - 1] + (400 - r_anchor[n - 1]) * 0.01;
  }
  
  
  // Lee Eungil Tribute Title
  if(millis() < 2000) {
    tint(255, millis() * 255 / 2000);
    image(title, width / 2, height - 50);    
  } else if(millis() < 5000) {
    image(title, width / 2, height - 50);    
  } else if(millis() < 7000) {
    tint(255, (7000 - millis()) * 255 / 2000);
    image(title, width / 2, height - 50);    
  }
}

void mousePressed() {
  // check on which circle the mouse pressed
  if(nowMaking == false) {
  
    int pn = n;     // to prevent err
    for(int i = pn - 1; i >= 0; i--) {
      if(dist(x[i], y[i], mouseX, mouseY) < r[i]) {
        nowMaking = true;

        // make new circle
        if(alreadyMade == false) {
          n_parent = i;
          x = append(x, x[n_parent]);
          y = append(y, y[n_parent]);
          r = append(r, r[n_parent]  * 3 / 5);
          parent = append(parent, n_parent);
          r_anchor = append(r_anchor, 0);
          x_anchor = append(x_anchor, x[n_parent]);
          y_anchor = append(y_anchor, y[n_parent]);
          spd = append(spd, (random(10) + 5) / 500);
          c = append(c, c[n_parent] + (255 - c[n_parent]) / 3);
          rad = append(rad, random(360) * TWO_PI / 360);
          n++;
        }

        alreadyMade = true;
      }
    }
  }
    
}

void mouseReleased() {
  nowMaking = false;
  missed = false;
  alreadyMade = false;
}

// this's for checking
void mouseMoved() {
  nChecking = -1;

  for(int l = 0; l < n; l++) {
    if((dist(x[l], y[l], mouseX, mouseY) < r[l])) {
      nChecking = l;

      if(l != lastChecked) {
        print("N:");
        print(l);
        print("\t");
        print("P:");
        print(parent[l]);
        print("\t");
        print("POS:");
        print(x[l] + "," + y[l]);
        print("\t");
        print("ANC:");
        println(x_anchor[l] + "," + y_anchor[l]);
      
        lastChecked = l;
      }
    }
  }
}

void keyPressed() {
  if(key == 'g' || key == 'G') drawGrid = !drawGrid;
  if(key == 'd' || key == 'D') {
    drawDots = !drawDots;
    if(drawDots == false) {
      for(int p = 0; p < max_dot; p++) {
        x_dot[p] = width / 2;
        y_dot[p] = height / 2;
      }
    }
  }
}

void makeDot(float dx, float dy) {
  i_dot++;
  
  if(i_dot >= interval_dot) {
    n_dot++;
    if(n_dot >= max_dot) n_dot = 0;

    x_dot[n_dot] = dx;
    y_dot[n_dot] = dy;
    
    i_dot = 1;
  }
}
