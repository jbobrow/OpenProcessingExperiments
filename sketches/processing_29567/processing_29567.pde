
//final color BROWN = color(139,90,43);
final PVector BROWN = new PVector(139, 90, 43); 
final color GREEN = color(0,120,0);
final color BLUE = color(191,220,255);
int numTrees = 5;

void setup() {
  size(600,400,P3D);
  noLoop();  //only call draw() once
  smooth();
}

void draw() {
  background(255);
  drawForest(numTrees);
  textAlign(CENTER,TOP);
  PFont font = loadFont("LMRoman8-Regular-18.vlw");
  textFont(font,18);
  textMode(SCREEN);
  String msg = "Press 1-9 to redraw the forest...";
  fill(0);
  text(msg,width/2,10);
}

void keyPressed() {
  if ( Character.isDigit( key ) ) {
    numTrees = 2 * Character.getNumericValue(key);
    if ( numTrees > 0 ) {
      redraw();
    }
  }
}

void drawForest(int numTrees) {
  //sky
  pushMatrix();
  translate(0,0,-202);
  noStroke();
  fill(BLUE);
  rectMode(CORNER);
  rect(-5000,-5000, width + 10000, height + 5000);
  rect(-501,.64*height, width + 5000, height);
  popMatrix();
  

  //grass
  pushMatrix();
  translate(0,0,-201);
  noStroke();
  fill(0,120,0);
  rectMode(CORNER);
  rect(-500,.64*height, width + 5000, height);
  rect(-501,.64*height, width + 5000, height);
  popMatrix();
  
  for( int i = 0 ; i < numTrees ; i++ ) {
    float x = .15 * width + .7 * width * random(1);
    float y = .65 * height + .3 * height * random(1);
    //y location dictates how far back the tree appears
    float z = map(y, .6 * height, .9 * height, -200, -50);
    float len = map(z,-200, 0, 80, 165);

    //depth determines darkness/brightness of the brown used
    float r = map(z, -200, 0, .35, 1) * BROWN.x;
    float g = map(z, -200, 0, .35, 1) * BROWN.y;
    float b = map(z, -200, 0, .35, 1) * BROWN.z;
    color clr = color(r,g,b);

    pushMatrix();
    translate(x,y,z);
    drawTree(new PVector(0,0), .9*len + .2*len*random(1), clr);
    popMatrix();
  }

  //PVector start = new PVector(width/2, height - 50);
  //drawTree(start, 170);
}

void drawTree(PVector start, float len, color clr) {
  int startingBranchLevel = 8;

  pushMatrix();
  translate(start.x, start.y);
  stroke(clr);
  float thickness = len/8;
  strokeWeight(thickness);

  PVector end = new PVector(0, -len);
  //draw 2 lines that overlap to eliminate "triangle" gap within rectangle
  line(0, 0, end.x, end.y);  
  line(1, 0, end.x + 1, end.y);  

  //begin recursive calls to draw branches
  pushMatrix();
  translate(end.x, end.y + .08*len);
  drawBranches(len, thickness, clr, startingBranchLevel);
  popMatrix();

  popMatrix();
}

//precondition:  coordinate system translated and rotated
//such that (0,0) is starting point for branches and last
//branch is pointing straight up (90deg)
void drawBranches(float lastLen, float lastThickness, color clr, int level) {
  //base case
  if ( level == 0 ) {
    return;
  }

  if ( level <= 4 ) {
    clr = GREEN; //draw leaves near end
  }


  //branch between 5 and 8 times
  int numBranches = 5 + (int)random(4);

  //new branches have length that is 50% of prior +/- 20% -- 
  //so between 30 and 70 percent of prior length
  //remove: float baseLen = lastLen * .6; 
  float[] lengths = new float[numBranches];
  for( int i = 0 ; i < lengths.length ; i++ ) {
    lengths[i] = (.3 + random(.5))*lastLen;
  }

  //new branches have thickness that is 40% of prior +/- 10%
  float baseThickness = lastThickness * .4;
  float[] thickness = new float[numBranches];
  for( int i = 0 ; i < thickness.length ; i++ ) { 
    thickness[i] = .9*baseThickness + .2*baseThickness*random(1);
  }


  float[] angles = new float[numBranches];

  if( level <= 3 ) { //green -- all angles allowed
    for( int i = 0 ; i < angles.length ; i++ ) { 
      angles[i] = random(360);
    }
  } 
  else {
    //choose angles for each branch, ranging from 40deg-140deg
    boolean balanced = false; 
    while( ! balanced ) {
      for( int i = 0 ; i < angles.length ; i++ ) { 
        angles[i] = 40 + random(100);
      }

      //if the average of the angles is between 80 & 100 deg and
      //the standard deviation is between 15 & 20, 
      //this level is considered balanced
      float avg = arrAverage( angles );
      float sd = stdDev( angles );
      if ( avg >= 80 && avg <= 100 && sd >= 10 && sd <= 15 ) {
        balanced = true;
      }
    }
  }

  //draw each branch and recurse to draw the rest
  for( int i = 0 ; i < numBranches ; i++ ) {
    pushMatrix();
    PVector endPt = new PVector();
    endPt.x = lengths[i] * cos( radians(angles[i]) );
    endPt.y = -1 * lengths[i] * sin( radians(angles[i]) );
    strokeWeight( thickness[i] );
    strokeCap(ROUND);
    stroke(clr);
    line(0, 0, endPt.x, endPt.y);
    translate(endPt.x, endPt.y);
    rotate( radians(90 - angles[i]) );
    translate(0, .05*lengths[i]);

    //increase random appearance:  to draw branches from this point
    //outward, don't just reduce level by 1; reduce by 2 and, with 
    //some probability, add a level back.  Then, by raising initial 
    //depth (in call from drawTree()), a more random looking tree 
    //should be produced.
    // 
    //20110607 mferraro
    int nextLevel = level - 2;
    if ( random(1) < .5 ) {
      nextLevel++;
    }
    if ( nextLevel < 0 ) {
      nextLevel = 0;
    }
    //20110607:  end
    
    drawBranches(lastLen*.6, baseThickness, clr, nextLevel);
    popMatrix();
  }
}

float arrAverage(float[] arr) {
  float sum = 0;
  for( int i = 0 ; i < arr.length ; i++ ) {
    sum += arr[i];
  }
  return sum/arr.length;
}

float stdDev(float[] arr) {
  float sum = 0;
  float avg = arrAverage(arr);
  for( int i = 0 ; i < arr.length ; i++ ) {
    sum += Math.pow(avg - arr[i],2);
  }
  return (float)(Math.sqrt(sum) / (arr.length-1));
}


