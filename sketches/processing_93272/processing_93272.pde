
float bearX;
float bearY;

float eyeR;
float eyeG;
float eyeB;

float diam;
float q;
float w;

void setup() {
  size(500, 500);
  background(255);
  bearX = width/2;
  bearY = height+250;
  smooth();
}

void draw() {
  ellipseMode(CENTER);
  rectMode(CENTER); 
  noStroke();
  diam = random(25);

  //left ears : 140,100
  fill(mouseX, 0, mouseY);
  ellipse(mouseX, mouseY, 120, 120);
  fill(227, 203, 172);
  ellipse(mouseX, mouseY, 60, 60);

  //right ear
  fill(mouseX, 0, mouseY);
  ellipse(mouseX+220, mouseY, 120, 120);
  fill(227, 203, 172);
  ellipse(mouseX+220, mouseY, 60, 60);

  //head
  fill(mouseX, 0, mouseY);
  ellipse(mouseX+110, mouseY+120, 370, 270);
  fill(227, 203, 172);
  ellipse(mouseX+110, mouseY+140, 290, 180);

  //left eye
  fill(255);
  ellipse(mouseX+50, mouseY+130, 100, 100);

  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR, eyeG, eyeB);
  ellipse(mouseX+50, mouseY+130, 75, 75);

  fill(255);
  ellipse(mouseX+60, mouseY+112, diam, diam);

  //right eye
  fill(255);
  ellipse(mouseX+170, mouseY+130, 100, 100);

  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR, eyeG, eyeB);
  ellipse(mouseX+170, mouseY+130, 75, 75);

  fill(255);
  ellipse(mouseX+160, mouseY+112, diam, diam);

  //nose
  fill(0);
  ellipse(mouseX+110, mouseY+180, 40, 20);
  fill(255);
  ellipse(mouseX+118, mouseY+178, 12, 5);
}

