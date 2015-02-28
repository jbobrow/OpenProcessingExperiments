
//Übung 2.3 Bouncing Ball 

int xPos = 30;
int yPos = 30;
int speed = 100;
int state = 0;


void setup () {
  size(500, 500);
  background (255);
  fill(0);
  smooth();
}

void draw () {
  background(255);
  // state 0 --> links nach rechts
  if (state == 0) {
    xPos = xPos + 10;
    if (xPos >= width-30) {  
      xPos = width-30 ;
      state = 1;
    }
  }

  // state 1 --> oben nach unten
  if (state == 1) {
    yPos = yPos + 10;  
    if (yPos >= height-30) {  
      yPos = height-30 ;
      state = 2;
    }
  }

  // state 2 --> rechts nach links
  if (state == 2) {
    xPos = xPos - 10;  
    if (xPos <= 30) {  
      xPos = 30;
      state = 3;
    }
  }

  // state 3 -->  unten nach oben
  if (state == 3) {
    yPos = yPos - 10;  
    if (yPos <=30) {  
      yPos = 30 ;
      state = 0;
    }
  }




  ellipse(xPos, yPos, 60, 60);
}



 
 void mouseReleased(){
 saveFrame("ball2.png");
 } 
 
 

