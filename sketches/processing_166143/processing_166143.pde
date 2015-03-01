
PImage [] pic;
PFont font;

int xPos=10;
int yPos=130;
int s=50;
int m=60;



void setup() {

  size(600, 600);
  pic = new PImage [10];

  pic[0] = loadImage("bg.jpg");
  pic[1] = loadImage("b1.png");
  pic[2] = loadImage("b2.png");
  pic[3] = loadImage("b3.png");
  pic[4] = loadImage("b4.png");
  pic[5] = loadImage("b5.png");
  pic[6] = loadImage("b6.png");
  pic[7] = loadImage("b7.png");
  pic[8] = loadImage("b8.png");

  font = loadFont("UniversLTStd-Cn-24.vlw");
}

void draw() {
  textFont(font);
  text("TODAY'S MENU", 225, 90);

  image(pic[0], 0, 0);

  textFont(font);
  text("TODAY'S MENU", 218, 112);

  //drawingboard
  noStroke();
  fill(0);
  rect(65, 130, 470, 230);

  //eraser
  image(pic[1], xPos+532, yPos+m+m+m, s, s);

  //white
  image(pic[2], xPos, yPos, s, s);

  //pink
  image(pic[3], xPos, yPos+m, s, s);

  //blue
  image(pic[5], xPos, yPos+m+m, s, s);

  //green
  image(pic[6], xPos, yPos+m+m+m, s, s);

  //yellow
  image(pic[4], xPos+532, yPos, s, s);

  //purple
  image(pic[7], xPos+532, yPos+m, s, s);

  //aqua
  image(pic[8], xPos+532, yPos+m+m, s, s);

  println(mouseX, mouseY);

  if (mousePressed) {
    if (mouseX>68 && mouseX<532 && mouseY>133 && 357>mouseY) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    //white
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos && mouseY<yPos+s) {
      strokeWeight(4);
      stroke(255);
    }
    //pink   
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos+m && mouseY<yPos+m+m) {
      strokeWeight(4);
      stroke(244, 153, 193);
    }
    //blue
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos+m+m && mouseY<yPos+m+m+m) {
      strokeWeight(4);
      stroke(0, 174, 239);
    }
    //green
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos+m+m+m && mouseY<yPos+m+m+m+m) {
      strokeWeight(4);
      stroke(141, 198, 63);
    }
    //yellow
    if (mouseX>xPos+532 && mouseX<xPos+582 && mouseY>yPos && mouseY<yPos+s) {
      strokeWeight(4);
      stroke(255, 242, 86);
    }
    //purple
    if (mouseX>xPos+532 && mouseX<xPos+582 && mouseY>yPos+m && mouseY<yPos+m+m) {
      strokeWeight(4);
      stroke(154, 45, 145);
    }
    //Aqua
    if (mouseX>xPos+532 && mouseX<xPos+582 && mouseY>yPos+m+m && mouseY<yPos+m+m+m) {
      strokeWeight(4);
      stroke(43, 182, 115);
    }

    //eraser
    if (mouseX>xPos+532 && mouseX<xPos+582 && mouseY>yPos+m+m+m && mouseY<yPos+m+m+m+m) {
      strokeWeight(50);
      stroke(0);
    }
  }
}



