
//TICK TOCK MR ANDERSON

//timer
Timer timer;


float x;
float y;

float recty= -25;

int count = 0;

//timer class
class Timer {
 
  int savedTime; 
  int totalTime;
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    savedTime = millis(); 
  }

  boolean isFinished() { 
 
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
  

void setup() {
  noStroke();
  size(400, 400);
  background(0, 100, 0);
  timer = new Timer(1000);
  timer.start();
}


void draw() {

  float x = (random(350));
  float y = (random(350));
  

  if (timer.isFinished()) {
    background(color(random(0), random(100, 255), random(0)));
    //add some sort of somthing else
    fill(0);
    ellipse(x, y, 20, 12);
    ellipse(x+25, y, 20, 12);
    stroke(0);
    strokeWeight(3);
    line(x, y, x+20, y);
    println("One second has passed");
    
    //rectangle
        noStroke();

  recty+=25;
  if(recty >= 400){
    recty=0;
  }
   fill(color(random(0),random(100,255),0));
   rect(0,recty,400,25);

    noStroke();

    //counter for second time, every 10 seconds
    count++;
    timer.start();
  }

  //timer for mr. smith
  if (count == 10) {
    fill(255);
    textSize(30);
    text("TICK TOCK,", 120, 170);
    text("Mr, Anderson", 120, 220);
    println("TICK TOCK, Mr. Anderson");
    fill(0);
    count = 0;
  }
  //changing it after 10 seconds?

}

