
int     nFramesInLoop = 800;
int     nElapsedFrames;
boolean bRecording; 

ArrayList<Path> allPaths = new ArrayList<Path>();
PImage object;
PImage noncomformity;

//===================================================
void setup() {
  size (600, 300); 
  bRecording = false;
  nElapsedFrames = 0; 
  noFill();

  int which = int(random(3));
  boolean frog = false;
  
  //Randomly choose 1 out of 3 available themes
  //and load image accordingly
  if (which==0) {
    object = loadImage("sakura_flower.png");
  }
  else if (which==1) {
    object = loadImage("maple_leaf.png");
  } 
  else {
    object = loadImage("lily_pad.png");
    int temp = int(random(2));
    if (temp==1) {
      frog = true;
      noncomformity = loadImage("lily_pad_frog.png");
    }
  }

  //Create individual Path objects and append to global ArrayList
  for (int i=0; i<9; i++) {
    Path p = new Path();
    allPaths.add(p);
    //Last object has chance to be a frog
    if (i==8 && frog==true){
      p.changeLook(noncomformity);
    }
  }
}

//===================================================
void keyPressed() {
  bRecording = true;
  nElapsedFrames = 0; 
}

//===================================================
void draw() {
 
  // Compute a percentage (0...1) representing where we are in the loop.
  float percentCompleteFraction = 0; 
  if (bRecording) {
    percentCompleteFraction = (float) nElapsedFrames / (float)nFramesInLoop;
  } else {
    percentCompleteFraction = (float) (frameCount % nFramesInLoop) / (float)nFramesInLoop;
  }
 
  // Render the design, based on that percentage. 
  renderMyDesign (percentCompleteFraction);
 
  // If we're recording the output, save the frame to a file. 
  if (bRecording) {
    saveFrame("output/myname-loop-" + nf(nElapsedFrames,4) + ".png");
    nElapsedFrames++; 
    if (nElapsedFrames > (nFramesInLoop+1)) {
      bRecording = false;
    }
  }
}

void renderMyDesign(float percent) {
  background(255);
  fill(160, 200, 255, 80);
  noStroke();
  rect(0, 0, width, height);

  int n = allPaths.size();

  //Draw background bezier curves first
  noFill();
  for (int i=0; i<n; i++) {
    Path p = allPaths.get(i);
    p.drawCurve(percent);
  }

  //Then draw objects on top
  noStroke();
  fill(255, 200, 240);
  for (int i=0; i<n; i++) {
    Path p = allPaths.get(i);
    p.drawObject(percent);
  }
}

class Path {
  //Initiate variables
  PImage ownLook = object;
  float size = 30;
  float x1 = -(size); 
  float y1 = random(-size, height+size);
  float cpx1 = random(width); 
  float cpy1 = random(-size, height+size);
  float cpx2 = random(width); 
  float cpy2 = random(-size, height+size);
  float x2 = width;
  float y2 = y1;
  float startT = random(0, 1);
  float startAngle = random(0, 1);
  int rotation = int(pow(-1, (int(random(9))%2)));

  float thickness1 = random(2*height/8, 3*height/8);
  float thickness2 = random(4*height/8, 5*height/8);
  float startPercent = random(0,1);

  //Draw bezier curve
  void drawCurve(float percent) {
    //Curve starts with a random width, 
    //then grows/shrinks depending on percent
    float t = percent+startPercent;
    if (t>1) t-=1;
    float thickPercent = sin(2.0*t*TWO_PI);
    float thickness = map(thickPercent,-1,1,thickness1,thickness2);
    stroke(160, 200, 255, 80);
    strokeWeight(thickness);
    bezier(x1, y1, cpx1, cpy1, cpx2, cpy2, x2, y2);
  }

  //Draw moving object
  void drawObject(float percent) {
    //Make sure object is correct size before drawing
    ownLook.resize(int(size)*2, int(size)*2);
    
    //Object starts at random point on curve w/ random rotation
    float t = startT+percent;
    if (t>1) t-=1;
    float x = map(t*width,0,width,x1,x2);
    float y = bezierPoint(y1, cpy1, cpy2, y2, t);

    float cx = x+(size/2);
    float cy = y+(size/2);

    //Draw the object
    pushMatrix();
    translate(cx, cy);
    float angle = (t)*TWO_PI*rotation;
    rotate(angle);
    image(ownLook, -size, -size);    
    popMatrix();
  }
  
  //Change the images of moving object
  void changeLook(PImage change){
    ownLook = change;
  }
}



