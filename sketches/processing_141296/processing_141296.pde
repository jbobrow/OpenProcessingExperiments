
int savedTime;
int waitForIt = 8000;
int colorMeKaren = 750;
boolean b = false;
PImage colorcupcake;
PImage graycupcake;
int x = 200;
int y =100;
PFont font;
void setup() {
  size(600, 600);
  colorcupcake = loadImage("cupcakergb.png");
  graycupcake = loadImage("cupcakegray.png");
  background(100, 80, 0);
  noCursor();
  savedTime=millis();
}

void draw() {
  PImage img;
  if(mousePressed){
    img = colorcupcake;
  }else{
    img = graycupcake;
  }
  image(img,x,y);

  int x = int(random(255));
  int y = int(random(255));
  int z = int(random(255));
  int passedTime = millis() - savedTime;
  while(!b){
    textSize(32);
    background(100, 0, 0);
    image(graycupcake,200,100);
    passedTime = millis() - savedTime;
    if(passedTime > waitForIt){
      b = true;
    }
  }
  if(passedTime > colorMeKaren){
    background(x, y, z);
    savedTime = millis();
    textSize(18);

    text("See, grayscale is too boring for you", 30,40);
    text("Click to color in your world!", 60,60);
    
  }
}

void mouseDragged() {
  x = mouseX;
  y = mouseY;
  textSize(12);
  text("(Sorry they're not Tie-Dye)", 60,520);
}


