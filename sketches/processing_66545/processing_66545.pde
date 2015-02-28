
int barW = 100;
int barH = 20;
int ballW = 30;
float ballxP = 300;
float ballyP = 15;
float ballxV = random(3, 5);
float ballyV = random(3, 5);
float barxP = mouseX;
float baryP = 360;
PFont oFont;
PFont ooFont;

void setup() {
  size(500, 400);
  background(24, 103, 176);
  noStroke();
  smooth();  
  oFont = loadFont("Helvetica-160.vlw");
  ooFont = loadFont("Harabara-Bold-160.vlw");
}

void draw() {
  background(24, 103, 176);

  //how ball moves
  ballxP = ballxP + ballxV;
  ballyP = ballyP + ballyV;

  //move ball on x
  if (ballxP >= width-(ballW/2) || ballxP <= 0+(ballW/2)) {
    ballxV = ballxV*(-1);
  }

  //move ball on y
  if (ballyP <= 0+(ballW/2) || ballyP >= height-(ballW/2)) {
    ballyV = ballyV*(-1);
  }

  //move paddle on x
  if (mouseX >= 0 && mouseY >= 340) {
    barxP = mouseX;
  }

  //ball touches paddle
  if (ballyP > mouseY && mouseY >= 350 || ballxP == mouseX+barW ) {
    ballyV = ballyV*(-1);
  }

  //make ball stays in frame  
  if (ballyP > height) {
    ballyV = -ballyV;
  }

  /////////decoration/////////

  //changes background color as paddle moves
  if (mouseX <= 125 && mouseX >= 0) { //white bg
    background(255);
    fill(0);
    rect(20, 0, 20, 400);
    rect(60, 0, 20, 400);
    rect(100, 0, 20, 400);
    rect(140, 0, 20, 400);
    rect(180, 0, 20, 400);
    rect(220, 0, 20, 400);
    rect(260, 0, 20, 400);
    rect(300, 0, 20, 400);
    rect(340, 0, 20, 400);
    rect(380, 0, 20, 400);
    rect(420, 0, 20, 400);
    rect(460, 0, 20, 400);
  }

  if (mouseX <= 245 && mouseX >= 125) { //yellow bg
    background(246, 255, 0); 
    fill(0);
    rect(20, 0, 20, 400);
    rect(60, 0, 20, 400);
    rect(100, 0, 20, 400);
    rect(140, 0, 20, 400);
    rect(180, 0, 20, 400);
    rect(220, 0, 20, 400);
    rect(260, 0, 20, 400);
    rect(300, 0, 20, 400);
    rect(340, 0, 20, 400);
    rect(380, 0, 20, 400);
    rect(420, 0, 20, 400);
    rect(460, 0, 20, 400);
  }


  if (mouseX <= 365 && mouseX >= 245) { //mint bg
    background(0, 255, 222); 
    fill(0);
    rect(20, 0, 20, 400);
    rect(60, 0, 20, 400);
    rect(100, 0, 20, 400);
    rect(140, 0, 20, 400);
    rect(180, 0, 20, 400);
    rect(220, 0, 20, 400);
    rect(260, 0, 20, 400);
    rect(300, 0, 20, 400);
    rect(340, 0, 20, 400);
    rect(380, 0, 20, 400);
    rect(420, 0, 20, 400);
    rect(460, 0, 20, 400);
  }


  if (mouseX <= 500 && mouseX >= 365) { //pink bg
    background(255, 81, 183); 
    fill(0);
    rect(20, 0, 20, 400);
    rect(60, 0, 20, 400);
    rect(100, 0, 20, 400);
    rect(140, 0, 20, 400);
    rect(180, 0, 20, 400);
    rect(220, 0, 20, 400);
    rect(260, 0, 20, 400);
    rect(300, 0, 20, 400);
    rect(340, 0, 20, 400);
    rect(380, 0, 20, 400);
    rect(420, 0, 20, 400);
    rect(460, 0, 20, 400);
  }

  //insert pong text
  if (mouseX <= 125 && mouseX >= 0 || mouseX <= 365 && mouseX >= 245) {
    fill(0);
    textFont(oFont);
    text("PONG", 17, 260);
    fill(255);
    textFont(ooFont);
    text("PONG", 15, 260);
  }
  else {      
    fill(0);
    textFont(oFont);
    text("PONG", 17, 260);
  }
  
  /////////objects/////////

  //draw ball
  fill(0);
  ellipse(ballxP, ballyP, ballW, ballW);

  //draw bar
  fill(0);
  rect(barxP, baryP, barW, barH);
}


