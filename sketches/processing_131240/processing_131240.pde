
//Carlyn Maw, January 2014
//Week 3 Boundries, Example 3
//The ball drops, what happens to it if it's position
//is determined by a byte instead of an int?

//WORKS DIFFERENTLY IN JAVA MODE AND JAVASCRIPT MODE.
//(no numeric types in javascript)

byte ballY = 0;

void setup() { 
  size(480, 360); //cannot use constants in JavaScript mode.
  background(204);
}

void draw() {
  background(204);
  ellipse(width/2, ballY+(height/2), 30, 30);
  ballY++;
}



