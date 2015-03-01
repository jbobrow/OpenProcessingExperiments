


void setup() {
  size(400,400);
  background(0);
  stroke(255);
  noStroke();
  
  
}

color black = color(0);
color white = color(255);
color bgCol = black;
int iteration = 0;

int numFramesRot = 80;
int numFramesScale = 40;
int numFrames = numFramesRot;
boolean rotate = true; // either rotate or scale

void draw() {

  if(numFrames == frameCount && rotate) { rotate = false; frameCount=0; numFrames = numFramesScale; }
  if(numFramesScale == frameCount && !rotate) {rotate = true; frameCount = 0; iteration += 1; numFrames = numFramesRot; }

  float t = map(frameCount-1,0,numFrames,0,1);
  float tt;
  if(rotate) tt = 3*t*t - 2*t*t*t;
  else tt = 1-(t-1)*(t-1);
  //println("tt: "+tt);

  translate(width/2, height/2);
  if(rotate) {rotate((TWO_PI) * tt);}

  background(bgCol);
  if(!rotate) {
    color next;
    if(iteration % 2 == 0)
      next = color(255);
    else {
      next = color(0);
    }
    bgCol = lerpColor(bgCol, next, tt);
  }
  

  for (int i = 0; i < 8; ++i) {
    rotate(QUARTER_PI);
    if(rotate){
      // i * HALF_PI
      if(i %2==0) 
      {
        if(iteration % 2 == 0) fill(white);
        else fill(black);
        arc(0, 0, width, height, 0, QUARTER_PI);  
      }
      // i * HALF_PI + QUARTER_PI
      else {
        if(iteration % 2 == 0) fill(black);
        else fill(white);
        arc(0, 0, width, height, 0, QUARTER_PI);    
      }
    }
    else {
      // i * HALF_PI
      if(i % 2 ==0) { 
        pushMatrix();
        scale(tt); 
        if(iteration % 2 == 0) fill(black);
        else fill(white);
        arc(0, 0, width, height, 0, QUARTER_PI); 
        popMatrix();
      }
      // i * HALF_PI + QUARTER_PI
      else {
        pushMatrix();
        if(iteration % 2 == 0) fill(black);
        else fill(white);
        
        scale(map(tt,0,1,1,0)); arc(0, 0, width, height, 0, QUARTER_PI);
        popMatrix();
      }
    }
  }
}


