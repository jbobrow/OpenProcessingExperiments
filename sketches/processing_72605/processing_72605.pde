
int counter;

//Chandler Archbell
//Introduction to Digital Media Fall 2012
//Section B
//Due 9.13.12


float xoff = 0.0; //for noise function

//definiing variables
int randomRed = 0;
int randomGreen = 0;
int randomBlue = 0;
float randomDiameter = 0;
boolean boolGrowing = false;
int growingDiameter = 0;


void setup() {

  size(1200, 600);
  background(0);
}

void draw() {


  //this makes the background change colors
  randomRed = int(random(255));
  randomGreen = int(random(255));
  randomBlue = int(random(255));
  fill(randomRed, randomGreen, randomBlue, 60);
  rect(0, 0, width, height);


  //series of lines that follow the mouse
  for (int i=0; i<1200; i++) {
    strokeWeight(1);
    stroke(0, 255, 0);
    line(mouseX, mouseY, 3*i, 2*i);
    stroke(155, 0, 0);
    line(width-3*i, height-2*i, mouseX, mouseY);
    stroke(255, 255, 0);
    line(width, height-2*i, mouseX, mouseY);
  }

  //noise function
  strokeWeight(.42);

  for (int x=0; x < width; x++) {

    float noiseVal = noise((mouseX+x),
    mouseY);
    stroke(0);
    line(x, mouseY+noiseVal*200, 1.5*x, height);
  }
  randomRed = int(random(255));
  randomGreen = int(random(255));
  randomBlue = int(random(255));


  fill(randomRed, randomGreen, randomBlue);
  triangle(mouseX-50, mouseY, mouseX, mouseY+200, mouseX+50, mouseY);
  triangle(mouseX-50, mouseY, mouseX, mouseY-200, mouseX+50, mouseY);
  triangle(mouseX-200, mouseY, mouseX, mouseY-50, mouseX, mouseY+50);
  triangle(mouseX+200, mouseY, mouseX, mouseY-50, mouseX, mouseY+50);

  fill(randomRed, randomGreen+50, randomBlue+100);
  ellipse(mouseX, mouseY, 100, 100);



  randomDiameter = random(200);
  ellipse(mouseX, mouseY, randomDiameter, randomDiameter);

  if (boolGrowing == true) {
    if (growingDiameter < 200) {
      growingDiameter++;
    }
    else {
      growingDiameter = 0;
    }
  }
}

void mouseClicked() {

  stroke(255, 255);
  strokeWeight(6);
  for (int y=0; y<1200; y++) {
    line(0, y*9, 1200, y*9);
    line(y*9, 0, y*9, 600);
  }

if (boolGrowing == true) {
  if (randomRed <= 255) {
  randomRed++;
  }
  else {
    randomRed = 255;
  }
  if (randomGreen <= 255) {
    randomGreen++;
  }
  else {
    randomGreen = 255;
  }
  if (randomBlue <= 255) {
    randomBlue++;
  }
  else {
    randomBlue = 255;
  }
}



}
