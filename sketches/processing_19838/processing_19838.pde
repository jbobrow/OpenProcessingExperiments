
//variables
float posX,posY;
PFont fontserif;
PFont fontdec;

//background
void setup(){
  size(250,250);
  background(178,5,40, 60);
  fontserif =loadFont ("Vani-Bold-48.vlw");
  fontdec =loadFont ("Stencil-48.vlw");
  smooth();
}

void draw(){
  background(178,5,40, 60);
  frameRate (8);
  //moving text
  textFont (fontdec, random(50,2));
  fill(255, random(100));
  text("L", random (250), random (250));
  text("5", random (250), random (250));
  text("B", random (250), random (250));
  textFont (fontdec, random(50,5));
  fill(200, random(150));
  text("1", random (250), random (250));
  text("R", random (250), random (250));
  text("6", random (250), random (250));

    if (mousePressed){
      textFont(fontserif, 30);
        fill(0,120);
        posX=mouseX;
        posY=mouseY;
    noStroke();
    text("L5B 1R6", mouseX, mouseY);
    fill(0,50);
    text("L5B 1R6", pmouseX+2, pmouseY+2);
    text("L5B 1R6", pmouseX+3, pmouseY+3);
    }
}

