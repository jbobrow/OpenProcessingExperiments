
PImage bang;
PImage cracker;
PImage happea;


float[] xPos = new float[0];
float[] yPos = new float[0];
float[] xVel = new float[0];
float[] yVel = new float[0];
float[] partSize = new float[0];


//rectangle click area
float rectX = 255;
float rectY = 470;
float rectWidth = 100;
float rectHeight = 50;



void setup() {
  size(595, 600);
  bang = loadImage("http://rickpowell.co.uk/hap-pea_christmas/bang.png");
  cracker = loadImage("http://rickpowell.co.uk/hap-pea_christmas/cracker.png");
  happea = loadImage("http://rickpowell.co.uk/hap-pea_christmas/happea.png");

  noStroke();
}

void draw() {
  
  float bg =constrain(map( mouseY, 300, 450, 0, 255), 0, 255);
  
  colorMode(HSB);
  background(150, 120, bg);

  colorMode(RGB);
  image(happea, 100, 50);

  //click to pull cracker
  if ((mousePressed) &&
    (mouseX > rectX) &&
    (mouseX < rectX+rectWidth)&&
    (mouseY > rectY) &&
    (mouseY < rectY+rectHeight)) {
    image(bang, 0, height-264);
  } 
  else {
    image(cracker, 0, height-264);
  } 
  noFill();
  rect(rectX, rectY, rectWidth, rectHeight);



  //makes new particle
  xPos = append(xPos, random(0, 600));
  yPos = append(yPos, 0);
  xVel = append(xVel, random(-1, 1));
  yVel = append(yVel, random(1, 3));
  partSize = append(partSize, random(1, 6));

  for (int i=0; i<xPos.length; i++) {
    fill(255, 255, 255);
    ellipse(xPos[i], yPos[i], partSize[i], partSize[i]);

    xPos[i] += xVel[i];
    yPos[i] += yVel[i];
  }

  if (xPos.length >600) {
    xPos = subset(xPos, 1);
    yPos = subset(yPos, 1);
    xVel = subset(xVel, 1);
    yVel = subset(yVel, 1);
    partSize = subset(partSize, 1);
  }

  //left pea
  //left eye
  float leftXpos = constrain(map( mouseX, 100, 300, 205, 210), 205, 210);
  float leftYpos = constrain(map( mouseY, 300, 500, 430, 440), 430, 440);
  fill(0);
  ellipse(leftXpos, leftYpos, 4, 4);

  //right eye
  float rightXpos = constrain(map( mouseX, 100, 300, 224, 230), 224, 230);
  float rightYpos = constrain(map( mouseY, 300, 500, 427, 435), 427, 435);
  fill(0);
  ellipse(rightXpos, rightYpos, 4, 4);

  //right pea
  //left eye
  float right1Xpos = constrain(map( mouseX, 300, 500, 378, 383), 378, 383);
  float right1Ypos = constrain(map( mouseY, 300, 500, 427, 435), 427, 435);
  fill(0);
  ellipse(right1Xpos, right1Ypos, 4, 4);

  //right eye
  float left1Xpos = constrain(map( mouseX, 300, 500, 397, 403), 397, 403);
  float left1Ypos = constrain(map( mouseY, 300, 500, 430, 440), 430, 440);
  fill(0);
  ellipse(left1Xpos, left1Ypos, 4, 4);
}


