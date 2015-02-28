
// ------------------------------------
// ------ "NOTHING LIKE THE SUN" ------
// ---- by Peter Hofmann, Oct 2013 ----
// ------------------------------------
// Visualizing Shakespeare's Sonnet 130
// ------------------------------------


float resolution = 260; // how many points in the circle
float rad = 150;
float x = 1;
float y = 1;

float t = 0; // time passed
float tChange = .02; // how quick time flies

float nVal; // noise value
float nInt = 1; // noise intensity
float nAmp = 1; // noise amplitude
int noiseSym = 1; // noise Symmetry (1 = false, 0 = true)

boolean filled = false;


void setup() {
  size(400, 400);
  noiseDetail(8);
  colorMode(HSB, 100);
}

void draw() {
  background(100);
  translate(width/2, height/2);

  nAmp = map(mouseX, width, 0, 0.5, 1.0); // map mouseY to noise amplitude

  noStroke();
  color herC = color(map(mouseX, width, 0, 8, 15), map(mouseX, width, 0, 20, 100), map(mouseX, width, 0, 80, 100));
  fill(herC);

  beginShape();
  for (float a=0; a<=TWO_PI; a+=TWO_PI/resolution) {

    nVal = map(noise( cos(a)*nInt+noiseSym, sin(a)*nInt+noiseSym, t ), 0.0, 1.0, nAmp, 1.0); // map noise value to match the amplitude

    x = cos(a)*rad *nVal;
    y = sin(a)*rad *nVal;
    vertex(x, y);
  }
  endShape(CLOSE);

  t += tChange;

  fill(100);

  beginShape();

  float eyeW = 80;
  float eyeH = map(mouseX, width, 0, -30, 0);

  vertex(-eyeW/2, 0);
  bezierVertex(-eyeW/2, 0, -eyeW/3, eyeH, 0, eyeH);
  bezierVertex(eyeW/3, eyeH, eyeW/2, 0, eyeW/2, 0);

  endShape();

  fill(0, 20);
  ellipse(0, eyeH+20, 28, 28);

  fill(0);
  ellipse(0, eyeH+20, map(mouseX, width, width-width/3, 14, 10), map(mouseX, width, width-width/3, 14, 10));

  fill(herC);
  rectMode(CENTER);
  rect(0, 60/2, eyeW, 60);
}


void keyPressed() {
  if (key == 's') saveFrame("screen_"+frameCount+".png");
}



