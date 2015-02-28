
PImage Panda;
PImage RL;
PImage LL;
PImage RE;
PImage LE;

float up = 1;
boolean isGoingUp = true;

void setup() {
  
  size(300,300);
  
  Panda = loadImage("PandaHead.png");
  RL = loadImage("PandaRightLeg.png");
  LL = loadImage("PandaLeftLeg.png");
  RE = loadImage("PandaRightEar.png");
  LE = loadImage("PandaLeftEar.png");
}

void draw() {
  //background(8,170,255);
  //fill(0);
  rect(0, 0, 300, 300);
  image(Panda, mouseX - 100,mouseY - 100);
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
  image(LE, mouseX -100, mouseY-90);
  image(RE, mouseX , mouseY -90);
}

