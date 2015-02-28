
//Carlyn Maw, January 2014
//Week 3 Boundries, Example 2
//The ball drops, what happens to it?

int ballY = 0;

void setup() { 
  size(480, 360); //cannot use constants in JavaScript mode.
  background(204);
}

void draw() {
  background(204);
  ellipse(width/2, ballY, 30, 30);
  ballY++;
}



