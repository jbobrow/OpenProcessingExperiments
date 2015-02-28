
Crit[] crits;
Timer timer;




void setup() {            //setting up canvas and newCrit
  size(600,600);
  frameRate(30);
  timer = new Timer(305); //critter appears every second
  timer.start(); //Start the timer

  crits = new Crit[0];
}

void draw() {            // drawing on screen and calling differnt layers to make it happen
  background(255);
  xValue=mouseX-(mouseX%100)+50; //grid
  yValue=mouseY-(mouseY%100)+50; //grid

  if (timer.isFinished()) { // If 500ms stopped
    timer.start(); //start

  Crit myCrit = new Crit(xValue,yValue); 
  crits = (Crit[]) append(crits, myCrit);
  }
  for(int i=0; i<crits.length; i++){
  crits[i].display();
  crits[i].move();

}
}

class Timer {
   
  int savedTime; //When timer started
  int totalTime; //How long 
   
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  void start() { //start
    savedTime = millis();  //saving time that has passed
  }
   
  boolean isFinished() {   //The function isFinished() returns true if 305 ms have passed.
    int passedTime = millis()- savedTime;     //Check how much time has passed
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
  

class Crit {
  int centerPTx;
  int centerPTy;
  int botleftx;
  int botlefty;
  int botrightx;
  int botrighty;
  int topx;
  int topy;
  int sc;
  int f;
  int o;
  int o2;
  int red;
  int blue;
  int green;
  float xSpeed;
  float ySpeed;
  
  
  Crit(int centerX, int centerY) {
    centerPTx= centerX; 
    centerPTy= centerY; 
    botleftx = centerPTx -50;
    botlefty = centerPTy +50;
    botrightx = centerPTx +50;
    botrighty = centerPTy +50;
    topx = centerPTx;
    topy = centerPTy -50;
    sc = random(100,150);
    scw = 2;
    f = 255;
    o = random(200,255);
    o2 = random(50,100);
    xSpeed = int(random(-12,12));
    ySpeed = int(random(-12,12));
    red = floor(random(100,175));
    blue = floor(random(100,175));



  }
  

 
void display() {              //what my critter is
  fill(f,o);
  strokeWeight(scw);
  stroke(red,100,blue,o2);
  triangle(botleftx,botlefty,botrightx,botrighty,topx,topy);
  line(botleftx,botlefty,centerPTx,centerPTy);
  line(centerPTx,centerPTy,topx,topy);
  line(centerPTx,centerPTy,botrightx,botrighty);

  if (o2 > o) {
    o2 = o2+ 3;
  } else {

  }
  if (o2 < o) {
   o2-- ;
  } else {
  
  }
}


void move() {          // random movement collision to canvas size
  centerPTx = centerPTx+xSpeed;
  centerPTy = centerPTy+ySpeed;
  
  if (centerPTx > width || centerPTx < 0) {
    xSpeed *= -1;
  }
  
  if (centerPTy > height || centerPTy < 0) {
    ySpeed *= -1;
  }

} 
}







