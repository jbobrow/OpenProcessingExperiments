
int x = 0; // x location of square
int y = 0; // y location of square

int speed = 0; // speed of square

int state = 0; // a variable to keep track of the squares's state
              // Depending on value of state, it will move either right, down, left or up

void setup() {
  size(200,200);
}
void draw() {
  background(0); // set background to Black
  fill(155);
  rectMode(CENTER);  
  rect(100,100,100,100); // draw island on racetrack
  noStroke(); // set no stroke (no outline around rectangle)
  fill(255,0,0); // set fill to red
  rect(x,y,10,10); // draw rectangle
  
  if (!mousePressed) { // If mouse not pressed the speed is equal to 1
  speed = 1; 
} else { // If the mouse is pressed the speed changes to 4
 speed = 4; 
}
if (!keyPressed) { // If a key isn't pressed nothing happens
} else {          // But if it is pressed the colour of the rectangle changes to green 
   fill(0,255,0);
  rect(x,y,10,10);
}
println("zooooommmm Im a racing car");
  if (state == 0) { // If the state is 0 move to the right
    x = x + speed;
    if (x > width-10) { // If, while the state is 0, it reaches the right side of the window, change the state to 1
      x = width-10;    // Logic repeats for all states
      state = 1;
    }
  } else if (state == 1) {
    y = y + speed;
    if (y > height-10) {
      y = height-10;
      state = 2;
  }
  }
  else if (state == 2) {
  x = x- speed;
  if (x < 0) {
    x = 0;
    state = 3;
}
} 
else if (state == 3) {
  y = y - speed;
  if (y < 0) {
    y = 0;
    state = 0;
  }
 }
}



