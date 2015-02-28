
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
int result;
float x,y;
 
void setup() {
  size(400,400);
  frameRate(100);  
  result = 0;
  x = width/2;
  y = height/2;
}
 
void draw() {
  background(0);
  switch(result) {
    case NORTH: y--; break;
    case EAST: x++; break;
    case SOUTH: y++; break;
    case WEST: x--; break;
    case NORTH|EAST: y--; x++; break;
    case NORTH|WEST: y--; x--; break;
    case SOUTH|EAST: y++; x++; break;
    case SOUTH|WEST: y++; x--; break;

 }
 fill(random(0,255),random(0,255),random(0,255));
 rect(x,y,50,50);
 fill(#ffffff);
 rect(0,0,400,50);
 fill(#ffffff);
 rect(0,350,400,60);
 fill(#ffffff);
 rect(0,90,100,60);
 fill(#ffffff);
 rect(0,180,100,60);
 fill(#ffffff);
 rect(0,270,100,60);
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


