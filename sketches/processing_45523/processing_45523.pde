
class CA {

  int[] cells;     // An array of 0s and 1s 
  int generation;  // How many generations?
  int scl;         // How many pixels wide/high is each cell?

  int[] rules;     // An array to store the ruleset, for example {0,1,1,0,1,1,0,1}

  CA(int[] r) {
    rules = r;
    scl = 1;
    cells = new int[width/scl];
    restart();
  }
  
   CA() {
    scl = 1;
    cells = new int[width/scl];
    randomize();
    restart();
  }
  
  // Set the rules of the CA
  void setRules(int[] r) {
    rules = r;
  }
  
  // Make a random ruleset
  void randomize() {
      
    for (int i = 0; i < 7; i++) {
      rules[i] = int(random(3));
      
          }
  }
  
  
  
  // Reset to generation 0
  void restart() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;    // We arbitrarily start with just the middle cell having a state of "1"
    generation = 0;
  }

  // The process of creating the new generation
  void generate() {
    // First we create an empty array for the new values
    int[] nextgen = new int[cells.length];
    // For every spot, determine new state by examing current state, and neighbor states
    // Ignore edges that only have one neighor
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];   // Left neighbor state
      int me = cells[i];       // Current state
      int right = cells[i+1];  // Right neighbor state
      nextgen[i] = rules(left,me,right); // Compute next generation state based on ruleset
    }
    // Copy the array into current value
    cells = (int[]) nextgen.clone();
    generation++;
  }
  
  // This is the easy part, just draw the cells, fill 255 for '1', fill 0 for '0'
  void render() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(125);
      else if (cells[i] == 2) fill(0);
      else               fill(255);
      noStroke();
      rect(i*scl,generation*scl, scl,scl);
    }
  }
  
  // Implementing the Wolfram rules
  // Totalistic rules with 3 colors 
  int rules (int a, int b, int c) {
    if (soma(a,b,c)==6) return rules[0];
    if (soma(a,b,c)==5) return rules[1];
    if (soma(a,b,c)==4) return rules[2];
    if (soma(a,b,c)==3) return rules[3];
    if (soma(a,b,c)==2) return rules[4];
    if (soma(a,b,c)==1) return rules[5];
    if (soma(a,b,c)==0) return rules[6];
    return 0;
  }
  
  int soma (int a, int b, int c) {
   int soma;
  soma=a+b+c;
 return soma; 
  }
  
  // The CA is done if it reaches the bottom of the screen
  boolean finished() {
    if (generation > height/scl) {
       return true;
    } else {
       return false;
    }
  }
}


