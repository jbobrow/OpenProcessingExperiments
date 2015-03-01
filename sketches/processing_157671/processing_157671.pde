
/* @pjs font="BAVEUSE.ttf"; */
PFont font;
PImage palette;
PImage bubble;
Player myPlayer;
color grey = color(#292823);
color white = color(#fffcfc);
color hotPink = color(#ff0162);
color lightPink = color(#e84e96);
color superLightPink = color(#f192be);
color black = color(#000000);
color brown = color(#59321a);
color skinColor = color(#edb37b);
int k;
int j;
int a;
int b;
int c;
int d;
void setup() {
  size(350, 330);
  myPlayer = new Player(0,0,2,0);
  font = textFont(createFont("BAVEUSE",25));
  palette = loadImage("cool_color_palette.png");
  bubble = loadImage("speech_bubble.png");
}
void draw() {
  background(lightPink);
  smooth();
  noStroke();
  forLoopCircle();
  forLoopText();
  stroke(black);
  myPlayer.display();
  image(bubble,4,10);
  fill(black);
  String n = "Hi, I'm Chin-Chi";
  //put string text within a bounding box
  text(n,22,33, 135, 200);
    String p = "My color palette!";
  //put string text within a bounding box
  text(p,10, 180, 150, 200);
 // text("Palette",5,200);
  image(palette,7,270);
  println("X = " + mouseX + " , " + "Y = " + mouseY);
}
void forLoopCircle(){
  for (int k = -12; k <350; k += 20){
    for (int j = -12; j <330; j += 20){
      fill(white,100);
      ellipse(k,j,30,30);
    }
  }
}
  void forLoopText(){
    for (int a = -5; a<350; a += 145){
    for (int b = -5; b <330; b += 40){
      fill(hotPink,125);
      text("We Rock",a,b);
    }
  }
}


class Player {
  int posX;
  int posY;
  int playerSize;
  int rot;
  int x = 165;
  int y = 18;
  int myWidth = 5;
  int myHeight = 5;
  int vertX = 169;
  int vertY = 36;
  //constructor is worthless but whatever
  Player(int tempPosX, int tempPosY, int tempSize, int tempRot) {
    posX = tempPosX;
    posY = tempPosY;
    playerSize = tempSize;
    rot = tempRot;
  }
  //show whole character
  void display() {
    leftArm();
    rightArm();
    leftLeg();
    rightLeg();
    girlBody();  
    girlHead();
  }
  void girlBody() {
    fill(hotPink);
    //Girl Body
    //Pink Shirt
    quad(x+60, y+138, x+105, y+138, x+124, y+246, x+41, y+246);
    //Grey S
    fill(grey);
    quad(x+50, y+200, x+115, y+200, x+124, y+246, x+41, y+246);
    //Neck
    fill(skinColor);
    beginShape();
  vertex(230, 144);
  vertex(266, 144);
  vertex(266, 156);
  vertex(248, 170);
  vertex(229, 156);
    endShape(CLOSE);
  }
  void girlHead() {
    //Girl Head
    ellipseMode(CORNER);
     fill(white);
  ellipse(171, 18, 54, 63);//left bun
  ellipse(270, 18, 54, 63);//right bun
    //ears
    fill(skinColor);
  ellipse(180, 90, 27, 27);//left ear
  ellipse(288, 90, 27, 27);//right ear
    fill(hotPink);
  ellipse(190, 108, 5, 5);//left earring
  ellipse(301, 108, 5, 5);//rite earring

    fill(skinColor);
  ellipse(198, 39, 99, 117);//mainHead
    //ribbons
    fill(hotPink);
    //right side
    beginShape();
  vertex(297,77);
  vertex(327,89);
  vertex(325,91);
  vertex(298,81);
  vertex(323,100);
  vertex(321,102);
  vertex(297,84);
    endShape(CLOSE);
    //left side
    beginShape();
  vertex(199,75);
  vertex(169,87);
  vertex(170,92);
  vertex(198,79);
  vertex(172,99);
  vertex(174,103);
  vertex(199,84);
    endShape(CLOSE);
    //hair
    fill(brown);
    beginShape();
vertex(306, 190);
  vertex(306, 171);
  vertex(315, 153);
  vertex(306, 127);
  vertex(306, 117);
  vertex(297, 99);
  vertex(297, 72);
  vertex(288, 54);
  vertex(270, 36);
  vertex(234, 36);
  vertex(216, 45);
  vertex(207, 55);
  vertex(198, 73);
  vertex(198, 99);
  vertex(189, 117);
  vertex(189, 136);
  vertex(180, 153);
  vertex(189, 171);
  vertex(188, 190);
  vertex(198, 171);
  vertex(198, 162);
  vertex(207, 144);
  vertex(198, 135);
  vertex(209, 91);
  vertex(217, 72);
  vertex(216, 82);
  vertex(243, 109);
  vertex(244, 81);
  vertex(261, 99);
  vertex(261, 72);
  vertex(288, 100);
  vertex(297, 136);
  vertex(288, 144);
  vertex(297, 163);
  vertex(298, 172);
    endShape(CLOSE);
    //eye lashes
    line(202,99,209,105);
    line(205,94,210,100);
    line(291,99,283,105);
    line(291,94,283,100);
    //eyes
    fill(white);
  ellipse(207, 96, 27, 27);//left eye BIG
  ellipse(260, 96, 27, 27);//right eye BIG
    fill(brown);
 ellipse(213, 97, 20, 20);//left eye BIG
  ellipse(261, 97, 20, 20);//right eye BIG
    fill(black);
  ellipse(215, 99, 15, 15);//left eye BIG
  ellipse(264, 99, 15, 15);//right eye BIG
    fill(white);
  ellipse(221, 101, 8, 8);//left pupil
  ellipse(265, 101, 8, 8);//right pupil
    //mouth
    noFill();
  arc(234,127,27,18,radians(0),radians(180));
    //eye brows
    strokeWeight(2);
    arc(208, 86, 26, 17, radians(-180), radians(-0));
    arc(261, 86, 26, 17, radians(-180), radians(-0));
    strokeWeight(1);
  }

  void leftArm() {
    //Left Arm
    //  rotate right arm
    rotate(radians(-30));
    fill(grey);
    ellipse(50, 245, 71, 20);
    fill(skinColor);
    arc(50, 245, 71, 20, radians(90), radians(270));
    //rotate again to striaght out whole body
    rotate(radians(30));
    line(197, 167, 206, 187);
  }

  void rightArm() {
    //Left Arm
    //rotate left arm
    rotate(radians(30));
    fill(skinColor);
    ellipse(305, 0, 71, 20);
    fill(grey);
    arc(305, 0, 71, 20, radians(90), radians(270));
    //rotate everything elese back to normal
    rotate(radians(-30));
    line(294, 169, 284, 186);
  }
  
  void leftLeg() {
    fill(white);
  rect(217, 245, 26, 45);
    fill(black);
  arc(217, 263, 26, 54, radians(0), radians(180));
    fill(white);
  rect(225, 294, 9, 9);
  }
  void rightLeg() {
    fill(white);
  rect(253, 245, 26, 45);
    fill(black);
  arc(253, 263, 26, 54, radians(0), radians(180));
    fill(white);
  rect(261, 294, 9, 9);
  }
}



