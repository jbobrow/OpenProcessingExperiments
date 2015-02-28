
//Defensive Dot
//Patrick J. O'Donnel
//Homework #3: FOR and WHILE

//When the mouse gets close to the dot, it grows in size and displays a warning color.
//As the mouse stays near the dot, it eventually relaxes back to its original state.


// Size of each cell in the grid
int sq = 1;

// Number of columns and rows in our system
int cols, rows;

void setup() {
  size(120,600);
  
  // Initialize columns and rows
  cols = width/sq;
  rows = height/sq;
}

void draw() {
  //BACKGROUND
  // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {
      int x = i*sq;
      int y = j*sq;
      float c = x+y/4.2;
      fill(c);
      noStroke();
      rect(x,y,10,10);
    }
  }
  
  fill(0,100,200);
  ellipse(60,300,50,50);
  float dis = sqrt((300-mouseY)*(300-mouseY)+(60-mouseX)*(60-mouseX));
  int n = 0;
  
  while (dis<70-n) {
    fill(255,165,0);
    ellipse(60,300,65,65);
    n=n+1;
    println ("n = " + n);
  }
  
  
      
   
}

