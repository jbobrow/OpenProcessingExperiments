
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


//image(lefteyeopen, 0, 0);
//image(righteyeopen, width/2, 0);
//image(mouthopen, 0, height-160);

if (mouseX>148 && mouseX<238 & mouseY<334 && mouseY>291) {
  image(mouthclosed, 0, height-160);
}
else {
  image(mouthopen, 0, height-160);
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



boolean check = true;
for (int i = 1; i < pencilX.size()-1; i++) {
  check = true;
  for (int x = 0; x < pencilActive.size(); x++) {
    if(i == pencilActive.get(x)){
      check = false;
    }
  }

  if(check){
    line(pencilX.get(i-1), pencilY.get(i-1), (float)pencilX.get(i), (int)pencilY.get(i));
  }
}

if (mousePressed) {
  noCursor();
  image(handdraw, mouseX-18, mouseY-99);
}
else {
  cursor();
}

}

void mouseReleased() {
pencilActive.add(pencilX.size());
}

