
PImage img;
String hate;
String love;
PFont font;
float i, j;

void setup() {
  size(1200, 600);
  img = loadImage("e2EVK.png");
  font = loadFont("LostWages-48.vlw");
}

void draw() {
  noStroke();
  imageMode(CENTER);
  image(img, width/3, height/3);
  hate = "HATE";
  love = "LOVE";
  fill(i, j, i);
  //textMode(CENTER);
  textFont(font);
  textSize(73);
  text(hate, 300, 170);
  fill(j, i, j);
  textSize(100);
  text(love, 630, 430);
}

void mouseClicked() {
  i = random(255);
  j = random(255);
}
  


