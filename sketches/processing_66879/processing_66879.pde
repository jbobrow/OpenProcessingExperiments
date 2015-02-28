
PFont font1;

void setup() {
  size(400, 500);
  background(255);
  smooth();

  PImage treeIMG = loadImage("tree.jpg");
  imageMode(CENTER);
  image(treeIMG, width/2, height/2);
}


void leaf(int x, int y) { 
  int lfNumber = (int)random(10, 20); 
  for (int i = 0; i < lfNumber; i++) { 
    int lfX = (int)(x + random(-30, 30));
    int lfY = (int)(y + random(-30, 30)); 
    line(lfX, lfY, x, y);
  }
}

void mouseReleased() {
  leaf(mouseX, mouseY);
}

void keyPressed() {
  if (key =='1') {
    fill(0);
    ellipse(mouseX, mouseY, 5, 5);
  }
  if (key =='2') {
    fill(0);
    ellipse(mouseX, mouseY, 10, 10);
  }
  if (key =='3') {
    fill(0);
    ellipse(mouseX, mouseY, 15, 15);
  }
  if (key =='4') {
    fill(0);
    ellipse(mouseX, mouseY, 20, 20);
  }
  if (key =='5') {
    stroke(0);
    noFill();
    ellipse(mouseX, mouseY, 30, 30);
  }
}

void mouseClicked() {
  if (mouseX <= 50 && mouseX >= 0 && mouseY <= 500 && mouseY >= 480) {
    background(255);
    PImage treeIMG = loadImage("tree.jpg");
    imageMode(CENTER);
    image(treeIMG, width/2, height/2);
  }
}

void draw() {
  fill(0);
  rect(0, 450, 500, 500);

  font1 = loadFont("BookshelfSymbolSeven-10.vlw");
  fill(125);
  textFont(font1);
  text("reset", 10, 490);

  font1 = loadFont("BookshelfSymbolSeven-10.vlw");
  fill(125);
  textFont(font1);
  text("click to create leaves || draw circles = press 1, 2, 3, 4 or 5", 108, 490);
}

