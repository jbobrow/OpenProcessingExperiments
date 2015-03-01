
PImage[] img;
int selButton = 0;

color paintColor = color(0, 0, 0);
int box = 50;

void setup() {

  img = new PImage[5];
  img[0] = loadImage("bg.png");
  img[1] = loadImage("crayons.png");
  img[2] = loadImage("left.png");
  img[3] = loadImage("right50.png");
  img[4] = loadImage("bottom70.png");


  size(600, 600);
  stroke(0, 0, 0);

  image(img[0], 0, 0);
}

void draw() {

  image(img[1], 0, 0);
  image(img[2], 0, 0);
  image(img[3], 550, 0);
  image(img[4], 0, 530);
  strokeWeight(1);
  stroke(255);

  //crayons
  if (mousePressed == true) {

    if (mouseX < 30 && mouseX > 0 && mouseY < box && mouseY > 0) {
      paintColor = color(233, 125, 129);
    }
    if (mouseX < 60 && mouseX >30 && mouseY <box && mouseY >0) {
      paintColor = color(255, 155, 115);
    }
    if (mouseX < 90 && mouseX >60 && mouseY <box && mouseY >0) {
      paintColor = color(209, 178, 116);
    }
    if (mouseX < 120 && mouseX >90 && mouseY <box && mouseY >0) {
      paintColor = color(207, 204, 162);
    }
    if (mouseX < 150 && mouseX >120 && mouseY <box && mouseY >0) {
      paintColor = color(189, 213, 94);
    }
    if (mouseX < 180 && mouseX >150 && mouseY <box && mouseY >0) {
      paintColor = color(97, 185, 119);
    }
    if (mouseX < 210 && mouseX >180 && mouseY <box && mouseY >0) {
      paintColor = color(83, 174, 168);
    }
    if (mouseX < 240 && mouseX >210 && mouseY <box && mouseY >0) {
      paintColor = color(81, 143, 187);
    }
    if (mouseX < 270 && mouseX >240 && mouseY <box && mouseY >0) {
      paintColor = color(106, 101, 187);
    }
    if (mouseX < 300 && mouseX >270 && mouseY <box && mouseY >0) {
      paintColor = color(154, 84, 206);
    }
    if (mouseX < 330 && mouseX >300 && mouseY <box && mouseY >0) {
      paintColor = color(229, 115, 174);
    }
    if (mouseX < 360 && mouseX >330 && mouseY <box && mouseY >0) {
      paintColor = color(149, 16, 21);
    }
    if (mouseX < 390 && mouseX >360 && mouseY <box && mouseY >0) {
      paintColor = color(69, 36, 91);
    }
    if (mouseX < 420 && mouseX >390 && mouseY <box && mouseY >0) {
      paintColor = color(43, 40, 95);
    }
    if (mouseX < 450 && mouseX >420 && mouseY <box && mouseY >0) {
      paintColor = color(76, 81, 31);
    }
    if (mouseX < 480 && mouseX >450 && mouseY <box && mouseY >0) {
      paintColor = color(120, 92, 37);
    }
    if (mouseX < 510 && mouseX >480 && mouseY <box && mouseY >0) {
      paintColor = color(60, 63, 69);
    }
    if (mouseX < 540 && mouseX >510 && mouseY <box && mouseY >0) {
      paintColor = color(0, 0, 0);
    }
    if (mouseX < 560 && mouseX >540 && mouseY <box && mouseY >0) {
      paintColor = color(154, 154, 154);
    }
    if (mouseX < 600 && mouseX >560 && mouseY <box && mouseY >0) {
      image(img[0], 0, 0);
    }

    strokeWeight(2);
    stroke(paintColor);
    if (mouseY > 30) line(pmouseX, pmouseY, mouseX, mouseY);
  }

}

void keyPressed() {
  PImage img = get(20, 100, width-50, height-150);
  img.save("drawing.png");
}



