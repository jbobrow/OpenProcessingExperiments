
int poleSize = 10; //magnet size is proportional increased by poleSize
int unitSize = 10; //each vector on a field is a "unit"
int currMagnet = 0; //simple counter
int uWidth, uHeight; //number of "units" that can fit in the screen
vectorField masterField; //each magnet has its own field, the master is for summarization
ArrayList magnets; //uses an ArrayList so we can keep adding magnets until the cows come home...
float halfU = unitSize/2.0; //used for translation to center of "unit"

void setup() {
  size(600,400);
  smooth();
  uWidth = int(width/unitSize)+1;
  uHeight = int(height/unitSize)+1;
  masterField = new vectorField();
  magnets = new ArrayList();
  magnets.add(new magnet());
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);
  fill(255);
  // update current magnet field
  magnet m = (magnet) magnets.get(currMagnet);
  m.update();
  
  // summarize and show master field
  masterField.degauss();
  for (int i=0; i<currMagnet; i++) {
    m = (magnet) magnets.get(i);
    masterField.add(m.vf);
  }
  m = (magnet) magnets.get(currMagnet);
  if (m.moveMode > 0) masterField.add(m.vf);
  masterField.show();
  
  // overlay the magnets
  for (int i=0; i<=currMagnet; i++) {
    m = (magnet) magnets.get(i);
    m.show();
  }
  fill(0);
  text("Press <Space> to reset magnets", width/2,height-10);
}

void mousePressed() {
  // update the current magnet (or get a new one)
  magnet m = (magnet) magnets.get(currMagnet);
  m.moveMode++;
  if (m.moveMode > 1) {
    magnets.add(new magnet());
    currMagnet ++;
  }
}

void keyPressed() {
  if(key == ' ') {
    //space key hit, reset magnets
    for (int i=magnets.size()-1; i>=0; i--)
      magnets.remove(i);
    currMagnet = 0;
    magnets.add(new magnet());
  }
}

void arrow(float x, float y) {
  // draws a simple arrow (assumes a translated origin)
  float len = sqrt(sq(x)+sq(y))*.3;
  line(0,0, x,y);
  pushMatrix();
    translate(x, y);
    rotate(atan2(y, x));
    line (0,0, -len, len *  0.35);
    line (0,0, -len, len * -0.35);
  popMatrix();
}

