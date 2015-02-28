
/* @pjs font="BAVEUSE.ttf"; */
PFont font;
Player myPlayer;
void setup() {
  size(350, 330);
  myPlayer = new Player(0,0,2,0);
      textFont(createFont("BAVEUSE",32));
}
void draw() {
  background(235,255,111);
  smooth();
  myPlayer.display();
  fill(0);
  text("Chin-Chi!",10,95);
  println("X = " + mouseX + " , " + "Y = " + mouseY);
}

class Player{

int posX;
int posY;
int playerSize;
int rot;
//constructor is worthless but whatever
Player(int tempPosX, int tempPosY, int tempSize, int tempRot){
  posX = tempPosX;
  posY = tempPosY;
  playerSize = tempSize;
  rot = tempRot;
}
//show whole character
void display(){
  leftArm();
  rightArm();
  leftLeg();
  rightLeg();
  girlBody();  
  girlHead();
}
void girlBody() {
  fill(255, 75, 75);//pink
  //Girl Body
  //Pink Shirt
  quad(225, 156, 270, 156, 289, 264, 206, 264);
  //grey shirt
  fill(130);
  quad(215, 218, 280, 218, 289, 264, 206, 264);
  //Neck
  fill(255, 199, 95);//peach
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
  //fill(100, 65, 0);//brown
  fill(240);//light grey
  ellipse(171, 18, 54, 63);//left bun
  ellipse(270, 18, 54, 63);//right bun
  //ears
  fill(255, 199, 95);//peach
  ellipse(180, 90, 27, 27);//left ear
  ellipse(288, 90, 27, 27);//right ear
  fill(60, 255, 255);//blue
  ellipse(190, 108, 5, 5);//left earring
  ellipse(301, 108, 5, 5);//rite earring

  fill(255, 199, 95);//peach
  ellipse(198, 39, 99, 117);//mainHead
//ribbons
  fill(255, 75, 75);//pink
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
  fill(75, 30, 0);//brown
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

  //eyes
  fill(255);//white
  ellipse(207, 96, 27, 27);//left eye BIG
  ellipse(260, 96, 27, 27);//right eye BIG
  fill(75, 30, 0);//brown
  ellipse(213, 97, 20, 20);//left eye BIG
  ellipse(261, 97, 20, 20);//right eye BIG
  fill(0);//black
  ellipse(215, 99, 15, 15);//left eye BIG
  ellipse(264, 99, 15, 15);//right eye BIG
  fill(255);//white
  ellipse(221, 101, 8, 8);//left pupil
  ellipse(265, 101, 8, 8);//right pupil
  //mouth
  noFill();
  arc(234,127,27,18,radians(0),radians(180));
  //eye brows
  strokeWeight(2);
  arc(208,86,26,17,radians(-180),radians(-0));
  arc(261,86,26,17,radians(-180),radians(-0));
  strokeWeight(1);
}

void leftArm() {
  //Left Arm
  fill(240);//ligth grey
  ellipse(165, 163, 71, 20);
  line(200,163,200,183);
  fill(255, 199, 95);//peach
  arc(165, 163, 71, 20, radians(90), radians(270));
}

void rightArm() {
  //Left Arm
  fill(255, 199, 95);//peach
  ellipse(260, 163, 71, 20);
    line(295,163,295,183);
  fill(240);//light grey
  arc(260, 163, 71, 20, radians(90), radians(270));
}

void leftLeg() {
  fill(255);
  rect(217, 245, 26, 45);
  fill(0);
  arc(217, 263, 26, 54, radians(0), radians(180));
  fill(255);
  rect(225, 294, 9, 9);
}
void rightLeg() {
  fill(255);
  rect(253, 245, 26, 45);
  fill(0);
  arc(253, 263, 26, 54, radians(0), radians(180));
  fill(255);
  rect(261, 294, 9, 9);
}


}


