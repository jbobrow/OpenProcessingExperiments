
//ISOLATION BY DISTANCE CONSIDERING A POPULATION OF DIPLOID ORGANISMS
//IN THIS CASE: ONE GENE, TWO ALLELES (WITH COMPLETE DOMINANCE).
//EACH CELL IS 1 INDIVIDUAL. AT EACH GENERATION ONE INDIVIDUAL BREEDS WITH 
//ANY ONE OTHER INDIVIDUAL WITHIN THE USER DEFINED BREEDING NEIGHBOURHOOD.
//AFTER REPRODUCING THE INDIVIDUAL IS REPLACED WITH ONE OF THE RANDOMLY CHOSEN 
//PROGENY ACCORDING TO MENDELIAN GENETICS AND PROPORTIONS.

//THE ACTUAL REPRODUCTIVE LANDSCAPE WORKS LIKE A FOLDED PLANE, IN THE
//SENSE THAT THE RIGHT HAND SIDE OF THE TERRITORY IS ACTUALLY CONTINUOUS
//WITH THE LEFT HAND SIDE AND THE TOP WITH THE BOTTOM, THUS AVOIDING THE
//PROBLEM OF HAVING TO DEAL WITH REPRODUCTIVE NEIGHBOURHOODS ON THE BORDERS
//OF THE VIRTUAL LANDSCAPE

//REPRODUCTION BEGINS UPON PRESSING THE 'W' KEY ON THE COMPUTER KEYBOARD
//AND CAN BE STOPPED TEMPORARILY BY PRESSING THE 'Q' KEY

//RED = HOMOZYGOUS RECESSIVE
//YELLOW = HOMOZYGOUS DOMINANT
//ORANGE = HETEROZYGOTES

//INITIALLY THE LANDSCAPE IS COMPLETELY POPULATED BY HETEROZYGOTES


// THIS SKETCH WAS DEVELOPED BY 
// MAURO A. ZORDAN 
// BASED UPON THE FOLLOWING SKETCH OUTLINE 
//**********************************************************************
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 13-10: Two-dimensional array of objects

//**********************************************************************

// 2D Array of objects
Cell[][] grid; 
Cell[][] grid2;

// SET THE IMPORTANT VARIABLES BELOW

//DECIDE HERE HOW MUCH TO ZOOM IN ON THE LANDSCAPE
float zoomfactor = 2;

//WHAT PROPORTION OF THE POPULATION IS ACTUALLY BREEDING IN EACH GENERATION
float proportionReproducing = 0.2;

//REPRODUCTION NEIGHBOURHOOD SIZE (I.E. THE NUMBER OF ADJACENT INDIVIDUALS (HORIZONTALLY AND VERTICALLY) WITH 
//WHICH EACH INDIVIDUAL CAN FREELY BREED
int RowNeighbours = 1;
int ColNeighbours = 1;

int cols = int(100/zoomfactor);
int rows = int(100/zoomfactor);

int counter = 0; //To count number of generations elapsed
int paint;

void setup() {
  size(800,600);
  grid = new Cell[cols][rows];
  grid2 = new Cell[cols][rows];
  randomSeed(millis());
  
  
  // The counter variables i and j are also the column and row numbers
  // In this example, they are used as arguments to the constructor for each object in the grid.
  // This first grid is the population before breeding (populated with random genotypes) 
  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      // Initialize each object
//      int checkerboard = int(random(3));
      grid[i][j] = new Cell(i*width/cols,j*height/rows,width/cols,height/cols,1);
      grid2[i][j] = grid[i][j];
    }
  }
  noLoop();
}

