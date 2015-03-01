
// Code by @MetaGlitch

int numFrames = 120;
boolean recording = false;

void setup() {
  size(500, 500);
  frameRate(20); // gif framerate for perfect preview
  noStroke();
  smooth(8);
  rectMode(CENTER);
}

void draw() {
  float t = map(frameCount, 1,numFrames, 0,1) % 1;
  
  background(255);

  translate(width/2, height/2);
  scale(250);
  rotate(-HALF_PI*t);
  
  int shades = 4;  
  for (int i = 0; i < shades; i++)
  { 
    float s = 1 - pow(0.5,(shades-i-1)); // s = 0.875, 0.75, 0.5, 0.0
    fill(255*s, 255*s, 255*ease(s,2)); // easing blue component for tinting 
    pushMatrix();
    // every shade is pushed by 5% into the future in the middle of the animation
    float tt = (t + pingpong(t)*i*0.05) % 1; 
    quad(0,2,tt);
    popMatrix();
  }

  if (recording) {
    saveFrame("frames/f###.png");
    if (frameCount==numFrames) exit();
  }  
}

void quad(int level, int maxlevel, float tt) {
  float t = tt;
  // compress time to 2. and 3. quarter => _/_
  // so animation happens when parent level waits.
  for(int i=0; i<level; i++) t = (t>0.25 && t<0.75) ? 2*(t-0.25) : 0;
  
  t = ease(t, 1.5);
  
  if (level == maxlevel) {
    rect(0,0,1,1);
  } else {
    scale(1.0/3);
    for(int x=-1; x<=1; x++) for(int y=-1; y<=1; y++) {
      pushMatrix();
      translate(x,y);      
      scale(1 - 0.2*pingpong(t)); // scale a bit down to separate pieces
      
      if (abs(x) != abs(y)) { // only side pieces, not corners or middle
        if (t < 0.25)
        {
          // first quarter: push out pieces
          float po = map(t, 0,0.25, 0,1);
          translate(x*po,y*po);
        } else if (t < 0.75) {
          // middle half: keep pieces outside
          translate(x,y);
          // sub animations go here... just waiting
        } else if (t < 0.875) {
          // first half of last quarter: rotate pieces
          translate(x,y);
          rotate(HALF_PI*map(t, 0.75,0.875, 0,1));
        } else {
          // second half of last quarter: pull in again
          float po2 = 1-map(t, 0.875,1, 0,1);
          translate(x*po2,y*po2);
        }
      } else { // corner pieces and middle piece
        float ttt = 0.5*(pingpong(t)); 
        //translate(x*ttt,y*ttt);
        //scale(1 + 0.25*pingpong(t));
      }
      quad(level+1, maxlevel, t);
      popMatrix();
    }
  }
}

//////////////////

float pingpong(float t) { //  / => /\
  return 1-2*abs(t-0.5);
}

float ease(float t, float e) {
  return t < 0.5 ? 0.5 * pow(2*t, e) : 1 - 0.5 * pow(2*(1 - t), e);  
}

float ease(float t, float in, float out) {
  return (1-t)*ease(t, in) + t*ease(t, out);  
}

