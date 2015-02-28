
/*
Paul Shen
ISTA 301
03/04/13

Starts with a column of 30 "DNA" horizontal strips of five
randomly colored squares.  Simulates reproduction between each
distinct adjacent pairs of parent strips by creating a child
strip for each parent in the next column with the process:
(1) copy the squares ("genes") from parent to child
(2) randomly choose a crossover point
(3) swap the squares of the children after the crossover point
(4) assign a new random color to a randomly choosen square in each
    child
    
This reproductive cycle is repeated for a total of 15 generations.
*/

ArrayList strips;
int currX = 0;
static int genSize = 10;

void setup() {
  //size((genSize*5+2)*15, (genSize+2)*30);
  size(780, 360);
  background(255);
  
  // Create initial column of strips
  strips = new ArrayList();
  for (int i = 0; i < (height-genSize); i+=(genSize+2)) {
    color[] tmpColor = 
      { color(random(255), random(255), random(255)),
        color(random(255), random(255), random(255)),
        color(random(255), random(255), random(255)),
        color(random(255), random(255), random(255)),
        color(random(255), random(255), random(255)) };
    
    strips.add(new GenStrip(0, i, tmpColor));
  }
}

void draw() {
  // Draw current column of strips
  int i;
  for (i = 0; i < strips.size(); i++) {
     GenStrip strip = (GenStrip) strips.get(i);
     strip.update();
  }
  
  // Generate two children for each distinct pair of adjacent
  // strips
  int j;
  currX += genSize*5+2;
  for (i = 0; i < strips.size(); i+=2) {
    // Crossover the colors of the parents after a random point
    int crossover = (int) random(5);
    color[] p1 = ((GenStrip) strips.get(i)).getColors();
    color[] p2 = ((GenStrip) strips.get(i+1)).getColors();
    color[] c1 = new color[5];
    color[] c2 = new color[5];
    for (j = 0; j < crossover; j++) {
      c1[j] = p1[j];
      c2[j] = p2[j];
    }
    for (j = crossover; j < 5; j++) {
      c1[j] = p2[j];
      c2[j] = p1[j];
    }
    
    // Randomly mutate one square's color in each child
    c1[(int) random(5)] = color(random(255), random(255), random(255)); 
    c2[(int) random(5)] = color(random(255), random(255), random(255));
    
    strips.remove(i+1);
    strips.remove(i);
    strips.add(i, new GenStrip(currX, i*(genSize+2), c1));
    strips.add(i+1, new GenStrip(currX, (i+1)*(genSize+2), c2));
  }
}

// A horizontal strip of five colored squares ("genes")
class GenStrip {
  int x, y;
  color[] colors = new color[5];
  
  GenStrip(int x, int y, color[] colors) {
    this.x = x;
    this.y = y;
    this.colors = colors;
  }
  
  void update() {   
    rectMode(CORNERS);
    for (int i = 0; i < colors.length; i++) {
      fill(colors[i]);
      rect(x + genSize*i, y, x + genSize*i + genSize, y+genSize);
    }
  }
  
  color[] getColors() {
    return colors;
  }
}
  


