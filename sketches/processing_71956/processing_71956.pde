
Face myFace;
lionHead myLionHead;
lionHair myLionHair;
//PImage picture;

int selectedKey;

void setup() {
  size(800, 800);
  smooth();
  //colorMode(HSB,360,100,100,100);

  //picture = loadImage("image.jpg");
  myLionHead=new lionHead(370, 265, color(255, 0, 0), 8);
  myLionHair=new lionHair(250, 1, 55);
  myFace=new Face(340, 180, 14);
}


void draw() {
  //image(picture, 0, 0);
  background(255);
  translate(200, 200);
  noFill();
  myLionHead.display();
  myLionHair.display();
  myFace.display();
  myLionHair.moveHair(mouseX,mouseY);
  myLionHead.openMouth(selectedKey);
}

void keyPressed() {
  if (key=='1') {
    selectedKey = 1;
  }
  else if (key=='2') {
    selectedKey = 2;
  }
}


