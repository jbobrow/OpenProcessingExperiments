
//Eric (Kewen) Wang Part2
//Introduction to Digital Media Fall 2012
//Section B
//9/8/12
Timer timer;
int timerLength = 5; //Time for one iteration of the animation.

void setup() {
  size(1200, 600);
  background(0, 0, 0);
  timer = new Timer(timerLength);
  mouseC = new int[10];
  mouseR = new int[10];
  circleR = new int[10];

  for (int i = 0; i<10; i++)
  {
    mouseC[i]  = 0;
    mouseR[i]  = 0;
    circleR[i] = 0;
  }
}


boolean start = false;
int maxR = 12;
int imax = -maxR;

void draw() {
  if (timer.isFinished())
  {   
    if (start)
      imax+=0;
    for (int i = 0; i < circleGoing; i++)
    {
      circleR[i]+=10;
    }
    timer.start ();
  }
  fill(0);
  rect(0, 0, 1200, 600);

  for (int i = 0; i < 1200; i = i+25) {

    for (int j = 0; j < 600; j = j+25) {

      fill(255);
      int column = i/100;// stands for column of the screen's matrix.
      int gr = 3;
      int circleVal = 255;

      double distance;
      for (int k = 0; k < circleGoing; k++)
      {
        distance = Math.sqrt((mouseC[k]-i-25)*(mouseC[k]-i-25) + (mouseR[k]-j-25)*(mouseR[k]-j-25));
        if (distance >= circleR[k] -gr*100 && distance < circleR[k] + gr*100 )
        {
          circleVal = (int)(Math.min( circleVal, Math.abs(circleR[k] - distance)*255/(gr*100)));
        }
      }

      int r = Math.abs(column-imax);// Stands for radius.
      if (column == imax) {
        fill(0); 
        stroke(255);
        rect(i-7.5, j-7.5, 25, 25, 8, 8);
      }
      else if (r<maxR)
      {
        fill(Math.min(circleVal, (r*(255/maxR) )));
        stroke(255);
        rect(i-(7.5*r/maxR), j-(7.5*r/maxR), 75+15-(15*r/maxR), 75+15-(15*r/maxR), 10, 10);
      }
      else {
        fill(circleVal);
        stroke(255);
        rect(i, j, 25, 25, 8, 8);
      }
    }//end of inside for loop.
  }// end of outside for loop.
}// end of draw function
int [] mouseC, mouseR;

int circleGoing = 0;
int [] circleR;
int nextCircleI = 0; //The index of the next circle.
void mouseClicked() {
  imax  = -maxR;
  start = true;

  if (circleGoing < 10)
  {
    circleGoing ++;
  }
  mouseC[nextCircleI] = ((int)mouseX)/25*25;
  mouseR[nextCircleI] = ((int)mouseY)/25*25;
  circleR[nextCircleI] = 0;

  nextCircleI = (nextCircleI+1)%10;// Increase the next circle index.
  // Perform modular arithmetic if the variable escapes the bounds.
}




class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }

  int passedTime() {
    return (millis() - savedTime);
  }

  boolean isFinished() { 

    int passedTime = millis()- savedTime; // Check how much time has passed
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}

void keyPressed(){
if(key == 's'){
save("ericWang.png");
}
}

