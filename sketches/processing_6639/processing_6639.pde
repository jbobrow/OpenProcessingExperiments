
int[][][] population;
int species = 11;
int gridsize = 256;
int page = 0;

public void setup() {
  size(512, 512, P2D);
  colorMode(HSB, 255);
  population = new int[2][gridsize][gridsize];
  initialize();
  noStroke();
}

void initialize() {
  for (int x=0; x<gridsize; x++) {
    for (int y=0; y<gridsize; y++) {
      population[page][x][y] = (int)random(species);
    }
  }
}

public void draw() {
  updatePopulation();
  drawPopulation();
}

// we populate the grid with random species, 
// each specie is a prey of the previous one, and is a predator of the next one.
// the top predator is eaten by the lowest prey (like lions been eaten by bacterias) creating a food chain
// if there is a predator in the neighbourhood, the current location is goint to be replaced by the predator
// the mouse change the probability of the food chain direction
public void updatePopulation() {
  float d = (float)mouseX/(float)width;
  for (int y=0; y<gridsize; y++) {
    for(int x=0; x<gridsize; x++) {
      // wrap the grid
      int n = y-1 < 0 ? gridsize-1 : y-1;
      int s = y+1 > gridsize-1 ? 0 : y+1;
      int e = x-1 < 0 ? gridsize -1 : x-1;
      int w = x+1 > gridsize-1 ? 0 : x+1;

      int specie = population[page][x][y];
      int predator = random(1) > d ? 
      /*forward*/(specie + 1 > species-1 ? 0 : specie + 1) :
      /*backward*/(specie - 1 < 0 ? species-1 : specie - 1); 

      population[page^1][x][y] = ((population[page][x][n] == predator) ||
        (population[page][x][s] == predator) ||
        (population[page][e][y] == predator) ||
        (population[page][w][y] == predator)) ? predator : specie;  
    }
  }
  page ^= 1;
}

void drawPopulation() {
  int row = 0;
  for (int y=0; y<gridsize; y++) {
    for (int x=0; x<gridsize; x++) {
      int specie = population[page][x][y]*25;
      fill(specie,255,255-specie,16);
      rect(x*2,y*2,2,2);
    }
    row += width;
  }
} 

public void mousePressed() {
  initialize();
}



