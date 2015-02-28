
PImage world;
PImage seed;
PImage wateringCan;
PImage crate;
PImage heart;
PImage plant;
PImage Robot;
PImage robotSmile;

int yPos = 585;
int yPos2;
int xPos =100;

boolean seedCollected = false;
boolean canCollected = false;
boolean plantGrow = false;
boolean offLimits = true;
boolean happiness = false;
boolean happyRobot = false;

void setup () {
  size (505,715);
  world = loadImage ("World.jpg");
  seed = loadImage ("seed.png");
  wateringCan = loadImage ("wateringCan.png");
  crate = loadImage ("crate.png");
  heart= loadImage ("heart.png");
  plant = loadImage ("plant.png");
  Robot = loadImage ("Robot.png");
  robotSmile = loadImage ("robotSmile.png");
  world.resize(world.width-50, world.height-50);
  cursor(CROSS);
}
  
void draw (){
  //constrain(mouseX,30,470);
  int xVar = (mouseX-xPos)/20;
  xPos = xPos +xVar;
  int yVar = (mouseY-yPos)/20;
  yPos = yPos + yVar;
  yPos2 = yPos;
  
    image (world,0,0);
    //image (heart,320,0);
    //image (crate,419,555);
    image (seed,300,440);
    image (wateringCan,370,340);
    image (Robot, xPos-40-random(2), yPos-70);
  
  if (happyRobot) {
    image (robotSmile, xPos-40-random(2), yPos-70);
  }else{
    image (Robot, xPos-40-random(2), yPos-70);
  }
    
  
  if(mousePressed && mouseX>310 && mouseX<330 &&mouseY>440 && mouseY<490){
   seed.resize(0,0);
   seedCollected = true;
  }
  if(mousePressed && mouseX>380 && mouseX<450 &&mouseY>355 && mouseY<395){
   wateringCan.resize(0,0);
   canCollected = true;
  }
  if(mousePressed && seedCollected && canCollected && mouseX>100 && mouseX<165 &&mouseY>315 && mouseY<350){
    plantGrow = true;
  }
  if(mousePressed && seedCollected && canCollected && plantGrow && mouseX>340 && mouseX<435 &&mouseY>20 && mouseY<110){
    happiness = true;
    happyRobot = true;
  }
  
  if (offLimits) {
    //constrain(yPos,100,200);
  }
  
  if (plantGrow){
    image (plant, 88,-10);
    offLimits = false;
  }
  if (happiness) {
    image (heart, random(width), random(height));
    image (heart, random(width), random(height));
    image (heart, random(width), random(height));
    image (heart, random(width), random(height));
    image (heart, random(width), random(height));
    image (heart, random(width), random(height));
    image (heart, random(width), random(height));
  }else {
    image (heart,320,0);
  }

}
  

