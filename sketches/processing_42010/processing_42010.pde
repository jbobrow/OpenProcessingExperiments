
//assignment 3.. Smiley without a mouth. Click the mouse and it blinks.


//variables
float eyesX = map(mouseX, 0, 300, 10, 290);
float eyesY = map(mouseY, 0, 300, 40, 150);
float blink = 80;
float dimG  = 250;
//int HorPers = int(map(mouseX, 0, 300, 1, 80));
//int VerPers = int(map(mouseY, 0, 300, 1, 80));
float luck = random(0,10);

//dont want no cursor
void setup () {
  noCursor();
  size(300, 300);
  smooth();
  noStroke();
}

void draw () {
  
  //constrain range of mouse position.
  mouseX = constrain(mouseX,100,200);
  mouseY = constrain(mouseY,100,150);
  
  background(0);

  //random number determines color of 'face'.
  if (luck < 5) {
    fill(255, 250, 0);
  } else {
    fill(255,dimG,0);
  }
  ellipse (width/2, height/2, 250, 250);
  

  //on mousePress, initiate BLINK animation.
  fill(0);
  if (mousePressed) {
    ellipse(mouseX - 35, mouseY - 20, 40, blink);
    ellipse(pmouseX + 35, mouseY - 20, 40, blink);
  } else {
    ellipse (mouseX - 36, mouseY - 21, 40, 80);
    ellipse (pmouseX + 35, mouseY - 20, 40, 80);
  }

//Blink Animation: If Button NOT pressed, restore original position of eyes.
blink = blink - 10;
if (!mousePressed) {
  blink = 80;}
  blink = constrain (blink, 1, 80);
  
 
dimG = dimG - 1;
if (dimG == 0) {
  dimG = dimG + 1;
  dimG = constrain (dimG,0,250);
}
    
}


