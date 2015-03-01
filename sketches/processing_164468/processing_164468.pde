


int owlX = 100;
int owlY = 100;
int owlWeight = 100; //how large is the owl
int owlSize = owlWeight/3; //how long he is
int eyeSize = owlWeight/2; //size of the eye
int eyeCenterSize = owlWeight/8; //the black part of the eyes size
int noseSize = 4; //size of the nose

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(204);

  drawOwl(200, 100, 100, 40);
  drawOwl(50, 76, 30, 20);
  drawOwl(350, 300, 150, 70);
}

void drawOwl(int x, int y, int owlWeight, int owlSize) {
  drawBody(x, y, owlWeight, owlSize); //draw the bold part of the body
  drawChin(x, y, owlWeight);  //draws the chin 
  drawEyes(x, y, owlWeight);  //draw both eyes and back part of the eyes
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


void drawEyes(int x, int y, int size) {
  noStroke();
  fill(255);
  ellipse(x-size/4, y-size/4, size/2, size/2); // Left eye dome
  ellipse(x+size/4, y-size/4, size/2, size/2); // Right eye dome
  fill(0);
  ellipse(x-size/4, y-size/4, size/8, size/8); // Left eye same X Y placement coordinates as the white eyes, but the size changes
  ellipse(x+size/4, y-size/4, size/8, size/8); // Right eye same as left eyes.
}



