
// Declare and initialize all variables

int r = 0;
int g = 0;
int b = 0;

int speed = 3;

int canvasX = 200;
int canvasY = 200;

int bodyWidth = 31;
int bodyHeight = 250;

int headDiam = 31;

int beakR = 255;
int beakG = 185;
int beakB = 5;

int eyeColor = 0;
int eyeDiam = 5;

int redBodyX = 70;
int redBodyY = 50;

int redBeakX1 = 70;
int redBeakX2 = 70;
int redBeakX3 = 60;

int redWingX1 = 100;
int redWingY1 = 160;
int redWingX2 = 115;

int redBirdR = 255;
int redBirdG = 76;
int redBirdB = 5;

int greenBodyX = 150;
int greenBodyY = 80;

int greenBeakX1 = 150;
int greenBeakX2 = 150;
int greenBeakX3 = 140;

int greenWingX1 = 180;
int greenWingY1 = 160;
int greenWingX2 = 195;

int greenBirdR = 2;
int greenBirdG = 211;
int greenBirdB = 112;

int yellowBodyX = 20;
int yellowBodyY = 100;

int yellowBeakX1 = 51;
int yellowBeakX2 = 51;
int yellowBeakX3 = 61;

int yellowWingX1 = 21;
int yellowWingY1 = 160;
int yellowWingX2 = 5;

int yellowBirdR = 217;
int yellowBirdG = 255;
int yellowBirdB = 5;


void setup(){
  size(canvasX,canvasY);
  smooth();
}


void draw(){
  
  // Make backround change depending on location of mouse
  
  background(r,g,b);
  
   if (mouseX > 0 && mouseX < width/3) { 
     r = r + 1;
   } else {
     r = r - 1;
   }
  
   if (mouseX > width/3 && mouseX < width - width/3) { 
     g = g + 1;
   } else {
     g = g - 1;
   }
  
   if (mouseX > width - width/3 && mouseX < width) { 
     b = b + 1;
   } else {
     b = b - 1;
   }
   
   r = constrain(r,0,50);
   g = constrain(g,0,50);
   b = constrain(b,0,50);
  
  
  // Draw red bird
    
  //neck
  noStroke();
  fill(redBirdR,redBirdG,redBirdB);
  rect(redBodyX,redBodyY,bodyWidth,bodyHeight);
  //head
  noStroke();
  fill(redBirdR,redBirdG,redBirdB);
  ellipseMode(CORNER);
  ellipse(redBodyX,redBodyY-14,headDiam,headDiam);
  //beak
  noStroke();
  fill(beakR,beakG,beakB);
  triangle(redBeakX1,redBodyY+10,redBeakX2,redBodyY+20,redBeakX3,redBodyY+15);
  //eye
  noStroke();
  fill(eyeColor);
  ellipse(redBodyX + 10, redBodyY, eyeDiam, eyeDiam);
  //wing
  stroke(redBirdR,redBirdG,redBirdB);
  line(redWingX1, redWingY1, redWingX2, (constrain(mouseY,145,175)));
  line(redWingX1, redWingY1 - 5 ,redWingX2, (constrain(mouseY,145,175))-5);
  line(redWingX1, redWingY1 - 10 ,redWingX2, (constrain(mouseY,145,175))-10);
  
  // Make neck grow and shrink when mouse is over red bird
  if (mouseX > width/3 && mouseX < width - width/3) { 
  redBodyY = redBodyY + speed;
  if (redBodyY < 25 || redBodyY > 125) {
    speed = speed * -1;
  }
  }
  
  // Draw green bird
  
  //neck
  noStroke();
  fill(greenBirdR,greenBirdG,greenBirdB);
  rect(greenBodyX,greenBodyY,bodyWidth,bodyHeight);
  //head
  noStroke();
  fill(greenBirdR,greenBirdG,greenBirdB);
  ellipseMode(CORNER);
  ellipse(greenBodyX,greenBodyY-14,headDiam,headDiam);
  //beak
  noStroke();
  fill(beakR,beakG,beakB);
  triangle(greenBeakX1,greenBodyY+10,greenBeakX2,greenBodyY+20,greenBeakX3,greenBodyY+15);
  //eye
  noStroke();
  fill(eyeColor);
  ellipse(greenBodyX + 10, greenBodyY, eyeDiam, eyeDiam);
  //wing
  stroke(greenBirdR,greenBirdG,greenBirdB);
  line(greenWingX1, greenWingY1, greenWingX2, (constrain(mouseY,145,175)));
  line(greenWingX1, greenWingY1 - 5 ,greenWingX2, (constrain(mouseY,145,175))-5);
  line(greenWingX1, greenWingY1 - 10 ,greenWingX2, (constrain(mouseY,145,175))-10);
  
  // Make neck grow and shrink when mouse is over green bird
  if (mouseX > width - width/3 && mouseX < width) { 
  greenBodyY = greenBodyY + speed;
  if (greenBodyY < 25 || greenBodyY > 125) {
    speed = speed * -1;
  }
  }
  
  
  // Draw yellow bird
  
  //neck
  noStroke();
  fill(yellowBirdR,yellowBirdG,yellowBirdB);
  rect(yellowBodyX,yellowBodyY,bodyWidth,bodyHeight);
  //head
  noStroke();
  fill(yellowBirdR,yellowBirdG,yellowBirdB);
  ellipseMode(CORNER);
  ellipse(yellowBodyX,yellowBodyY-14,headDiam,headDiam);
  //beak
  noStroke();
  fill(beakR,beakG,beakB);
  triangle(yellowBeakX1,yellowBodyY+10,yellowBeakX2,yellowBodyY+20,yellowBeakX3,yellowBodyY+15);
  //eye
  noStroke();
  fill(eyeColor);
  ellipse(yellowBodyX + 16, yellowBodyY, eyeDiam, eyeDiam);
  //wing
  stroke(yellowBirdR,yellowBirdG,yellowBirdB);
  line(yellowWingX1, yellowWingY1, yellowWingX2, (constrain(mouseY,145,175)));
  line(yellowWingX1, yellowWingY1 - 5 ,yellowWingX2, (constrain(mouseY,145,175))-5);
  line(yellowWingX1, yellowWingY1 - 10 ,yellowWingX2, (constrain(mouseY,145,175))-10);
  
  // Make neck grow and shrink when mouse is over yellow bird
  if (mouseX > 0 && mouseX < width/3) { 
  yellowBodyY = yellowBodyY + speed;
  if (yellowBodyY < 25 || yellowBodyY > 125) {
    speed = speed * -1;
  }
  }

}

                                
