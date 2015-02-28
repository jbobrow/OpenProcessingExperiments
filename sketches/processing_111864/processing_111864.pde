
Guy guy; 
Enviro enviro;

int[] flowers = new int[20];

int sunX = 0;
int sunY = 0;
int sunSpeed = 5;
float sunAngle = 0;

color backRGB = color (0, 0, 255); 

float eyeR;
float eyeG;
float eyeB;

int leftarmX;
int leftarmY;
int rightarmX;
int rightarmY;

int flowersX;
int flowersY;

int flowerR;
int flowerG;
int flowerB;
int flowerA;

float flowerWidth;
float flowerHeight;

boolean cloud = false;

void setup() 
{
  size (400, 400);
  smooth();
  noStroke();
  noLoop();
  frameRate(50);
  
  guy = new Guy();
  enviro = new Enviro();

//  //flowers initializing
//  for (int i = 0; i < flowers.length; i++) {
//    flowers[i] = flowers[i];
//  }
}

void draw() 
{
  background (backRGB);  //local color variable for blue background
  stroke(255);

  if (cloud) {
    clouds();
  }
  else {
    bouncingSun();
  }

  enviro.display();
  guy.display();
}

class Guy {
  void display() {

    strokeWeight(3);
    line(160, 300, 240, 300); //legs
    line(240, 300, 260, 320); //right
    line(160, 300, 140, 320); //left

    leftarmX = (int) random(100, 110);  //left arm
    leftarmY = (int) random(100, 110);
    line(200, 180, 170, 190); 
    line(170, 190, leftarmX, leftarmY);

    rightarmX = (int) random(300, 310);  //right arm
    rightarmY = (int) random(100, 110);
    line(200, 180, 230, 190); //right arm
    line(230, 190, rightarmX, rightarmY);

    stroke(255);
    line(200, 150, 200, 300); //body

    stroke(255);                  //head
    strokeWeight(3);
    fill(255, 204, 150);              
    ellipse(200, 100, 100, 100);

    stroke(0);                          //eyes
    eyeR = random(255);
    eyeG = random(255);
    eyeB = random(255);
    fill(eyeR, eyeG, eyeB);           
    ellipse(225, 90, 30, 40);
    ellipse(175, 90, 30, 40);
    fill(eyeR, eyeG, eyeB);      // pupils
    ellipse (175, 90, 10, 10);
    ellipse (225, 90, 10, 10);

    strokeWeight(3);       //mouth
    line(180, 125, 220, 125);
    fill(250, 0, 0);
    rectMode(CORNER);
    rect(200, 125, 10, 15);
  }
}

class Enviro {
  void display() {

    rectMode(CORNER); //grass
    fill(0, 250, 0);
    rect(0, 320, 400, 80);

    //random flowers
    for (int i = 0; i < flowers.length; i++) {
      flowers[i] = flowers[i];

      flowersX= (int) random(0, 400);  
      flowersY= 320;
      flowerWidth = (int) random (10, 30);
      flowerHeight = (int) random (10, 30);
      flowerR = (int) random(255);
      flowerG = (int) random(255);
      flowerB = (int) random(255);
      flowerA = (int) random(100);
      strokeWeight(1);
      line (flowersX, flowersY, flowersX, 290);
      fill(flowerR, flowerG, flowerB);
      ellipse(flowersX, 290, flowerWidth, flowerHeight);
    }
  }
}
void clouds()
{
  stroke(0);        //clouds
  fill(125);  
  ellipse(80, 30, 100, 50);
  ellipse(150, 30, 100, 50);
  ellipse(260, 30, 100, 50);
  ellipse(300, 30, 100, 50);
}

void bouncingSun()
{
  fill (250, 250, 0);      //sun
  sunX = sunX + sunSpeed;

  if ((sunX > width) || (sunX < 0)) {    //bouncing sun
    sunSpeed = sunSpeed * -1;
    backRGB = backRGB + 60;
  }
  //  sunAngle = (sunAngle + 0.03)%PI;
  ellipse (sunX, sunY, 180, 180);
}

void keyPressed()  //clouds
{
  if (key == ' ') {
    redraw();
  } 
  else {
    cloud = !cloud;
    redraw();
  }
}



