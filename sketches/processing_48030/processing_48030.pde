
//this program describes movement and population of land,  first a train line is established
// this trian moves back and forth while a road moves towards it constantly
// in places where the road touches other road it starts to collect it into purple city or town areas.


int SOUTH = 0; // Direction numbers with names
int EAST = 1; // so that the code self-documents
int NORTH = 2;
int WEST = 3;
float direction = NORTH;// Current direction of the road
int a;
int x, y; // road current position
color ON = color(250,0,0); // Color for an 'train,road' pixel
color OFF = color(200); // Color for an 'trainline' pixel
color FOO = color(100,0,200); // Color for an 'city' pixel
PImage ground;

void setup() {
  size(400,400);
  x = width / 4;  
  y = height / 2;  //starts train and road in the middle of the screen
   a = width / 4;  // places train around 1/4 of the way accross the screen
 ground = loadImage("ground.jpg");
  background(ground);   //image of unmolested ground
  frameRate(600000);  //fast framerate to speed up time
 
}

void draw() {
  if (direction == SOUTH) {  // 0 pixel moves south using a ++
    y++;
    if (y == height) {   //moves pixel back to 0
      y = 0;
    }
  } else if (direction == EAST) {  // 1 pixel moves east using a ++
    x++;
    if (x == width) {  //moves pixel back to 0
      x = 0;
    }
  } else if (direction == NORTH) {  // 1 pixel moves north using a --
    if (y == 0) {
      y = height - 1;
    } else {
      y--;
    }
  } else if (direction == WEST) {  // 1 pixel moves west using a --
    if (x == 0) {
      x = width - 1;
    } else {
      x--;
    }
  }
  if (get(x, y) == ON) {  //changes pixel color
    set(x, y, OFF);
    if (direction == SOUTH) {  //changes direction of pixel depending on pixel color
      direction = WEST;
    } else {
      direction--;  //changes direction
    }
  }
  else {
    set(x, y, ON);
    if (direction == WEST) {
      direction = SOUTH;
    } else {
      direction++; // changes direction
    }
  }
  
  
  //second set of variables representing the train
  
  if (direction == SOUTH) {
    y++;
    if (y == height) {
      y = 0;
    }
  } else if (direction == EAST) {
    a++;
    if (a == width) {
      a = 0;
    }
  } else if (direction == NORTH) {
    if (y == 0) {
      y = height - 1;
    } else {
      y--;
    }
  } else if (direction == WEST) {
    if (a == 0) {
      a = width - 1;
    } else {
      a--;
    }
  }
  if (get(a, y) == ON) {
    set(a, y, FOO);
    if (direction == SOUTH) {
      direction = WEST;
    } else {
      direction--;
    }
  }
  else {
    set(a, y, ON);
    if (direction == WEST) {
      direction = SOUTH;
    } else {
      direction++; // Rotate direction
    }
  }
}

