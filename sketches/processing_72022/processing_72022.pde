
float randomDiameter = 10;
int growingDiameter = 0;
int randomRed = 0;
boolean boolGrowing = false;

void setup() {

  size(1200, 600);
  background(255, 255, 255);
}

void draw() {

  //fill(255, 25);
  //rect(0, 0, width, height);
  smooth();
  randomRed = int(random(0, 255));
  fill(randomRed, 225, 23);

  randomDiameter = random(50);
  ellipse(mouseX, mouseY, randomDiameter, randomDiameter);

  if (boolGrowing) {
    if (growingDiameter < 100) {
      growingDiameter++;
    }
    else {
      growingDiameter = 0;
    }
  }
  rect(mouseX, mouseY, growingDiameter, growingDiameter);
  triangle(mouseX, mouseY, growingDiameter, growingDiameter, growingDiameter, growingDiameter);
}


void mouseClicked() {  // Saves a PNG file named "DanielHa.png"
  save("DanielHa.pde");
  rect(0, 0, 0, 0);
  if (boolGrowing ==false) {
    boolGrowing = true;
  }
  else {
    boolGrowing = false;
  }
}
