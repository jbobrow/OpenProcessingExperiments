
PImage face, maria, thomas;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  background(0);
  face = loadImage("face.png");
  maria = loadImage("maria.png");
  thomas = loadImage("thomas.png");
  imageMode(CENTER);
  frameRate(25);
}


int numObjects = 5;
int centerX = 200;
int centerY = 200;
int distance = 100;

void draw() {
  background(random(255), random(255), random(255));
  float angleObject = TWO_PI/numObjects;
  for (int i=0;i<numObjects; i ++ )
  {
    float posX=centerX + distance *sin(angleObject*i + frameCount*0.05);
    float posY=centerY + distance *cos(angleObject*i + frameCount*0.05);
    float posZ=centerX + distance *cos(angleObject*i + frameCount*0.08);
    float posA=centerX + 200*cos(angleObject*i + frameCount*0.06);
    float posB=centerX + 200*sin(angleObject*i + frameCount*0.06);
    pushMatrix();
    translate(posX, posY);
    rotate(angleObject*(numObjects-i));
    image(face, 0, 0, 132, 200);
    popMatrix();
    pushMatrix();
    translate(posY, posX);
    rotate(angleObject*(numObjects-i));
    image(face, 0, 0, 66, 100);
    popMatrix();
    image(face, posX, posZ, 66, 100);
    image(thomas, posA, posB);
    image(thomas, posB, posA);
    pushMatrix();
    translate(width/2, 215);
    rotate(frameCount*0.04%TWO_PI);
    image(maria, 0, 35,maria.width*.7,maria.height*.7);
    popMatrix();
  }
}


