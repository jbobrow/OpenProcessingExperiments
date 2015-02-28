
color[] palette = {
  #C3E76F, #007856, #FFB300, #7ab800, #144d29, #afaaa3, #003359, #86499D, #23A491
};
color[] fills = {};
int boxes = 50; // number of boxes to draw
int wide = 700; // canvas width
int high = 700; // canvas height
int count = 0; // counter variable for frame rate manipulation
float[][] r = new float [boxes][3]; // initializing rectangle 2d array
boolean central = true; // switch for central positions (vs spread position)
float tight = 20; // determines how tight the central position is (1 = same as spread, 100 is quite tight)

void setup() {
  size(wide, high);
  smooth();
  noFill();
  noStroke();
  frameRate(60);
  for (int i=0; i<boxes; i++) {
    r[i][0] = random(wide); //assign random x coordinate
    r[i][1] = random(high); //assign random y coordinate
    r[i][2] = random(30, 110); //assign random size
    fills = append(fills, palette[int(random(1, palette.length))]); //assign random color
  }
}


void draw() {
  count++;
  background(palette[0]);
  rectMode(CENTER);
  if (central == true) {
    drawCentral();
  } 
  else {
    drawSpread();
  }
}

void drawCentral() {
  for (int i=0; i<boxes; i++) {
    if (abs(((wide/2 + r[i][0]/tight) - mouseX)) < (r[i][2]/2) &&
      abs(((high/2 + r[i][1]/tight) - mouseY)) < (r[i][2]/2))
    {
      fill(fills[i], 90);
      rect(wide/2 + r[i][0]/tight + random(-3, 3), high/2 + r[i][1]/tight + random(-3, 3), r[i][2], r[i][2], 7);
    } 
    else {
      fill(fills[i], 90);
      rect(wide/2 + r[i][0]/tight, high/2 + r[i][1]/tight, r[i][2], r[i][2], 7);
    }
  }
}

void drawSpread() {
  for (int i=0; i<boxes; i++) {
    if (abs((r[i][0] - mouseX)) < (r[i][2]/2) &&
      abs((r[i][1] - mouseY)) < (r[i][2]/2))
    {
      fill(fills[i], 90);
      rect(r[i][0] + random(-3, 3), r[i][1] + random(-3, 3), r[i][2], r[i][2], 7);
    } 
    else {
      fill(fills[i], 90);
      rect(r[i][0], r[i][1], r[i][2], r[i][2], 7);
    }
  }
}

void mousePressed() {
  for (int i=0; i<boxes; i++) {
    if (central == false && abs(((r[i][0]) - mouseX)) < (r[i][2]/2) &&
        abs(((r[i][1]) - mouseY)) < (r[i][2]/2)) {
      central = true;
    } 
    else {
      if (abs(((wide/2 + r[i][0]/tight) - mouseX)) < (r[i][2]/2) &&
      abs(((high/2 + r[i][1]/tight) - mouseY)) < (r[i][2]/2)) {
        central = false;
      }
    }
  }
}

