
PImage imgEgg;

PImage imgC1;
PImage imgC2;
PImage imgC3;
PImage imgC4;
PImage imgC5;

PImage imgK1;
PImage imgK2;
PImage imgK3;
PImage imgK4;
PImage imgK5;
PImage imgK6;

PImage imgB;
PImage imgDH;

int x;  //x grid
int y;  //y grid

void setup() {
  size (400, 520);
  smooth();
  imgEgg = loadImage("Egg.jpg");
  imgC1 = loadImage("C1.jpg");
  imgC2 = loadImage("C2.jpg");
  imgC3 = loadImage("C3.jpg");
  imgC4 = loadImage("C4.jpg");
  imgC5 = loadImage("C5.jpg");
  imgK1 = loadImage("K1.jpg");
  imgK2 = loadImage("K2.jpg");
  imgK3 = loadImage("K3.jpg");
  imgK4 = loadImage("K4.jpg");
  imgK5 = loadImage("K5.jpg");
  imgK6 = loadImage("K6.jpg");
  imgB = loadImage("B.jpg");
  imgDH = loadImage("dh.jpg");
  x = width/10;
  y = height/8;
}

void draw() {
  background(255);

  //trunk and branches
  fill(100, 62, 3);
  beginShape();
  vertex(0, height-y/2);
  bezierVertex(width/2-x, height-y/2, width/2+x, height, width-x, height-y/2);
  curveVertex(width-x, height-y/2);
  curveVertex(width-x, height-y/2);  
  curveVertex(width-3*x/2, y);
  curveVertex(0, y/4);
  curveVertex(0, y/4);
  vertex(0, 0);
  vertex(width, 0);
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

  //leaves
  //  fill(31, 165, 12);
  //  curve(4*x, height-y/2, 3*x, height-y/2, 5*x, height-3*y/2, 4*x, height);
  //  curve(4*x, height-3*y/2, 5*x, height-3*y/2, 3*x, height-y/2,  4*x, height-3*y/2);



//bottom branch
  if ((mouseX >= 0) && (mouseX < x) && (mouseY <= height) && (mouseY > height-y)) {
    imageMode(CORNER);
    image(imgEgg, 0, height-3*y/2, x, y);
  }

  if ((mouseX >= x) && (mouseX < 2*x) && (mouseY <= height) && (mouseY > height-y)) {
    imageMode(CORNER);
    image(imgC1, x, height-y, 2*x*.75, y*.75/2);
  }

  if ((mouseX >= 2*x) && (mouseX < 3*x) && (mouseY <= height) && (mouseY > height-y)) {
    imageMode(CORNER);
    image(imgC2, 2*x, height-5*y/4, 2*x*.75, y*.75);
  }

  if ((mouseX >= 3*x) && (mouseX < 4*x) && (mouseY <= height) && (mouseY > height-y)) {
    imageMode(CORNER);
    image(imgC1, 3*x, height-y, 2*x, y/2);
  }

  if ((mouseX >= 4*x) && (mouseX < 5*x) && (mouseY <= height) && (mouseY > height-y)) {
    imageMode(CORNER);
    image(imgC2, 4*x, height-3*y/2, 2*x, y);
  }
  
  if ((mouseX >= 5*x) && (mouseX < 6*x) && (mouseY <= height) && (mouseY > height-y)) {
    imageMode(CORNER);
    image(imgC1, 5*x, height-y, 2*x*1.25, y*1.25/2);
  }
  
  if ((mouseX >= 6*x) && (mouseX < 8*x) && (mouseY <= height) && (mouseY > height-y)) {
    imageMode(CORNER);
    image(imgC3, 6*x, height-2*y, 2*x*1.25, 3*y/2);
  }


//vertical trunk
  if ((mouseX >= 8*x) && (mouseX < width) && (mouseY <= height) && (mouseY > height-2*y)) {
    imageMode(CORNER);
    image(imgC4, 8*x, height-3*y, x, 2*y);
  }

  if ((mouseX >= 8*x) && (mouseX < width) && (mouseY <= height-2*y) && (mouseY > height-4*y)) {
    imageMode(CORNER);
    image(imgC5, 15*x/2, height-4*y, 3*x/2, 3*y/2);
  }
  
  if ((mouseX >= 8*x) && (mouseX < width) && (mouseY <= height-4*y) && (mouseY > height-6*y)) {
    imageMode(CORNER);
    image(imgC4, 31*x/4, height-6*y, x*1.25, 2*y*1.25);
  }

//top trunk
  if ((mouseX >= 7*x) && (mouseX < width) && (mouseY <= 2*y) && (mouseY > 0)) {
    imageMode(CORNER);
    image(imgK1, 15*x/2, y, x, 2*y);
  }
  if ((mouseX >= 6*x) && (mouseX < 7*x) && (mouseY <= 2*y) && (mouseY > 0)) {
    imageMode(CORNER);
    image(imgK2, 6*x, y/2, x, 3*y/2);
  }
    if ((mouseX >= 5*x) && (mouseX < 6*x) && (mouseY <= 2*y) && (mouseY > 0)) {
    imageMode(CORNER);
    image(imgK3, 5*x, y/3, x, 3*y/2);
  }
    if ((mouseX >= 4*x) && (mouseX < 5*x) && (mouseY <= 2*y) && (mouseY > 0)) {
    imageMode(CORNER);
    image(imgK4, 4*x, y/4, x, 3*y/2);
  }
    if ((mouseX >= 2*x) && (mouseX < 4*x) && (mouseY <= 2*y) && (mouseY > 0)) {
    imageMode(CORNER);
    image(imgK5, 2*x, y/3, 2*x, 5*y/2);
  }
    if ((mouseX >= 0) && (mouseX < 2*x) && (mouseY <= 2*y) && (mouseY > 0)) {
    imageMode(CORNER);
    image(imgK6, 0, y/3, 2*x, 4*y);
  }

//center

  if ((mouseX >= 0) && (mouseX < 2*x) && (mouseY > 2*y) && mouseY < 7*y) {
    imageMode(CORNER);
    image(imgB, 0, 2*y, 3*x, 4*y);
  }

  if ((mouseX >= 2*x) && (mouseX < 6*x) && (mouseY > 2*y) && mouseY < 6*y) {
    imageMode(CENTER);
    image(imgDH, width/2, height/2);
  }
}


