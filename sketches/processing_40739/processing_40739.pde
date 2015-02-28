
Cell[] cells = new Cell[50];//number of cells being drawn

color c1, c2;// two different cell types being displayed

void setup() {
  size(300, 300);
  smooth();
  frameRate(15);

  for (int i=0; i< cells.length;i++) { //sets the color of the cells and seeds the Cell array
    c1 = color(int(random(255)), 30, 50);
    c2 = color(int(random(100)), 100, 50, 150);// fourth color to add transparency
    cells[i] = new Cell(c1, random(width), i*2, random(5));
    cells[i] = new Cell(c2, random(width), random(80), random(5));
  }
}

void draw() {

  background(147, 207, 247);//drawn here to cover up the trail otherwise left behind from the cells
  for (int i=0; i < cells.length; i++) {
    cells[i].move();
    cells[i].sketch();
  }
}

class Cell { //cell class to control the cells actions
  color c;
  float xcoord;
  float ycoord;
  float xspeed;

  Cell(color c_, float xcoord_, float ycoord_, float xspeed_) {
    c = c_;
    xcoord = random(width);// position on the screen is random, like cells appear to be
    ycoord = random(height);
    xspeed = random(-1, 1); // sets a random speed and direction to the cells
  }

  void move() {
    xcoord = xcoord + xspeed*random(-4, 4); //allows the cells to move 3 units in any direction each frome
    ycoord = ycoord + xspeed*random(-4, 4);
  }

  void sketch() {
    stroke(255); //white edge of the cells
    fill(c);
    ellipse(xcoord, ycoord, 30, 30);//sets the size of the cells diameter
    fill(255);
    ellipse(xcoord, ycoord, 5, 5); //sets the size of the cells nucleus
  }
}




