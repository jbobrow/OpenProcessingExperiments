
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
int result;
float mx,my;

int speed=7; //speed of tank
int[] xpos = new int[50]; 
int[] ypos = new int[50];
 
 
void setup() {
  size(512,512);
  frameRate(60);  
  result = 0;
  mx = width/2;
  my = height/2;
  smooth();
  // Initialize all elements of each array to zero.
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
}
 
void draw() {
  background(0);
  ellipseMode(CENTER);
  rectMode(CENTER);
  switch(result) {
    case NORTH: my=my-speed; break;
    case EAST: mx=mx+speed; break;
    case SOUTH: my=my+speed; break;
    case WEST: mx=mx-speed; break;
    case NORTH|EAST: my=my-speed; mx=mx+speed; break;
    case NORTH|WEST: my=my-speed; mx=mx-speed; break;
    case SOUTH|EAST: my=my+speed; mx=mx+speed; break;
    case SOUTH|WEST: my=my+speed; mx=mx-speed; break;
  }
  
    for (int i = 0; i < xpos.length-1; i ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  // New location
  xpos[xpos.length-1] = mouseX; // Update the last spot in the array with the mouse location.
  ypos[ypos.length-1] = mouseY;
  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    fill(0+i*4);
    ellipse(xpos[i],ypos[i],i,i);
  }
  fill(255);
//  rect(mx-50,my-50,15,15);
//  rect(mx+50,my-50,15,15);
//  rect(mx-50,my+50,15,15);
//  rect(mx+50,my+50,15,15);
  //ellipse(mx,my,7,7);
  stroke(255);
  strokeWeight(1);
  line(mx,my-7,mx,my-55);
  line(mx+7,my,mx+55,my);
  line(mx-7,my,mx-55,my);
  line(mx,my+7,mx,my+55);
  noFill();
  ellipse(mx,my,25,25);
  strokeWeight(3);
  ellipse(mx,my,100,100);
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

