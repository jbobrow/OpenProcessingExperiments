
float bx;
float by;
int boxSize = 21;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

int savedTime;
int totalTime = 5000;


void setup(){
  size(400, 400);
  bx = 80;
  by = 330;
  savedTime = millis();  

}

//chopstick variables
int xPos = 65;
//sushi variables
int yPos = 250;
int yDir=5;

void draw(){
  drawSushi1(130, 170);
  drawSushi2(190, 230);
//Platter surface
  line (75, 100, 325, 100);
  line (25, 300, 375, 300);
  line (75, 100, 25, 300);
  line (325, 100, 375, 300);
//Platter bottom
  line (25, 300, 25, 325);
  line (375, 300, 375, 325);
  line (25, 325, 375, 325);
 }
//Sushi roll 1
void drawSushi1(int xloc, int yloc) {
  fill (255, 151, 151);
  rect (90, 130, 220, 40, 8);
  line (100, xloc, 110, yloc);
  int increment = 30;
  for (int i = 0; i < 6; i++) {
    line (100 + increment, xloc, 110 + increment, yloc);
    increment += 30;
  }
}
//Sushi roll 2
void drawSushi2(int xloc, int yloc) {
  fill (255, 51, 51);
  rect (75, 190, 250, 40, 8);
  line (100, xloc, 110, yloc);
  int increment = 30;
  for (int i = 0; i < 6; i++) {
    line (100 + increment, xloc, 110 + increment, yloc);
    increment += 30;
 }
//Sushi pieces
  fill (0);
  rect (60, 250, 40, 40, 8);
  rect (110, 250, 40, 40, 8);
  rect (160, 250, 40, 40, 8);
  rect (210, 250, 40, 40, 8);
  rect (260, 250, 40, 40, 8);
  rect (310, 250, 40, 40, 8);
//Rice
  fill (255);
  rect (65, 253, 30, 10, 10);
  rect (115, 253, 30, 10, 10);
  rect (165, 253, 30, 10, 10);
  rect (215, 253, 30, 10, 10);
  rect (265, 253, 30, 10, 10);
  rect (315, 253, 30, 10, 10);
//Fish
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
 
//Chopsticks
  fill (229, 255, 204);
  rect (65, 330, 200, 10, 5);
  rect (65, 342, 200, 10, 5);
  fill (random(255), random(255), random(255));
  rect (bx, by, boxSize, boxSize, 0);
  
int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    background(random(255)); 
    savedTime = millis();
  }
  
//Dragging ze chopsticks
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    if(!locked) { 
      stroke(255); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(153);
    overBox = false;
  }

}

void mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}