void reproduction() {
    int tempGenotype = 0; int progenyChoice = 0;
//    int NumReproducing = int(random(cols*rows));  //Number of individual actualy reproducing in the current generation 
      int NumReproducing = int(rows*cols*proportionReproducing);   
    for (int i = 0; i < NumReproducing; i ++ ) {     
        int x = int(random(cols));                // Random coordinates of reproducing individuals
        int y = int(random(rows));
        
        int choice1 = grid[x][y].genetics();
        int k = x + int(random(-ColNeighbours, ColNeighbours+1)); // Choose a random partner within the reprodudction neighbourhood
        if (k > 0 && k < cols ){} else if (k < 0) {k = cols-1;} else {k = 0;}
        int l = y + int(random(-RowNeighbours, RowNeighbours+1));
        if (l > 0 && l < rows){} else if (l < 0) {l = rows-1;} else {l = 0;}
        int choice2 = grid[k][l].genetics();
//        println(choice1 + "  " + choice2);
        
        
        switch(choice1) {
          
            case 0:
            if (choice2 == 0) {grid2[x][y] = new Cell(x*width/cols,y*height/rows,width/cols,height/cols,0);}
            else if (choice2 == 1) {
              progenyChoice = int(random(2));
              grid2[x][y] = new Cell(x*width/cols,y*height/rows,width/cols,height/cols,progenyChoice);}
            
            else {grid2[x][y] = new Cell(x*width/cols,y*height/rows,width/cols,height/cols,1);}  
            break;
            
            case 1: 
            if (choice2 == 0) {
              progenyChoice = int(random(2));
              grid2[x][y] = new Cell(x*width/cols,y*height/rows,width/cols,height/cols,progenyChoice);}
            
            else if (choice2 == 1) {
              int monohybrid = int(random(101));
              if (monohybrid >= 0 && monohybrid < 25) {tempGenotype = 0;} 
              else if (monohybrid >= 25 && monohybrid < 76) {tempGenotype = 1;}
              else {tempGenotype = 2;}
              grid2[x][y] = new Cell(x*width/cols,y*height/rows,width/cols,height/cols,tempGenotype);}
            else {
              progenyChoice = int(random(1, 3)); 
              grid2[x][y] = new Cell(x*width/cols,y*height/rows,width/cols,height/cols,progenyChoice);}   
            break;
            
            case 2:
            if (choice2 == 0) {grid2[x][y] = new Cell(x*width/cols,y*height/rows,width/cols,height/cols, 1);}
            else if (choice2 == 1) {
              progenyChoice = int(random(1, 3));
              grid2[x][y] = new Cell(x*width/cols,y*height/rows,width/cols,height/cols,progenyChoice);}
              
            else {grid2[x][y] = new Cell(x*width/cols,y*height/rows,width/cols,height/cols, 2);}  
            break;
        }
      }
    }  
    
void draw() {
  background(255);
  counter = counter + 1;
  println(counter);
  for (int i = 0; i < cols; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {
      // Display each cell
//      println(grid2[i][j].genetics());
      grid2[i][j].genetics();
      grid2[i][j].display();
    }
  }
  grid = grid2;
  reproduction();
}

void keyReleased()
{
  // +/- used to adjust gain on the fly
  if (key == 'q' || key == 'Q') {
    noLoop();
  } else if (key == 'w' || key == 'W') {
    loop();
  }
}
// A Cell object

class Cell {

  // A cell object knows about its location in the grid as well as its size with the variables x, y, w, h.
  float x,y;   // x,y location
  float w,h;   // width and height
  int genotype; // angle for oscillating brightness
  float[] phenotype = new float[3]; //colour(phenotype) of the cell depends on genotype
  
  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, int tempGenotype) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    genotype = tempGenotype; 
  }
  
  // Establish colour on the basis of genotype
  int genetics() {
    switch(genotype) {
  case 0: 
    phenotype[0] = 255.0; // HOMOZYGOUS DOMINANT = YELLOW
    phenotype[1] = 255.0;
    phenotype[2] = 0.0;
    break;
  
  case 1: 
    phenotype[0] = 255.0;          // HETEROZYGOUS = ORANGE
    phenotype[1] = 135.0;
    phenotype[2] = 0.0;
    break;
  
  case 2: 
    phenotype[0] = 255.0; // HOMOZYGOUS RECESSIVE = RED
    phenotype[1] = 0.0;
    phenotype[2] = 0.0;
    break;
    }
    return genotype;
 }
  
  void display() {
    stroke(0);
    // Color should be calculated on the basis of genotype
    fill(phenotype[0], phenotype[1], phenotype[2]);
    rect(x,y,w,h);
  }
}


