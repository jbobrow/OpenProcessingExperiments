
PImage Panda;
PImage RL;
PImage LL;
PImage RE;
PImage LE;
PImage Rice;
PImage Morning;
PImage Lunch;
PImage Dinner;
PImage Fight;
PImage Win;

int score = 0;

float bX = 500;
float bY = 200;


float up = 1;
float  radius = 30.5;
boolean isGoingUp = true;
boolean pEat = false;

void setup() {

  size(1000, 600);

  Panda = loadImage("PandaHead.png");
  RL = loadImage("PandaRightLeg.png");
  LL = loadImage("PandaLeftLeg.png");
  RE = loadImage("PandaRightEar.png");
  LE = loadImage("PandaLeftEar.png");
  Rice = loadImage("RiceBalls.jpg");
  Morning = loadImage("PandaForest.jpg");
  Lunch = loadImage("PandaLunch.jpg");
  Dinner = loadImage("Dinner.jpg");
  Fight = loadImage("ChefTime.jpg");
  Win = loadImage("YouWin.jpg");
  
}

void draw() {
  //background(8,170,255);
  //fill(0);
  //rect(0, 0, 500, 500);
  if(score == 0) {
    
  image(Morning,0,0);
  }
  if(score == 1) {
    image(Lunch, 0,0);
  }
  if(score == 2) {
    image(Dinner, 0, 0);
  }
  if(score == 3) {
    image(Fight, 0, 0);
  }
  if(score >= 4) {
    image(Win, 0, 0);
  }
  image(Panda, mouseX - 100, mouseY - 100);
  //rotate(aangle);
  translate(0, up);
  image(RL, mouseX, mouseY);
  if (up > 4)
    isGoingUp = false;
  if (up < -4)
    isGoingUp = true;
  if (isGoingUp == true)
    up +=1; 

  else
  {
    up -=1;
  }
  image(LL, mouseX -100, mouseY);
  image(LE, mouseX -100, mouseY -90);
  image(RE, mouseX, mouseY -90);

  image(Rice, bX, bY);
  if (dist( bX, bY, mouseX, mouseY)<radius*2) {
    score = score + 1;
    bX = random(1000);
    bY = random(600);
  }
}

