
PImage goldfish;
float fishPosX;
float fishPosY;
color waterFill;
float rgbChangeG;
PFont f;
float textPosX;

void setup() {
  size (600, 600);
  background(132, 255, 240);

  goldfish = loadImage("goldfish.png");
  fishPosX = 500;
  fishPosY = 300;
  textPosX = 500;
  f = createFont("Arial", 200, true);
}

void draw() {
  background(132, 255, 240);

  //waterFill = color(132*sin(frameCount*.01), 255, 240);

  rgbChangeG = map(mouseX, 0, 600, 200, 245);

  //rectangles for background
  fill(132*sin(frameCount*.01), rgbChangeG, 240);
  noStroke();
  rect(0, 0, 75, 600);
  fill(132*sin(frameCount*.01 + .1), rgbChangeG + 5, 240);
  rect(325, 0, 70, 600);
  fill(132*sin(frameCount*.02 + .1), rgbChangeG - 5, 240);
  rect(415, 0, 70, 600);
  fill(132*sin(frameCount*.03 + .1), rgbChangeG + 10, 240);
  rect(260, 0, 50, 600);
  fill(132*sin(frameCount*.04 + .1), rgbChangeG - 10, 240);
  rect(100, 0, 150, 600);
  fill(132*sin(frameCount*.05 + .1), rgbChangeG, 240);
  rect(500, 0, 100, 600);

  textFont(f, 200);
  textAlign(CENTER);
  fill(255);
  text("FISHY", textPosX + random(25), random(50) + 300);

  //conditional to reset text pos when offscreen
  if (textPosX > - 700) {
    textPosX = textPosX - 10;
  } else {
    textPosX = 800;
  }

  //pushmatrix to rotate fish
  pushMatrix();
  translate(fishPosX, fishPosY + 300);
  rotate(radians(sin(frameCount*.05))*10);
  imageMode(CENTER);
  image(goldfish, 10, 0, 150, 100);
  popMatrix();

  //conditional to reset posX when offscreen
  if (fishPosX > -500) {
    fishPosX = fishPosX - 2;
  } else {
    fishPosX = 700;
  }

  //sin wave for posY
  fishPosY = (sin(frameCount*.05)*30);
}



