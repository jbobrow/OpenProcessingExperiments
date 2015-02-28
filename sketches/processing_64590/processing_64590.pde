
//VARIABLES
PImage img1; 
PImage img2;
PImage img3;

float xPos1 = 210;
float xPos2 = 190;

float yPos1 = 340;
float yPos2 = 640;

float dirX = 3;



//MAIN SETUP
void setup() {

  size(1024, 768);
  noStroke();


  img1 = loadImage("file.png");
  img2 = loadImage("muelleimer.png");
  img3 = loadImage("Desktop.jpg");
}


//DRAW
void draw() {
  image(img3, 0, 0);

  //File

  image(img1, xPos1, yPos1);

  xPos1 = xPos1 - random(-3, 3);


  if (yPos1 > yPos2-100) {
    yPos1 = yPos1 - random(-100, 500);
    xPos1 = xPos1 - random(-30, 30);
  }

  if (yPos1 > yPos2-300) {
    yPos1 = yPos1 - random(-10, 20);
    xPos1 = xPos1 - random(-10, 10);
  }

  if (yPos1 > yPos2-300) {
    yPos1 = yPos1 - random(-2, 3);
    xPos1 = xPos1 - random(-5, 5);
  }



  if (xPos1 < 0 ) {
    xPos1 = 0;
  }

  if (xPos1 > width ) {
    xPos1 = width-30;
  }

  if (yPos1 < 0 ) {
    yPos1 = 0;
  }




  //Bin

  if (xPos2 > width-90 || xPos2 < 0) {

    dirX = dirX * - 1;
  }



  xPos2 = xPos2 + dirX;

  image(img2, xPos2, yPos2);

  if (mousePressed) {
    xPos2 = mouseX;
    yPos2 = mouseY;
  }

  if (yPos2 < 0 ) {
    yPos2 = 0;
  }

  if (yPos2 > height-115 ) {
    yPos2 = height -115;
  }
}


