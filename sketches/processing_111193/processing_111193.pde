
//Assignment for week4 - Dynamic with input from the user
//In this sketch I try do draw Topological objects or geometrical
// objects, starting from two spirals 
// (one is mirroring of the other) of all colors.
//The spirals made of points and drawn symmetricly on X axis and Y.
//The spirals are moving by the poiner movements
// and become thinner over time.
// Written by Michal Huller
// http://www.openprocessing.org/user/28555

/////////////////////////////////////////////////////////////
// Instructions:
//----------------
// Click mause to start the sketch
// move mouse (no need to press) and draw topology shapes
// space bar - start a new sketch
// p - Pause the sketch
// s - save this frame to your sketch folder
/////////////////////////////////////////////////////////////

boolean stop = true;
boolean newdraw = false;
flower myfl[];
float startR = 20;
float shrink = 0.99;

void setup() {
  size(600, 500);
  background(0);
  smooth();
  // colors as precentage
  colorMode(HSB, 100, 100, 100);

  initb();
}

void draw() {
  if (!stop) {
    int manyFlowers = myfl.length;
    for (int i = 0; i < manyFlowers; i++) {
     myfl[i].update((mouseX - pmouseX)/1.8, (mouseY - pmouseY)/1.8, 
      myfl[(i+1) % manyFlowers].colr,
      shrink);
      myfl[i].draw();
    }
  }
}
// initialize graphic - only for the first time
void initb() {
  background(0);
  myfl = new flower[720];
  float ri = 0.0;
  float spiral = 0.1;
  for (int i = 0; i < myfl.length; i++) {
    ri += TWO_PI/360;
    spiral += 0.12;
    myfl[i] = new flower(spiral*sin(ri), spiral*cos(ri), 
    startR, color(100*ri/(TWO_PI*2), random(70,100), random(60,100)));
  }
}

// initialize graphic after first time was done
void initAgain() {
  background(0);
  
  for (int i = 0; i < myfl.length; i++) {
    myfl[i].restore();
  }
}

void mousePressed() {
  stop = false;
}

void keyPressed() {
  // start or stop Pause toggle key
  if (key == 'p' || key == 'P') {
    stop = !stop
  }
  // save frame key
  if (key == 's' || key == 'S') {
    saveFrame("newframes/mov####.jpg");
  }
  // a new drawing key
  if (key == ' ') {
    initAgain();
  }
}

public class flower {
  float origx;
  float origy;
  float curx;
  float cury;
  float origr;
  float curr;
  color colr;
  color origc;
  
  flower(float x, float y, float r,
  color c) {
    origx = x + width/2;    
    origy = y + height/2;
    origr = r;    
    origc = c;
    restore();
  }
  
  void draw() {
    stroke(colr,30);
    strokeWeight(curr);
    noFill();
    
    point(curx, cury);
    point(width - curx, height - cury);
    
  }
  
  void update(float x, float y, color c, float r) {
    curx += x;
    cury += y;
    colr = c;  
    if (curr > 1.1) curr = curr * r;
  }
  
  void restore() {   
   curx = origx;
   cury = origy;
   curr = origr;
   colr = origc; 
  }
  
  
  
}


