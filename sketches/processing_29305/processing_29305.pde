
/*
Blocks will cascade downwards and the player will click on groups of same-colored blocks to eliminate them, and the score will increase by the number of blocks eliminated squared.
If the player loses, the player will be taken to a "lost" screen where the player can choose to either restart the game or quit.
*/

int squareSize;
int next;
int timeDelay;
Location[] points;
Location[] level;
Square[] blocks;
color[] colors;
int[] blocksToKill;
int score = 0;
int time = 0;
boolean state = true;

//Sets up a board, the squares fill a 300x300 area, but an extra 70 height is alotted for the score text.
void setup() {
  stroke(255);
  size(300, 370);
  squareSize = 20;
  setVariables();
  background(0);
}
/*
Checks if the boolean is playing or lost, then draws the appropriate screen. 
If the state is playing, a new Square is created ever 50 milliseconds and falls down by the draws() method.
*/
void draw() {
  if (state == true) {
    background(0);
    if (millis() > next) {
      new Square();
      
      next = millis() + timeDelay;
    }
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].draws();
    }
    textSize(50);
    fill(255);
    text("Score: ", 0, 350);
    text(score, 200, 350);
  }
  if (state == false) {
    background(0);
    textSize(25);
    text("You lost,", 0, 210);
    text("Press any key to restart", 0, 240);
  }
}
/*
Sets all the variable values. Doing this in setup causes problems. Creates 225 location objects, which are contained in the points array.
*/
void setVariables() {
  timeDelay = 20;
  pickAColor();  
  blocks = new Square[0];
  points = new Location[0];
  level = new Location[0];
  for (int a = 0; a < 15; a++) {
    for (int b = 0; b < 15; b++) {
      new Location(a, b);
    }
  }
}

/*
Sets the size of colors array to 4, and fills it with 4 color values.
*/
void pickAColor() {
  colors = new color[4];
  colors[0] = color(51, 0, 255);
  colors[1] = color(51, 255, 255);
  colors[2] = color(102, 255, 102);
  colors[3] = color(204, 0, 204);
}

/*
Location call created so I can use Location methods on specific Square objects. Sets the color as a field. The square moves over horizontally by advancePlaces. 
Moves down by switchPlaces();
*/

class Square {
  Location call;
  int colorful = round(random(colors.length));
  Square() {
    if (colorful == 4) 
      colorful = colorful - 1;
    blocks = (Square[]) append (blocks, this);
    call = level[0];
    advanceplaces();
    call.marker = this;
    call.empty = false;
  }

  //Written myself
  void draws() {
    if (call != null) {
      stroke(153);
      fill(colors[colorful]);
      rect(call.x, call.y, squareSize, squareSize);
      call.switchPlace();
 
    }
  }
}

//Did not write myself, credits to Jean-no. Determines from where the square should fall.
void advanceplaces() {
  Location zero = level[0];
  level = (Location[]) subset (level, 1);
  level = (Location[]) append (level, zero);
}

//Location class. Stores the x and y values from where the Square should be created, and has an array of points that contains the locations of all Squares.
class Location {
  int x;
  int y;
  int col;
  int row;
  int[] neighbors;
  Square marker;
  boolean empty = true;
  Location(int c, int r) {
    col = c;
    row = r;
    x = c * squareSize;
    y = r * squareSize;
    neighbors = getNeighbors(c, r);
    points = (Location[]) append (points, this);
    if (r == 0) {
      level = (Location[]) append (level, this);
    }
  }

  //Sees if the square below the current square is empty, if so, swap. Also has the losing condition.
  void switchPlace() {
    int n = neighbors[4];
    int t = neighbors[3];
    if (n != -1) {
      Location p = points[n];
      if (p.empty) {
        empty = true;
        p.empty = false;
        p.marker = marker;
        marker.call = p;
        marker = null;
      } 
      else if (t == -1 && !p.empty) {
        if (n == 1 || n == 16 || n == 31 || n == 46 ||
          n == 61 || n == 76 || n == 91 || n == 106 
          ||n == 121 || n == 136 ||n == 151 || n == 166 ||
          n == 181 || n == 196 ||n == 211) {
          state = false;
        }
      }
    }
  }
}

//Did not write this myself, credits to Jean-no. Gets the indices of a block in points[].
int[] getNeighbors(int c, int r) {
  int[] neighbors = {
    (r) + (c) * 15, -1, -1, -1, -1
  };

  if (c > 0) {
    neighbors[1] = (r + (c-1) * 15);
  }
  if (c < (15 - 1)) {
    neighbors[2] = (r) + (c+1) * 15;
  }
  if (r > 0) {
    neighbors[3] = (r-1) + (c) * 15;
  }
  if (r < (15 - 1)) {
    neighbors[4] = (r+1) + (c) * 15;
  }
  return neighbors;
}

//Click a mouse, gets the location where you clicked and the color of that location, if it isn't null. Calls the recursive method purgeBlocks().

void mousePressed() {
  try {
    int z = floor(mouseX/20);
    int ya = floor(mouseY/20);
    int[] neigh = getNeighbors(z, ya);
    int n = neigh[0];
    Location l = points[neigh[0]];
    int colors = l.marker.colorful;
    purgeBlocks(n, colors);
  } 
  catch (NullPointerException e) {
    return;
  }
}

//Recursive method that goes through the neighbors of the point sent to you in mousePressed(), nullifies them, then goes through the neighbors of those neighbors, and so forth.
void purgeBlocks(int n, int colors) {
  int counter = 0;
  Location l = points[n];
  int current = 0;
  for (int i = 0; i < l.neighbors.length; i++) {
    if (l.neighbors[i] != -1) {
      Location d = points[l.neighbors[i]];
      if (d.empty == false && d.marker.colorful == l.marker.colorful) {
        d.empty = true;
        d.marker.call = null;
        purgeBlocks(l.neighbors[i], l.marker.colorful);
        current++;
      }
    }
    score += current * current;
  }
}

//For when you lose. Pressing a key reverses the game boolean.
void keyPressed() {
  if (state == false) {
    state = true;
    score = 0;
    time = 0;
    setup();
    draw();
  }
}


