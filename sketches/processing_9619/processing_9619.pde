
// Fractal Tree derived from Javascript example at
// http://www.kirupa.com/developer/actionscript/chaos_fractal.htm

int treedepth = 5;
int seed = 0;
Boolean isRandom = true;
Boolean refresh = true;

void makeBranch(float x, float y, float theLength, float angle, int stepcount, Boolean isRandom){
  strokeWeight(stepcount*1.5);
  float max_sub_branch = 5.0; // Maximum depth of the tree
  float max_sub_angle = 3.0 * PI / 4.0; // Maximum angle to position between subbranches
  // max_sub_angle = 2 * pi ' = all directions allowed

  if(isRandom) theLength = theLength + random(-0.5,0.5) * theLength / 10;
  if(isRandom) angle = angle + random(-0.5,0.5) * angle / 3;
  
  // draw the branches
  if (stepcount > 0){
    float[] startpt = new float[2];
    float[] endpt = new float[2];
    startpt[0] = x;
    startpt[1] = y;
    endpt[0] = x + theLength * cos(angle);
    endpt[1] = y + theLength * sin(angle);

    line(startpt[0], startpt[1], endpt[0], endpt[1]);

    // ----------------------------------
    // prepare the next level (recursive)
    // ----------------------------------
    // amount of subbranches
    float sub_branch;
    if(isRandom) {
      sub_branch = random(1) * (max_sub_branch - 1) + 2;
    } 
    else {
      sub_branch = max_sub_branch;
    }

    // subbranch length
    float branch_length_dimin;
    if(isRandom) {
      branch_length_dimin = 0.5 + random(1) / 2;
    } 
    else {
      branch_length_dimin = 0.7;
    }

    for(int I = 0; I < sub_branch; I++){
      float newLength = theLength * branch_length_dimin;
      // generate angles
      float newAngle;
      if(isRandom) {
        newAngle = angle + random(1) * max_sub_angle - max_sub_angle / 2;
      } 
      else {
        newAngle = angle - max_sub_angle / 2 + max_sub_angle * I / (sub_branch - 1);
      }
      // recursive step
      makeBranch(endpt[0], endpt[1], newLength, newAngle, stepcount - 1, isRandom);
    } // Next I
  } // End If
}

void setup(){
  size(400,400);
  background(100);
  smooth();
  makeBranch(width/2, height, 100, -PI/2, treedepth, isRandom);

  PFont typewriter;
  typewriter = loadFont("typewriter.vlw");
  textFont(typewriter);
}

void Mydraw(){
  randomSeed(seed);
  background(100);
  makeBranch(width/2, height, 100, -PI/2, treedepth, isRandom);

  text("r       = toggle Random     : " + isRandom, 5, 10);
  text("up/down = set Tree Depth    : " + treedepth, 5, 20);
  text("s       = change randomseed : " + seed, 5, 30);
  
  refresh = false;
}

void draw(){
  if (refresh) Mydraw();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      treedepth += 1;
    } 
    else if (keyCode == DOWN) {
      if (treedepth > 1) treedepth -= 1;
    }
  }
  else {
    if (key == 'r'){
      isRandom = !isRandom;
    } else if (key == 's') {
      seed += 1;  
    }
  }
  refresh = true;

}
















