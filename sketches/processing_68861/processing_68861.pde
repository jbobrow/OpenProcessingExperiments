
int numCircle = 200;

int posY = 400;
int posUmbrella = 400;
//int posRunning = mouseX+84;

//float gravity = 9;

PImage manRunning, umbrella, casal;
PFont myFont;

float [] circleX = new float [numCircle];
float [] circleY = new float [numCircle];
float [] velX = new float [numCircle];
float [] velY = new float [numCircle];

void setup() {
  size(500, 500);
  smooth();
  noStroke();

  manRunning = loadImage ("manCorrendo.png");  
  umbrella = loadImage ("umbrella.png");
  casal = loadImage ("casal.png");

  myFont = loadFont("AmericanTypewriter-CondensedBold-40.vlw");
  textFont (myFont, 40);
}

void draw() {
  background(0);
//CLOUD
  fill(222, 222, 222);
  beginShape();
  vertex(mouseX+54, 102);
  bezierVertex(mouseX+32, 54, mouseX+83, 63, mouseX+73, 75);
  bezierVertex(mouseX+114, 40, mouseX+120, 40, mouseX+140, 62);
  bezierVertex(mouseX+196, 43, mouseX+174, 103, mouseX+174, 103);
  bezierVertex(mouseX+174, 103, mouseX+ 174, 103, mouseX+ 54, 102);
  endShape();

  image(manRunning, mouseX+84, posY, 60, 90);

//RAIN
  for (int i=0; i<numCircle; i++) {
    circleX[i]  = random(mouseX+54, mouseX+174);
    circleY[i] = random(102, height);
    velY[i] = random (3, 1);
  }

  for (int i=0; i < numCircle; i++) {
    fill(15, 255, random(253, 255));
    ellipse(circleX[i], circleY[i], 2, 4);

    circleY[i] += velY[i]; //movimento da porra da bola Y

    image(umbrella, posUmbrella, 400, 60, 90);
    fill(0);
    rect(400, 490, 60, 10);
  }

  if (mouseX +84 > posUmbrella) {
    image(casal, posUmbrella, 400, 60, 90);
    posY = 800;
    fill(13, 91, 255);
    pushMatrix();
    translate(250, 0);
    rotate(radians(15));
    text("SIGH", 0, height/2);
    popMatrix();
  }

  else {
    posY = 400;

  }
}


