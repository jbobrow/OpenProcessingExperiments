
PImage imgI, imgII;

void setup() {
  size(500, 500);
  //noLoop();
  smooth();
  imageMode(CENTER);
  imgI = loadImage("mlf.png");
  imgII = loadImage("vitruvianman.png");
}
  int numObjects = 6; // mona lisa face
  int numObjectsI = 8; // vitruvian man
  int centerX = 250;
  int centerY = 250;
  float distanceI = 150;
  float distanceII = 100;
  float distanceIII = 50;
  float angle = 0;
  float angleObject = 360/numObjects;
  float angleObjectI = 360/numObjectsI;
 
void draw() {
  
  background(0);
  noFill();
  strokeWeight(3);
  distanceI = sin(radians(frameCount))*120;
  distanceII = cos(radians(frameCount))*110;
  distanceIII = tan(radians(frameCount))*30;
  angle++;
 
  for(int i = 0; i<=numObjects; i++) //mona lisa
  {
    pushMatrix();
    tint(255, 50, 255);
    translate(centerX, centerY);
    rotate(radians(i*angleObject + angle*9));
    ellipse(distanceII, distanceII, height, width);
    stroke(random(255), random(255), random(255));
    strokeWeight(.5);
    image(imgI, distanceI, distanceI,i*distanceI,i*distanceI);  
    popMatrix(); 
  }
  for(int i = 0; i<=numObjectsI; i++) 
  {
    pushMatrix();
    tint(220, 220);
    translate(centerX, centerY);
    rotate(radians(i*angleObjectI + angle/6));
    ellipse(100, distanceIII, 15, 15);
    fill(255);
    noStroke();
    popMatrix();
  }
  for(int i = 0; i<=numObjectsI; i++) // vitruvian man
  {
    pushMatrix();
    translate(centerX, centerY);
    rotate(radians(i*angleObject + angle*2));
    image(imgII, distanceII, distanceII, distanceII, distanceIII);
    line(0, 0, height, width);
    stroke(0);
    strokeWeight(1);
    popMatrix();
  }
}

