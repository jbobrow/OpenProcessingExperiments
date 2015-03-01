
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
int result;
float x,y;
 
void setup() {
  size(510, 510);
  frameRate(150);  
  background(255);
  result = 0;
  x = width/2;
  y = height/2;
}
 
void draw() {
  fill(x/2, 0, y/2, 20);
  rect(0, 0, width, height);
  
  switch(result) {
    case NORTH: if(y>0)y--; break;
    case EAST: if(x<width-10)x++; break;
    case SOUTH: if(y<height-10)y++; break;
    case WEST: if(x>0)x--; break;
    case NORTH|EAST: if(y>0)y--; if(x<width-10)x++; break;
    case NORTH|WEST: if(y>0)y--; if(x>0)x--; break;
    case SOUTH|EAST: if(y<height-10)y++; if(x<width-10)x++; break;
    case SOUTH|WEST: if(y<height-10)y++; if(x>0)x--; break;
  }
  fill(255);
  stroke(255);
  rect(x,y,10,10);
}
 
void keyPressed(){
  switch(key) {
    case('w'):case('W'):result |=NORTH;break;
    case('d'):case('D'):result |=EAST;break;
    case('s'):case('S'):result |=SOUTH;break;
    case('a'):case('A'):result |=WEST;break;
  }
}
 
void keyReleased(){  
  switch(key) {
    case('w'):case('W'):result ^=NORTH;break;
    case('d'):case('D'):result ^=EAST;break;
    case('s'):case('S'):result ^=SOUTH;break;
    case('a'):case('A'):result ^=WEST;break;
  }
}

