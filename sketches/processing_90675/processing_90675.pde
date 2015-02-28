
CA ca;   

void setup() {
  size(600, 600, P2D);
  frameRate(10);
  background(0);
  int[] ruleset = {1,0,1,1,0,1,1,1};    
  ca = new CA(ruleset);                
}

void draw() {
  ca.render();    
  ca.generate();  
  
  if (ca.finished()) {   
    background(0);
  }
}

void mousePressed() {
  background(0);
}



class CA {

  int[] cells;     // An array of 0s and 1s 
  int generation;  // How many generations?
  int scl;         // How many pixels wide/high is each cell?
  int[] rules;     // An array to store the ruleset, for example {0,1,1,0,1,1,0,1}

  CA(int[] r) {
    rules = r;
    scl = 5;
    cells = new int[width/scl];
  }
  
   CA() {
    scl = 5;
    cells = new int[width/scl];
      }
  
  void setRules(int[] r) {
    rules = r;
  }

  void generate() {
    int[] nextgen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];   // Left neighbor state
      int me = cells[i];       // Current state
      int right = cells[i+1];  // Right neighbor state
      nextgen[i] = executeRules(left,me,right); // Compute next generation state based on ruleset
    }
    
    for (int i = 1; i < cells.length-1; i++) {
      cells[i] = nextgen[i];
    }
    generation++;
  }
  
  void render() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) {
        fill(255);
      } else { 
        fill(0);
      }
      noStroke();
      rect(i*scl,generation*scl, scl,scl);
    }
  }
  
  int executeRules (int a, int b, int c) {
    if (a == 1 && b == 1 && c == 1) { return rules[0]; }
    if (a == 1 && b == 1 && c == 0) { return rules[1]; }
    if (a == 1 && b == 0 && c == 1) { return rules[2]; }
    if (a == 1 && b == 0 && c == 0) { return rules[3]; }
    if (a == 0 && b == 1 && c == 1) { return rules[4]; }
    if (a == 0 && b == 1 && c == 0) { return rules[5]; }
    if (a == 0 && b == 0 && c == 1) { return rules[6]; }
    if (a == 0 && b == 0 && c == 0) { return rules[7]; }
    return 0;
  }
  
  boolean finished() {
    if (generation > height/scl) {
       return true;
    } else {
       return false;
    }
  }
}


