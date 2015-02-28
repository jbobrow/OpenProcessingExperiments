
int SOUTH = 0;
int EAST = 1;
int NORTH = 2;
int WEST = 3;
int direction = NORTH;
int x,y;

color ON = color(0,50);
color OFF = color(0,0);

void setup() {
  size(500,500);
  x = 226;
  y = 224;
  PImage uncc;
  uncc = loadImage("uncc.jpg");
  background(uncc);
}

void draw() {
  if (direction == SOUTH) {
    y++;
    if (y == 465) {
      y = 63;
    }
  } 
  else if (direction == EAST) {
    x++;
    if (x == 364) {
      x = 103;
    }
  } 
  else if (direction == NORTH) {
    if (y == 63) {
      y = 465-1;
    } 
    else {
      y--;
    }
  } 
  else if (direction == WEST) {
    if (x == 103) {
      x = 364-1;
    } 
    else {
      x--;
    }
  }

  if (get(x,y) == ON) {
    set(x,y,OFF);
    if (direction == SOUTH) {
      direction = WEST;
    } 
    else {
      direction--;
    }
  } 
  else {
    set (x,y,ON);
    if (direction == WEST) {
      direction = SOUTH;
    } 
    else {
      direction++;
    }
  }
}


