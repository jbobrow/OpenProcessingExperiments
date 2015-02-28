
float ratio = sqrt(2);
float paperWidth = 270;
float paperHeight;

int nfold = 0;
int foldInc = 1;
float foldFactor = 0.5;

float tstart = 0, dt = 0.05;
float t = tstart;

PFont theFont;
PImage theImage;

boolean play = false;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  
  frameRate(40);
  
  background(#ffffff);
  
  theFont = loadFont("CharterBT.vlw");
  textFont(theFont);
  textSize(48);
  textAlign(CENTER, CENTER);
  
  //theImage = loadImage("img.png");
  
  strokeJoin(ROUND);
  
  reset();
}

void draw() {
  clear();
  
  stroke(140, 80, 90, 100);
  strokeWeight(3);
  fill(147, 69, 95, 70);
  
  if (nfold % 2 == 0) { 
    foldv(
      width / 2, height / 2,
      paperWidth, paperHeight,
      t
    );
  }
  else {
    foldh(
      width / 2, height / 2,
      paperWidth, paperHeight,
      t
    );
  }
  
  t += dt;
  
  fill(150, 87, 62, 50);
  textSize(48);
  text(nfold, width/2, 75);
  
  img(300, 380, 80, ratio, paperHeight/paperWidth);

  if (t > tstart + PI) {
    t = tstart;
    
    nfold += foldInc;
    
    if (nfold % 2 == (1 + foldInc)/2) {
      paperHeight *= foldFactor;
    }
    else {
      paperWidth *= foldFactor;
    }
    
    if (nfold > 7 || nfold < 1) {
      foldInc *= -1;
      tstart += PI;
      foldFactor = 1 / foldFactor;
    }

    //delay(100);
  }
  
  if (!play) {
    clear();
    playButton();
    noLoop();
  }
}

void clear() {
  noStroke();
  fill(0, 0, 100, 50);
  rect(0, 0, width, height);
}

void foldv(float x, float y, float w, float h, float t) {
  float px = h/8 * cos(t + HALF_PI);
  float py = h/2 * sin(t + HALF_PI);
  
  float x1 = x - w/2;
  float x2 = x1 + w;

  float y1 = y - (h/2 + ((py > 0)? py: 0)) / 2;
  float y2 = y1 + h/2;

  quad(
    x1, y2,
    x2, y2,
    x2 - px, y2 + py,
    x1 - px, y2 + py
  );
  rect(x1, y1, w, h/2);
}

void foldh(float x, float y, float w, float h, float t) {
  float px = w/2 * cos(t);
  float py = w/8 * sin(t);
  
  float x1 = x - (w/2 + ((px > 0)? px: 0)) / 2;
  float x2 = x1 + w/2;

  float y1 = y - h/2;
  float y2 = y1 + h;

  quad(
    x2, y1,
    x2, y2,
    x2 + px, y2 - py,
    x2 + px, y1 - py
  );
  rect(x1, y1, w/2, h);  
}

void img(float x, float y, float w, float r1, float r2) {
  if (r2 < 1) r2 = 1/r2;
  
  float h = w * r2;
  
  strokeWeight(2);
  stroke(0, 0, 0, 30);
  fill(0, 0, 0, 10);
  rect(x, y - h, w, h);
  
  float d = 0.8 * w;
  
  noStroke();
  fill(0, 0, 0, 20);
  ellipse(x + w/2, y - h/2, d, d * r2/r1);
}

void playButton() {
  float x = width / 2;
  float y = height / 2;
  float s = 30;
  float sq3 = s * sqrt(3)/6;
  
  noStroke();
  fill(250, 20, 90, 50);
  ellipse(x, y, s + 40, s + 40);

  strokeWeight(10);
  stroke(250, 0, 100, 90);
  fill(250, 0, 100, 90);
  triangle(
    x - sq3, y - s/2,
    x - sq3, y + s/2,
    x + sq3 * 3/2, y
  );
}

void mouseReleased() {
  play = !play;
  
  if (play) loop();
}

void keyReleased() {
  switch(key) {
    case 'A':
    case 'a':
    case 'B':
    case 'b':
      ratio = sqrt(2);
      break;
    case 'F':
    case 'f':
      ratio = 13.5/8.5;
      break;
    case '2':
      ratio = 2;
      break;
  }
  
  if (key != ' ') reset();
  
  play = !play;
  
  if (play) loop();
}

void reset() {
  t = 0;
  tstart = 0;
  dt = 0.05;
  
  nfold = 0;
  foldInc = 1;
  foldFactor = 0.5;
  
  paperWidth = 270;
  paperHeight = paperWidth * ratio;
}
