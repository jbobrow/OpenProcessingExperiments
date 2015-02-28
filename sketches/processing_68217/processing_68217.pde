
int xPos;
int yPos;

int wRect;
int hRect;

PFont myFontPixelizer;
PFont myFontPixelizer2;
int  fontPosX = 30;
int fontPosY = 30;
color pixelColor;

//boolean gridOn;
int saveP = 1;

//color = pixelColor;

PImage myImage; 
PImage myImage1;
PImage temp;


void setup() {
  size(650, 650);
  myImage = loadImage("colorpalette.jpeg");
  myImage1 = loadImage("mario.png");
  frame.setTitle("|| Pixelizer v1.2 ||");
  frame.setLocationRelativeTo(null);
  smooth();
  pixelColor= myImage.get(mouseX, mouseY);
  myFontPixelizer= loadFont("GB18030Bitmap-48.vlw");
  //  gridOn = false;
  myFontPixelizer2= loadFont("GB18030Bitmap-14.vlw");
  smooth();
  background(255);
}

void draw() {
  //Title---------------------------------->
  image(myImage, 30, 310);
  image(myImage1, 30, 90);
  textFont(myFontPixelizer);
  text("Pixelizer", 30, 70);
  fill(pixelColor);
  //Define my variables and functions 
  //  mousePixel();
  instructions();

  //Get color------------------------------->
  if (keyPressed && key == 'c') {
    //  if (key == 'c') {
    pixelColor = myImage.get(mouseX - 30, mouseY - 310);
  }

  //Grid------------------------------------>
    for (int i = 0; i <= 400 ; i= i+20) {
      for (int j = 0; j <= 400 ; j= j+20) {
        rect(200+i, 200+j, 20, 20);
        stroke(0);
      }
    }
  }



void keyTyped() {

  if ( key == 's') {
    PImage temp = get(200, 200, 420, 420);
    temp.save("image"+saveP+".png");
    saveP++;
  }
}

void instructions() {
  noFill();
  textFont(myFontPixelizer2);
  text(" Use the Grid to draw Mario press 's' to save \n press 'c' on the color palette to get color \n mouse click on the center of \n each square to draw a pixel", 200, 100);
}

void mousePressed() {

  for (int i = 0; i < 620 ; i+=20) {
    for (int j = 0; j < 620; j+=20) {
      if (mouseX > i && mouseX <= i+20) {
        if (mouseY > j && mouseY <= j+20) {
          fill(pixelColor);
          rect(i, j, 20, 20);
        }
      }
    }
  }
}


