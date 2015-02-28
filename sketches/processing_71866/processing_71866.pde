
//Eric (Kewen) Wang
//Introduction to Digital Media Fall 2012
//Section B
//9/8/12
Timer timer;
void setup() {
  size(1200, 600);
  background(0, 0, 0);
  timer = new Timer(50);
}


boolean start = false;
int maxR = 15;
int imax = -maxR;

void draw() {
  if (start && timer.isFinished())
  {   

    imax++;
    timer.start ();
  }
  fill(0);
  rect(0,0,1200,600);
  
  for (int i = 0; i < 1200; i = i+90) {

    for (int j = -90; j < 600+90; j = j+90) {

      fill(255);
      int column = i/90;// stands for column of the screen's matrix.
      int r = Math.abs(column-imax);// Stands for radius.

      if (r<maxR)
      {
        stroke(0 +(int)Math.max(3, Math.sqrt(r)*r*(255/maxR/Math.sqrt(maxR)))+10);
        
        int maxX = 75;//The maximum value of x that x will iterate to.
        for(int x = 0;  x< maxX ; x++)
        {
          int curv = 0;
          if(10 - x > 0)
          {
            curv = (int)(Math.sqrt (10*10 - (10 - x)*(10-x))); 
            curv = 10-curv;
          }
          int diff = x - maxX +10;
          if(diff > 0)
          {
            curv = (int)(Math.sqrt (10*10 - (diff)*(diff)));  
            curv = 10 - curv;
          }
          int offsetY = (int)(maxX*cos(radians( ((i+x)-(imax*90))*360/(maxR*2*90) )))-15+curv;
          rect(i + x, j + offsetY , 1, maxX-curv*2);
        }      
      }
      else {
        fill(255);
        stroke(255);
        rect(i, j, 75, 75, 10, 10);
      }

    }//end of inside for loop.
  }// end of outside for loop.


}// end of draw function

void mouseClicked() {
  imax=-maxR+1;
  start = true;
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


