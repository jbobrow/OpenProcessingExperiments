

//Shake-A-Baby, by Juan Pablo Patino

PFont myFont;
int fontPosY = 375;

int timeCrying = 2000;
int timeHappy = 250;
int lastSavedTime;
Boolean baby_is_Happy = false;

PImage babyH;
PImage babyC;

int ang1Deg= 45;
int amplitude1 = 100;

float babyX= 200;
float babyY= 200;
float babyHY = 0;

//----------------------SETUP

void setup() {
  size(400, 400);
  smooth();

  lastSavedTime = millis();

  babyH = loadImage("babiesHappy.png");
  babyC = loadImage("babiesCrying.png");  
  
}


//----------------------------------------DRAW

void draw() {

  background(50, 131, 227);
  baby(int(width/2), int(height/2));
  
  fill(255);
  myFont=createFont("Helvetica",18,true);
  textFont(myFont);
  text("Play with baby and make him feel better.", 40, fontPosY);
}

//-----------------------------------------BABY w/ timer on between happy/crying

void baby(int babyX, int babyY) {
  imageMode(CENTER);  
  if (baby_is_Happy == true) {
    imageMode(CENTER);
    image(babyH, babyX, babyY); //Here's our happy baby
    if (timeHappy < millis() - lastSavedTime) {
      baby_is_Happy = false;
      lastSavedTime = millis();
    }
    } else {
      imageMode(CENTER);
      image(babyC, babyX, babyY); //Here's our crying baby
      if (timeCrying < millis() - lastSavedTime) {
        baby_is_Happy = true;
        lastSavedTime = millis();
      }
    }
}

//-----------------------------------MOUSE HOLD, stop this baby from crying

void mouseDragged() {
  
  image(babyH, babyX, babyY);
}  



