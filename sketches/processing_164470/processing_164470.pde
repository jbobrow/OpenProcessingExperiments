
int cellSize = 25;
boolean owlType = true;
int owlX = cellSize/2;
int owlY = cellSize/2;
int owlWeight = 17;
int owlSize = 10;

void setup() {
  size(500, 500);
  smooth();
  noLoop();
}

void draw() {
  background(204);
  stroke(0);
  strokeWeight(1);
  fill(255);
  
  
  for (int j = 1; j < height; j = j + cellSize) { //draws a row
  for (int i = 1; i < width; i = i + cellSize) { //draws a column
  
    owlType = !owlType; //changes the owlType everytime the loops draws
    
    stroke(0); //making sure the draw type is ok
    strokeWeight(1); //making sure the draw type is ok
    fill(255); //making sure the draw type is ok
    
    rect(j-1, i-1, cellSize, cellSize);//draws the actual square
    drawOwl(owlX+j-1, owlY+i-1, owlWeight, owlSize, owlType); //draws the owl
  }
 owlType = !owlType; //eachtime the colums draws, it makes sure to switch the owl type
}
}


void drawOwl(int x, int y, int owlWeight, int owlSize, boolean eyeType) {
  drawBody(x, y, owlWeight, owlSize); //draw the bold part of the body
  drawChin(x, y, owlWeight);  //draws the chin 
  drawEyes(x, y, owlWeight, eyeType);  //draw both eyes and back part of the eyes
  drawBeak(x, y, owlSize/10);   //draws the beak
}


void drawBody(int x, int y, int owlWeight, int owlSize) {
  stroke(0);
  strokeWeight(owlWeight); //set the width of the owl
  line(x, y-owlSize/2, x, y+owlSize/2); // uses the x and Y coordinate to set the position and the size to give the hieght
}

void drawChin(int x, int y, int owlWeight) {
  noStroke();
  fill(255);  
  arc(x, y-owlWeight/4, owlWeight, owlWeight, 0, PI); // Chin -
}

void drawBeak(int x, int y, int noseSize) {
  noStroke();
  fill(0); 
  quad(x, y-noseSize*2, x-noseSize, y, x, y+noseSize*2, x+noseSize, y); // Beak - adjusted the Y value to get a losange
}


void drawEyes(int x, int y, int size, boolean eyeType) {
  noStroke();
  fill(255);
  ellipse(x-size/4, y-size/4, size/2, size/2); // Left eye dome
  ellipse(x+size/4, y-size/4, size/2, size/2); // Right eye dome
  fill(0);
  if (eyeType) {
    ellipse(x-size/4, y-size/4, size/8, size/8); // Left eye same X Y placement coordinates as the white eyes, but the size changes
    ellipse(x+size/4, y-size/4, size/8, size/8); // Right eye same as left eyes.
  } 
  else {
    stroke(0);
    strokeWeight(2);
    line(x-size/4-1, y-size/4, x-size/4+1, y-size/4);
    line(x+size/4-1, y-size/4, x+size/4+1, y-size/4);
  }
}



