
//load image
PImage desk;

//load fonts
PFont title;
PFont paragraph;

//declare variables
int deskX;
int deskY;

int button1X;
int button1Y;
int button1S;
int hover1;
boolean button1;

int button2X;
int button2Y;
int button2S;
int hover2;
boolean button2;

void setup() {
  size(600, 600);
  desk = loadImage("desk.jpg");//load image
  title = loadFont("beba100.vlw");//load font beba
  paragraph = loadFont("Helvetica-Light-100.vlw");//load font helvetica

  //img center point
  deskY=-1035;

  //up button
  button1X = 20;
  button1Y = 500;
  button1S = 25;
  button1 = false;

  //down button
  button2X = 20;
  button2Y = 550;
  button2S = 25;
  button2 = false;
}

void draw() {
  background(0);
  image(desk, 0, deskY);
  println(deskY);

  //texts
  textAlign(LEFT, CENTER);
  textFont(title);
  textSize(50);
  fill(0);
  text("4 Quotes about", 30, deskY+1335);
  text("Creativity", 30, deskY+1380);


  textAlign(LEFT, TOP);
  textFont(title);
  textSize(20);
  fill(0);
  text("up", button1X+35, button1Y+6);

  textAlign(LEFT, TOP);
  textFont(title);
  textSize(20);
  fill(0);
  text("down", button2X+35, button2Y+6);

  textAlign(LEFT, TOP);
  textFont(title);
  textSize(100);
  text("Creativity", 30, deskY+40);
  text("Creativity", 30, deskY+2400);

  textAlign(LEFT, TOP);
  textFont(title);
  textSize(50);
  fill(255);
  text("is a phenomenon whereby", 30, deskY+130);
  text("something new and valuable", 30, deskY+190);
  text("is created.", 30, deskY+250);
  text("takes courage", 30, deskY+2490);

  textAlign(RIGHT, TOP);
  textFont(title);
  textSize(100);
  fill(0);
  text("Creativity", 570, deskY+640);
  text("Creativity", 570, deskY+1740);

  textAlign(RIGHT, TOP);
  textFont(title);
  textSize(50);
  fill(255);
  text("is knowing how to hide", 570, deskY+730);
  text("your sources", 570, deskY+790);
  text("is an act of defiance", 570, deskY+1830);

  //buttons
  if (mouseX>button1X&&mouseX<button1X+button1S&&
    mouseY>button1Y&&mouseY<button1Y+button1S) {
    hover1=5;
  }
  else {
    hover1=1;
  }
  strokeWeight(hover1);//if button1 hovers on the button, make the border 5px

  if (button1 == true) {
    deskY=deskY+5;
    fill(0);
    rect(button1X, button1Y, button1S, button1S);
  }

  else {
    fill(255);
    rect(button1X, button1Y, button1S, button1S);
  }//if the mouse is clicked, turn the button1 black

  float d = dist(mouseX, mouseY, button2X, button2Y);

  if (d <= button2S) {
    hover2 = 5;
  }
  else {
    hover2 = 1;
  }

  strokeWeight(hover2); //if button1 hovers on the button, make the border 5px

  if (button2 == true) {
    deskY=deskY-5;
    fill(0);
    rect(button2X, button2Y, button2S, button2S);
  }

  else {
    fill(255);
    rect(button2X, button2Y, button2S, button2S);
  }//if the mouse is clicked, turn the button1 black

  //when the image's y value hits the end of the image size, stop
  if (deskY>=0) {
    deskY=0;
  }
  if (deskY<=-2070) {
    deskY=-2070;
  }
}

//use mouse click to turn on/off the buttons
void mouseClicked() {
  if (mouseY > button1Y && mouseY < button1Y+button1S&&
    mouseY > button1Y&&mouseY<button1Y+button1S) {
    button1 = !button1;
  }

  float d = dist(mouseX, mouseY, button2X, button2Y);

  if (d < button2S) {
    button2 = !button2;
  }
}


