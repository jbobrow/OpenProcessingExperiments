
// set up a simple timer to draw an ellipse 1 seconds after user clicks(note: millis in milliseconds, so 1 seconds = 1000 millis)

PImage ParisWall;
PImage SpaceInvader;
PImage PalestineWall;
PImage BanksyGirl;
PImage InvaderRight;
PImage InvaderCenter;
PImage InvaderLeft;

PFont myDisplayFont;
PFont myDisplayFont2;

float lastSavedTime;
float timeDelaySeconds = 0.5;
float timeDelay;

PImage[] tags = new PImage[5];
int whichTag;


boolean drawTag = false;
//boolean drawBanksyGirlTrue = false;
//boolean drawSpaceInvaderTrue = false;
float mouseXClicked;
float mouseYClicked;
//float mouseXClicked2;
//float mouseYClicked2;

void setup() {
  background(0);
  ParisWall = loadImage("ParisWall.jpg");
  SpaceInvader = loadImage("SpaceInvader.png");
  PalestineWall = loadImage("PalestineWall.jpg");
  BanksyGirl = loadImage("BanksyGirl.png");
  InvaderRight = loadImage("SpaceInvaderRight.png");
  InvaderCenter = loadImage("SpaceInvaderCenter.png");
  InvaderLeft = loadImage("SpaceInvaderLeft.png");

  tags[0] = SpaceInvader;
  tags[1] = BanksyGirl;
  tags[2] = InvaderLeft;
  tags[3] = InvaderCenter;
  tags[4] = InvaderRight;


  lastSavedTime = 0;
  timeDelay = 1000*timeDelaySeconds;
  myDisplayFont = loadFont("Silom-48.vlw");
  myDisplayFont2 = loadFont("PortagoITCTT-48.vlw");
  textAlign(LEFT);
  println(lastSavedTime);
  ellipseMode(CENTER);
  size(1200, 749);
  smooth();
  image(ParisWall, 0, 0);
  image(PalestineWall, 600, 0);
  //  drawSpaceInvaderTrue = false;
  //  drawBanksyGirlTrue = false;
}

void draw() {


  fill(222, 42, 33);
  textFont(myDisplayFont, 40);
  text("YOU ARE SPACE INVADER", 0, 50);

  fill(0, 0, 0);
  textFont(myDisplayFont2, 48);
  text("YOU ARE BANKSY", 605, 50);

  if (drawTag) {
    if (mouseX <= 200) {
      whichTag = 2;
    }
    if (mouseX > 200 && mouseX <= 315) {
      whichTag = 3;
    }
    if (mouseX > 315 && mouseX < 600) {
      whichTag = 4; 
      if (mouseX > 530) {
        mouseXClicked = 530;
      }
    }

    if (mouseX >= 600) {
      whichTag = 1;
    }
    image(tags[whichTag], mouseXClicked, mouseYClicked);
    drawTag = false;
  }

  //  if (millis() - lastSavedTime > timeDelay && lastSavedTime != 0 && mouseX < 530 && mouseY < 720) {
  //    drawSpaceInvaderTrue = true;
  //  }
  //  if (drawSpaceInvaderTrue) {
  //    image(SpaceInvader, mouseXClicked, mouseYClicked);
  //    drawSpaceInvaderTrue = false;
  //  }
  //  
  //  if (millis() - lastSavedTime > timeDelay && lastSavedTime != 0 && mouseX > 600 && mouseX < 1130 && mouseY < 720) {
  //    drawBanksyGirlTrue = true;
  //  }
  //  if (drawBanksyGirlTrue) {
  //    image(BanksyGirl, mouseXClicked2, mouseYClicked2);
  //    drawBanksyGirlTrue = false;
  //  }
}


void mouseReleased() {

  lastSavedTime = millis();
  println(lastSavedTime);

  drawTag = true;
  mouseXClicked = constrain(mouseX, 0, 1130);
  mouseYClicked = mouseY;  

  //  mouseXClicked = constrain(mouseX, 0, 530);
  //  mouseYClicked = constrain(mouseY, 0, 720);
  //  mouseXClicked2 = constrain(mouseX, 600, 1130);
  //  mouseYClicked2 = constrain(mouseY, 0, 720);
}


