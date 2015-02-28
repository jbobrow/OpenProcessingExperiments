
//everything is controlled by square spacing
//yay

int prevSec;
int millisRolloverTime;
int Secs;
int xpos;
int xcount;

void setup() {
  size(1400, 500);
  noStroke();
  
}

void draw() {
  smooth();

  int H = hour();
  int M = minute();
  int S = second();
  int mils = millis() - millisRolloverTime;
  
  background (0);
  backColour(25, 25);
  xcount++;
  Missile(); 
  pushMatrix();
  translate (50, 100);
  popMatrix();
}


void backColour(int x, int y) {
  int H = hour();
  int M = minute();
  
  //sets the 24 hour clock to 12 hours
  if (H == 0) {
    H = 12;
  }
  else if (H == 12) {
  }
  else {
    H = H;
  }

  //creates the minute squares
  for (int i = 0; i <= 1220; i += 20) {
    //creates the hour squares
    for (int j = 0; j <= 480 ; j +=35) {
      if ((i > 5) && (i < 1380)) {
        if ((j > 5) && (j <440 )) {
          noFill();
          strokeWeight(2);
          stroke(255);
          //fills the square by the  hour
          if ((j/35) == H) {
            //fills a square by the minute
            if ((i/20) <= M+1) {
              fill(255);
              rect(i, j, 15, 15);
            }
            else {
              noFill();
              rect(i, j, 15, 15);
            }
          }
          else {
            noFill();            
            rect(i, j, 15, 15);
          }
        }
      }
    }
  }
}

void Missile() {
  int H = hour();
  int M = minute();
  int S = second();

  if (prevSec != S) {
    millisRolloverTime = millis();
    xcount = 0;
  }

  prevSec = S;
  //stops the red missile at minutes
  xpos = 20 + xcount*20;

  if (xcount > M) {
    xcount = 0;
  }

  noStroke();
  fill(225, 25, 25);
  if (H == 0) {
    H = 12;
  }
  else if (H == 12) {
  }
  else {
    H = H;
  }
//the x co-ordinate is controlled by the xposition and number of minutes
//the y co-ordinate is controlled by the hour and moves by the distance between the squares
  rect(xpos, 35*H, 15, 15);
}
