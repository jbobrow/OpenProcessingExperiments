
//Wenda Lewis Teh
//Creative Computing Final project
//Draft 3

barGraph one = new barGraph(200, 1 ); //For bar graph
barGraph two = new barGraph(150, 2);
barGraph three = new barGraph(300, 3);

int num= 18;
PImage[] images = new PImage[num];
PFont font;
int mouseRange = 150;
float a;
float b;
float c;

PImage vinyl;
float rotation = 0;
PImage bieblove;
PImage heart;
PImage movehanddown;
PImage movehandup;
boolean on;
int blinkSpeed = 20;

void setup() {
  size(600, 600);
  background(255);
  for (int i = 0; i < num; i++) {
    images[i]= loadImage(i + ".png");
  }
  vinyl = loadImage("vinylspin.png");
  bieblove = loadImage("bieblove.png");
  heart = loadImage("heart.png");
  movehanddown = loadImage("paulmovinghandbase.png");
  movehandup = loadImage("paulmovinghand.png");
  font = createFont("Arial Rounded Bold.ttf", 100);
}

void draw() {
  for (int i = 0; i < 4; i++) {
    image(images[i], i*200, 0, 200, 200);
  }
  for (int i = 3; i < 6; i++) {
    image(images[i], (i-3)*200, 200, 200, 200);
  }
  for (int i = 5; i < 9; i++) {
    image(images[i], (i-6)*200, 400, 200, 200);
  }
  //Categories
  fill(132, 45, 97);
  textFont(font);
  textSize(20);
  textAlign(CENTER);
  if (dist(mouseRange, mouseRange, mouseX, mouseY) < 75) {
    text("Digital Music Sales", 100, 180);
  }
  if (dist(mouseRange*2, mouseRange, mouseX, mouseY) <75) {
    text("Radio", 315, 180);
  }
  if (dist(mouseRange*3, mouseRange, mouseX, mouseY) <75) {
    text("Justin Bieber", 510, 200);
  }
  if (dist(mouseRange, mouseRange*2, mouseX, mouseY) <75) {
    text("Vinyl", 115, 395);
  }
  if (dist(mouseRange*2, mouseRange*2, mouseX, mouseY) <75) {
    text("Adele", 310, 410);
  }
  if (dist(mouseRange*3, mouseRange*2, mouseX, mouseY) <75) {
    text("Compact Discs", 500, 380);
  }
  if (dist(mouseRange, mouseRange*3, mouseX, mouseY) <75) {
    text("Paul McCartney", 115, 590);
  }
  if (dist(mouseRange*2, mouseRange*3, mouseX, mouseY) <75) {
    text("Online Streaming", 310, 580);
  }
  if (dist(mouseRange*3, mouseRange*3, mouseX, mouseY) <75) {
    text("Recording Studio", 505, 590);
  }

  a = map(mouseX, 0, 600, 0, 3);
  b = map(mouseY, 0, 600, 0, 3);
  c = floor(a) + 3*floor(b);
  println(c);

  //to make the vinyl rotate
  pushMatrix();
  if ((mousePressed==true)&&(c==3)) {
    translate(115, 297);
    rotate(radians(rotation));
    image(vinyl, -97, -97, 200, 200);
    rotation+=8;
  }
  popMatrix();

  //to make hearts for bieb
  if ((mousePressed==true)&&(c==2)) {
    image(bieblove, 405, -20, 200, 200);
    if (frameCount % blinkSpeed == 0) {
      on = !on;
    }
    if (on) {
      image(heart, 405, 20);
    }
  }
  //to make paul wave his hand
  if ((mousePressed==true)&&(c==6)) {
    image(movehanddown, 10, 392, 200, 200);
    if (frameCount % blinkSpeed == 0) {
      on = !on;
    }
    if (on) {
      image(movehandup, 11, 391);
    }
  }
  //to make download bar
  if ((mousePressed==true)&&(c==0)) {
    fill(255);
    textSize(40);
    text(ceil(map(second(), 0, 59, 0, 100))+"%", 105, 100);
  }
  //to make bar graphs for vinyl

  //information display
  if (mousePressed==true) {
    image(images[floor(c)+9], 0, 0, 600, 600);
  }
  //for bar graph
  if ((mousePressed==true)&&(c==1)) {
    one.display();
    two.display();
    three.display();
  }
}

class barGraph {
  float yPos;
  float y;
  float easing;
  float a;
  float totalDistY;

  barGraph(int endY, int b) {
    yPos = 600;
    y = endY;
    easing = .1;
    a = b;
  }

  void display() {
    totalDistY = y - yPos;
    if (abs(totalDistY) > .1) {
      totalDistY *= easing;
      yPos = yPos + totalDistY;
    }
    fill(0);
    rectMode(CORNERS);
    rect(50*a, yPos, a*50 + 30, 600);
  }
}



