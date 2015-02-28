
//load coffee images
PImage birch;
PImage bluebottle;
PImage gimme;
PImage kahve;
PImage kava;
PImage konditori;
PImage lacolombe;
PImage stumptown;
PImage thinkcoffee;
PImage wwyl;

//load font
PFont edmondsans;

//declare variables for the button Birch
int bttnBirchX;
int bttnBirchY;
int bttnBirchSize;
int hoverBttnBirch;
boolean bttnBirch;

//declair variables for the button Bluebottle
int bttnBluebottleX;
int bttnBluebottleY;
int bttnBluebottleSize;
int hoverBttnBluebottle;
boolean bttnBluebottle;

//declair variables for the button Gimme
int bttnGimmeX;
int bttnGimmeY;
int bttnGimmeSize;
int hoverBttnGimme;
boolean bttnGimme;

//declair x to increasing numbers
int x;
void setup() {
  colorMode(HSB, 255);
  wwyl = loadImage ("wwyl.jpg");
  //first coffee shop - birch
  birch = loadImage ("birch.jpg");
  bluebottle = loadImage ("bluebottle.jpg");
  gimme = loadImage ("gimme.jpg");
  edmondsans = loadFont ("Edmondsans-Bold-20.vlw");
  x=0;
  size (500, 500);

  //button birch
  bttnBirchX = 10;
  bttnBirchY = 10;
  bttnBirchSize = 20;
  bttnBirch = false;

  //second coffee shop - blue bottle
  bluebottle = loadImage ("bluebottle.jpg");

  //button blue bottle 
  bttnBluebottleX=10;
  bttnBluebottleY = bttnBirchY+bttnBirchSize+5;
  bttnBluebottleSize = 20;
  bttnBluebottle = false;

  //button Gimme
  bttnGimmeX = 10;
  bttnGimmeY = bttnBirchY+bttnBirchSize+bttnBluebottleSize+10;
  bttnGimmeSize = 20;
  bttnGimme = false;
}

void draw() {
  background (wwyl);

  //button set up - birch
  if (bttnBirch == true) {
    image (birch, 0, 0);
  }

  //button set up - bluebottle
  if (bttnBluebottle == true) {
    image (bluebottle, 0, 0);
  }

  //button set up - gimme
  if (bttnGimme == true) {
    image (gimme, 0, 0);
  }

  if (mouseX > bttnBirchX && mouseX < bttnBirchX+bttnBirchSize &&
    mouseY >bttnBirchY && mouseY < bttnBirchY+bttnBirchSize) {
    hoverBttnBirch = 5;
  }
  else {
    hoverBttnBirch = 0;
  }
  strokeWeight (hoverBttnBirch);
  stroke (#FF2802); 


  if (bttnBirch == true) {
    fill (#945500);
    rect(bttnBirchX, bttnBirchY, bttnBirchSize, bttnBirchSize);
  }
  else {
    fill (#C4AB88);
    rect(bttnBirchX, bttnBirchY, bttnBirchSize, bttnBirchSize);
  }

  if (mouseX > bttnBluebottleX && mouseX < bttnBluebottleX+bttnBluebottleSize &&
    mouseY >bttnBluebottleY && mouseY < bttnBluebottleY+bttnBluebottleSize) {
    hoverBttnBluebottle = 5;
  }
  else {
    hoverBttnBluebottle = 0;
  }
  strokeWeight (hoverBttnBluebottle);
  stroke (#FF2802); 


  if (bttnBluebottle == true) {
    fill (#945500);
    rect(bttnBluebottleX, bttnBluebottleY, bttnBluebottleSize, bttnBluebottleSize);
  }
  else {
    fill (#C4AB88);
    rect(bttnBluebottleX, bttnBluebottleY, bttnBluebottleSize, bttnBluebottleSize);
  }

  if (mouseX > bttnGimmeX && mouseX < bttnGimmeX+bttnGimmeSize &&
    mouseY >bttnGimmeY && mouseY < bttnGimmeY+bttnGimmeSize) {
    hoverBttnGimme = 5;
  }
  else {
    hoverBttnGimme = 0;
  }
  strokeWeight (hoverBttnGimme);
  stroke (#FF2802); 


  if (bttnGimme == true) {
    fill (#945500);
    rect(bttnGimmeX, bttnGimmeY, bttnGimmeSize, bttnGimmeSize);
  }
  else {
    fill (#C4AB88);
    rect(bttnGimmeX, bttnGimmeY, bttnGimmeSize, bttnGimmeSize);
  }
  fill (#FF2802);
  textFont(edmondsans);
  text(x, 160, 242);
  textSize (60);
  x++;
}


//mouse clicked
void mouseClicked() {
  if (mouseX > bttnBirchX && mouseX < bttnBirchX+bttnBirchSize &&
    mouseY >bttnBirchY && mouseY < bttnBirchY+bttnBirchSize) {
    bttnBirch = !bttnBirch;
      
  }

  if (mouseX > bttnBluebottleX && mouseX < bttnBluebottleX+bttnBluebottleSize &&
    mouseY >bttnBluebottleY && mouseY < bttnBluebottleY+bttnBluebottleSize) {
    bttnBluebottle = !bttnBluebottle;
  }
  if (mouseX > bttnGimmeX && mouseX < bttnGimmeX+bttnGimmeSize &&
    mouseY >bttnGimmeY && mouseY < bttnGimmeY+bttnGimmeSize) {
    bttnGimme = !bttnGimme;
  }

}




