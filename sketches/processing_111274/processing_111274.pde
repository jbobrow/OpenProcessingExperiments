
void setup() {
  size(400, 400);
  background (0);
  smooth();
  stroke (255);
}

class backgroundTimer{
  int totalTime = 5000; 
  int savedTime = millis();
  int passedTime = millis() - savedTime;
  
  backgroundTimer(int totalTime, int savedTime, int passedTime){
    if (passedTime > totalTime) {
    background(random(255));
    savedTime = millis();
    }
 }
}
 
//chopstick variables
int xPos = 65;
//sushi variables
int yPos = 250;
int yDir=5;
 
void draw() {
  drawSushi1(130, 170);
//platter surface
  line (75, 100, 325, 100);
  line (25, 300, 375, 300);
  line (75, 100, 25, 300);
  line (325, 100, 375, 300);
   
//platter bottom
  line (25, 300, 25, 325);
  line (375, 300, 375, 325);
  line (25, 325, 375, 325);
}
   
//sushi roll 1
void drawSushi1(int xloc, int yloc) {
  fill (255, 151, 151);
  rect (90, 130, 220, 40, 8);
  line (100, xloc, 110, yloc);
  int increment = 30;
  for (int i = 0; i < 6; i++) {
    line (100 + increment, xloc, 110 + increment, yloc);
    increment += 30;
  }
    
//sushi roll 2
  fill (255, 51, 51);
  rect (75, 190, 250, 40, 8);
  line (100, 190, 110, 230);
  line (130, 190, 140, 230);
  line (160, 190, 170, 230);
  line (190, 190, 200, 230);
  line (220, 190, 230, 230);
  line (250, 190, 260, 230);
  line (280, 190, 290, 230);
   
//sushi pieces
  fill (0);
  rect (60, 250, 40, 40, 8);
  rect (110, 250, 40, 40, 8);
  rect (160, 250, 40, 40, 8);
  rect (210, 250, 40, 40, 8);
  rect (260, 250, 40, 40, 8);
  rect (310, 250, 40, 40, 8);
//rice
  fill (255);
  rect (65, 253, 30, 10, 10);
  rect (115, 253, 30, 10, 10);
  rect (165, 253, 30, 10, 10);
  rect (215, 253, 30, 10, 10);
  rect (265, 253, 30, 10, 10);
  rect (315, 253, 30, 10, 10);
//fish
  yPos=yPos+yDir;
  if (yPos<height)
  {
    yDir=-yDir;
  }
  fill(255, 120, 120);
  rect (70, yPos, 20, 5, 10);
  rect (120, yPos, 20, 5, 10);
  rect (170, yPos, 20, 5, 10);
  rect (220, yPos, 20, 5, 10);
  rect (270, yPos, 20, 5, 10);
  rect (320, yPos, 20, 5, 10);
 
//chopsticks
  fill (229, 255, 204);
  rect (xPos, 330, 200, 10, 5);
  xPos=xPos+1;
  if (xPos>width)
  {
    xPos=-1;
  }
  rect (xPos, 342, 200, 10, 5);
   xPos=xPos+1;
  if (xPos>width)
  {
    xPos=-1;
  }
  fill (random (255), random (255), random (255));
  rect (80, 330, 20, 22, 0);
   
 //sushi text
 fill(255);
 float x = random(0,400);
 float y = random(0,400);
 float a = random(10,200);
 float b = random(10,200);
 float name = random(50);
 textSize(name);
 text("Sushi Time!",x,y,a,b);
 
}


