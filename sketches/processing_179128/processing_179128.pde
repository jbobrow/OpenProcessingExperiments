
// Nature of Code by Daniel Shiffman
// Ch4 particle systems and 
// Ch7 cellular automata

Emitter  e;

void setup() {
  size(1000, 300);
  e = new Emitter();
}

void draw() {
  background(#EDED9C);
  e.run();
  noFill();
  stroke(#58BF15);
  strokeWeight(1);
  ellipse(145, height/2,285,285);
  line(0, 150, width, 150);
  line(0,   7, width,   7);
  line(0, 292, width, 292);
  strokeWeight(3);
  point(145, height/2);
  
}

class CA {
  // variables for the automaton structure
  int cellSize, autoCol, autoRow, autoWidth, autoHeight;
  int[][] automaton; 
  PGraphics p;  

  CA() {
    cellSize = 1;
    autoWidth = 100;
    autoHeight = 100;
    automaton = new int[autoHeight][autoWidth];
    buildAutoMatrix();
    p = createGraphics(100, 100);
  }

  // create 2D array of zero's
  void buildAutoMatrix() {
    for (int row = 0; row < autoHeight; row++) { 
      for (int col = 0; col < autoWidth; col++) {
        automaton[row][col] = 0;
      }
    }
  }

  // use  ruleset argument to build the automaton structure
  void calcAutoMatrix(int[] rSet) {

    autoRow = 0; // start from gen zero
    automaton[autoRow][autoWidth/2] = 1;  // prime gen zero(the top row)

    // transfers to 1 row ahead(the next gen), so reduce autoHeight by 1
    for (int i = 0; i < autoHeight-1; i++) { // row

      // calc the next row/gen
      int[] nextRow = new int[autoWidth];
      for (int j = 1; j < nextRow.length-1; j++) { // ignore ends
        int left = automaton[autoRow][j-1];   
        int me = automaton[autoRow][j];       
        int right = automaton[autoRow][j+1];  
        nextRow[j] = rules(left, me, right, rSet);
      }

      // transfer calculated row to next gen 2D array row
      autoRow++;
      for (int n = 0; n < nextRow.length; n++) {
        automaton[autoRow][n] = nextRow[n];
      }
    }
  }

  void makeGraphic() {
    p.beginDraw();
    p.fill(#50184C);
    p.noStroke();
    for (int row = 0; row < autoHeight; row++) { 
      for (int col = 0; col < autoWidth; col++) {
        if (automaton[row][col] == 1 ) {
          p. rect(col*cellSize, row*cellSize, cellSize, cellSize);
          p.endDraw();
        }
      }
    }
  }

  void displayGraphic(float lifespan) {
    tint(255, lifespan);
    image(p, 0, 0);
  }  

  // apply ruleset. Used in 'calcAutoMatrix'
  int rules (int a, int b, int c, int[] set) {
    int[] ruleSet = set;
    String s = "" + a + b + c;
    int index = unbinary(s);
    return ruleSet[index];
  }
}

class Emitter {
  ArrayList<Particle> particles;
  PVector pos;
  ListManager listManager;
  int[] ruleSet;

  Emitter() {
    pos = new PVector();
    particles = new ArrayList<Particle>();
    listManager = new ListManager();
  }

  void run() {
    pos.set(145, height/2);
    if (frameCount % 320 == 0) {
      ruleSet = listManager.nextFromList();
      particles.add(new Particle(pos, ruleSet));
    }
    for (int i = particles.size () -1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

class ListManager {
  int listPos;
  int[] ruleSet;

  // just a few I liked the look of
  int[] ruleList = {
    45, 73, 75, 89, 101, 105, 109, 129, 135, 137, 
    149, 151, 153, 169, 181, 183, 225
  };

  ListManager() {
    ruleSet = new int[8];
    listPos = 0;
  }

  int[]  nextFromList() {
    if (listPos > 16)  listPos = 0;
    String s = binary(ruleList[listPos], 8);
    for (int i = 0; i < 8; i++) { 
      char temp = s.charAt(i);
   // cull ascii code when in Java mode
      int n = 0;       
      if (temp == 49 || temp == 1)  n = 1;
      ruleSet[i] = n;
    }
    ruleSet = reverse(ruleSet);
    listPos++;
    return ruleSet;
  }
}

class Particle {
  CA ca;
  int[] ruleSet;
  PVector pos, vel, accel;
  float lifespan, size, angle, emitAngle;
  boolean reset ;

  Particle(PVector l, int[] rSet) {
    accel = new PVector();
    vel = new PVector();
    emitAngle = 0;
    reset = false;
    pos = l.get();
    lifespan = 0.0;
    size = 100;
    angle = 0;
    // make a CA graphic for each particle
    ca = new CA();
    ca.calcAutoMatrix(rSet);
    ca.makeGraphic();
  }

  void revolve() {
    angle += .5;
    if (angle > 360) {
      angle = 1;
    }
  }

  void run() {
    revolve();
    move();
    display();
  }


  void move() { 
    if (lifespan > 255  && reset == false) {
      accel.set(0.9, 0);
      reset = true;
    }

    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
    lifespan += 0.2;
  }

  void display() {
    noFill();
    stroke(#58BF15, lifespan*20);
    strokeWeight(1);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(angle));
    rect(0, 0, size, size);
    ca.displayGraphic(lifespan);
    popMatrix();
  }

  boolean isDead() {
    if (lifespan > 500) {
      return true;
    } else {
      return false;
    }
  }
}



