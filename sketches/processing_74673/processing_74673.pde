
PImage lefteyeclosed;
PImage lefteyeopen;
PImage righteyeclosed;
PImage righteyeopen;
PImage mouthclosed;
PImage mouthopen;
PImage handdraw;

ArrayList<Integer> pencilX = new ArrayList<Integer>();
ArrayList<Integer> pencilY = new ArrayList<Integer>();
ArrayList<Integer> pencilActive = new ArrayList<Integer>();

void setup() {
  size(383, 383, P2D);
  smooth();
  handdraw= loadImage("hand.png");
  righteyeopen=loadImage("righteyeopen.png");
  righteyeclosed=loadImage("righteyeclosed.png");
  lefteyeopen=loadImage("lefteyeopen.png");
  lefteyeclosed=loadImage("lefteyeclosed.png");
  mouthopen=loadImage("mouthopen1.png");
  mouthclosed=loadImage("mouthopen.png");

  background(255);
}


void draw() {


  if (mouseX>148 && mouseX<238 && mouseY<334 && mouseY>291) {
    image(mouthopen, 0, height-160);
  }
  else {
    image(mouthclosed, 0, height-160);
  }

  if (mouseX>101 && mouseY>163 && mouseX<160 && mouseY<193) {
    image(lefteyeclosed, 0, 0);
  }
  else {
    image(lefteyeopen, 0, 0);
  }

  if (mouseX>219 && mouseY>163 && mouseX<277 & mouseY<195) {
    image(righteyeclosed, width/2, 0);
  }
  else {
    image(righteyeopen, width/2, 0);
  }


  if (mousePressed) {
    stroke(0);
    strokeWeight(2);

    pencilX.add(int(mouseX));
    pencilY.add(int(mouseY));
  }

  if (mousePressed) {
    //noCursor();
    stroke(0);
    strokeWeight(2);
        copy(mouseX-20, mouseY-20, 40, 40, mouseX-45, mouseY-45, 90, 90);
    noFill();
    stroke(0);
    strokeWeight(2);
    rect(mouseX-45,mouseY-45,90,90);
    //image(handdraw, mouseX-18, mouseY-99);

  }
  else {
    cursor();
  }


}



