
float xPos; //we will use a variable to hold the position of the mouse, here the x value
float yPos; //and here, the y value. We use variable, becasue the value is being updated
            //with every draw() loop

color bg = color(234, 89, 90); //here we use a color variable to hold the bg color

void setup() {
  size(500, 500); // size here . . .
  background(bg); //and we set the background color
}

void draw() {
  fill(bg, 20); //we will fill a slightly transparent rect over the canvas
  rectMode(CORNER); //we must call CORNER since we changed it in the function below
  rect(0, 0, width, height); //and draw it
  xPos = mouseX; //update xPos
  yPos = mouseY; //and yPox
  noStroke(); //remove the stroke
  drawEllipse(xPos, yPos, 40); //call our functions
  drawEllipse(xPos - 50, yPos - 50, 40); //make some changes, call again
  drawEllipse(xPos - 50, yPos + 50, 40); //etc.
  drawEllipse(xPos + 50, yPos + 50, 40);
  drawEllipse(xPos + 50, yPos - 50, 40);
}


void drawEllipse(float x, float y, float size) { // our function
  fill(56, 255, 90);
  ellipse(x, y, size, size);
  fill(255); //this fill will effect everything after it
  rectMode(CENTER);
  rect(x, y, size/5, size/5);
}

//this one is full of fun little traps dealing with precedence of functions . . .

