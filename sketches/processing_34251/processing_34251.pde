
/* Rachel's Circle Shooter
  CIS 1600, Summer 2011
  Project 2
*/

PFont normalFont;
PFont smallFont;
PFont bigFont;

int circleDiam = 17;
boolean shoot = false;

int randx() {
  return int(random(600));
}

int[] xCoordinates = {(randx()), (randx()), (randx()), (randx()), (randx())};
int[] yCoordinates = {0, 0, 0, 0, 0};

void setup() {
  size(600, 650);
  
  String[] fontList = PFont.list();
  bigFont = createFont(fontList[0], 32);
  normalFont = createFont(fontList[0], 20);
  smallFont = createFont(fontList[0], 14);
  
} //end of setup

void draw() {
   background(#1B0AC1);
   fill(#FF00D1);
   stroke(#FF00D1);
   triangle(mouseX+15, 575, mouseX-15, 575, mouseX, 550);
   
   if (shoot == true) {
     circleShot(mouseX);
     shoot = false;
   }//end of if statement
   
   circleDrop();
   gameOver();
}//end of draw()



void mousePressed() {
  shoot = true;
}



void circleDrop() {
  stroke(#ffffff);
  fill(#ffffff);
  
  for (int i=0; i<5; i++) {
    ellipse(xCoordinates[i], yCoordinates[i]++, circleDiam, circleDiam);
  }//end of if statement

}//end of circle dropper



void circleShot(int shot) {
  boolean hit = false;
  
  for(int i=0; i<5; i++){
    
    if((shot >= (xCoordinates[i]-circleDiam/2)) && shot <= (xCoordinates[i]+circleDiam/2)){
      hit = true;
      strokeWeight(2);
      stroke(#FBFF40);
      fill(#FBFF40);
      line(mouseX, 550, mouseX, yCoordinates[i]);//makes the line each time the user shoots
      ellipse(xCoordinates[i], yCoordinates[i], circleDiam+25, circleDiam+25);//makes a second circle around each circle successfully shot
      xCoordinates[i] = randx();
      yCoordinates[i] = 0;
    }//end of if statement
  }//end of for loop
  
  if (hit == false) {
    line(mouseX, 550, mouseX, 0);
  }//end of if statement
  
}// enf of circleShot();



void gameOver() {
  for (int i=0; i<5; i++) {
    
    if (yCoordinates[i] == 550) {
      background(#A71B24);
      stroke(#3EFA35);
      textFont(bigFont);
      textAlign(CENTER);
      text("Game Over!", width/2, height/2);
      noLoop();
    }//end of if statement
    
  }//end of for loop
  
}//end of gameOver()

