
void setup() {
  smooth();
  size(300, 300);
}

void draw() {
  background(255);
  drawHouse();
  drawBalloon();
}



float balloonX;
float balloonY;
float balloonW;
float balloonH;
float balloonXSpeed;
float balloonYSpeed;
float stringX;
float stringY;
float stringX2;
float stringY2;
boolean balloonInitialized = false;
color c;

void drawBalloon() {
  initializeBalloon();
  physics();
  display();
}

void display() {
  fill(c);

  ellipse(balloonX, balloonY, balloonW, balloonH);
  stringDisplay();
}
void initializeBalloon() {
  if (!balloonInitialized) {
    balloonInitialized = true;//Boolean to prevent reinitialization.
    balloonW = random(15, 30);//Width.
    balloonH = random (20, 35);//Height.
    balloonX = random(0, 300);//X position.
    balloonY = random(0, 300);//Y position.
    balloonXSpeed = 2;
    balloonYSpeed = 1;
    c = color(random(0, 255), random(0, 255), random(0, 255));//Color of balloon.
  }
}

void physics() {
  if (balloonX>300-balloonW/2) {//Right edge boundary.
    balloonX = (300-balloonW/2)+1;
    balloonXSpeed = -2;
  } 
  if (balloonX<balloonW/2) {//Left edge boundary.
    balloonX = (balloonW/2) + 1;
    balloonXSpeed = 2;
  } 
  if (balloonY>300-balloonH/2) {//Bottom edge boundary.
    balloonY = (300-balloonH/2)-1;
    balloonYSpeed = -2;
  } 
  if (balloonY<balloonH/2) {//Top edge boundary.
    balloonY = (balloonH/2)+1;
    balloonYSpeed = 2;
  } 
  balloonX = balloonX + balloonXSpeed;
  balloonY = balloonY + balloonYSpeed;
  string();
}

void string() {
  stringX = balloonX;
  stringY = balloonY+balloonH/2;
  stringX2 = balloonX+balloonW/3;
  stringY2 = balloonY+balloonH/2+balloonH/3;
}

void stringDisplay() {
  line(stringX, stringY, stringX2, stringY2);
}

float houseBodyX;
float houseBodyY;
float houseBodyH;
float houseBodyW;
float house2BodyX;
float house2BodyY;
float house2BodyH;
float house2BodyW;
boolean houseInitialized = false;
boolean house2Initialized = false;
color b;
color b2;
void drawHouse() {
  houseInitialization();
  houseDisplay();
  house2Initialization();
  house2Display();
}

void house2Initialization() {
  if (!house2Initialized) {
    house2BodyX = random(0, 200);
    house2BodyY = random(70, 300);
    house2BodyW = random(60, 100);
    house2BodyH = random(40, 70);
    b2 = color(random(0, 255), random(0, 255), random(0, 255));//Color of balloon.
    house2Initialized = true;
  }
}

void houseInitialization() {
  if (!houseInitialized) {
    houseBodyX = random(0, 200);
    houseBodyY = random(70, 300);
    houseBodyW = random(60, 100);
    houseBodyH = random(40, 70);
    b = color(random(0, 255), random(0, 255), random(0, 255));//Color of balloon.
    houseInitialized = true;
  }
}

void house2Display() {
  fill(b2);
  rect(house2BodyX, house2BodyY, house2BodyW, house2BodyH);//Body of the house2.
  triangle(house2BodyX, house2BodyY, house2BodyX + house2BodyW, house2BodyY, house2BodyX + house2BodyW/2, house2BodyY-house2BodyH/2);//Roof
  fill(0);//Color of the door.
  println (house2BodyX/2);
  rect(house2BodyX + 5*(house2BodyW)/8, house2BodyY + house2BodyH - (3*(house2BodyH)/2)/4, (3*house2BodyW)/16, ((3*house2BodyH)/2)/4);//Door
  rect(house2BodyX + house2BodyW/8, house2BodyY+house2BodyH/8, house2BodyW/8, house2BodyH/8);//Window
}

void houseDisplay() {
  fill(b);
  rect(houseBodyX, houseBodyY, houseBodyW, houseBodyH);//Body of the house.
  triangle(houseBodyX, houseBodyY, houseBodyX + houseBodyW, houseBodyY, houseBodyX+houseBodyW/2, houseBodyY-houseBodyH/2);//Roof
  fill(0);//Color of the door.
  rect(houseBodyX + 5*(houseBodyW)/8, houseBodyY + houseBodyH - (3*(houseBodyH)/2)/4, (3*houseBodyW)/16, ((3*houseBodyH)/2)/4);//Door
  rect(houseBodyX + houseBodyW/8, houseBodyY+houseBodyH/8, houseBodyW/8, houseBodyH/8);//Window
}



