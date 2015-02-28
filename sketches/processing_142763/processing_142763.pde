
Crit[] crits;
Timer timer;

void setup() {            //setting up canvas and newCrit
  size(600,600);
  frameRate(30);
  timer = new Timer(1000); //critter appears every second
  timer.start(); //Start the timer

  crits = new Crit[0];
}

void draw() {            // drawing on screen and calling differnt layers to make it happen
  background(255);
  mouseX=mouseX-(mouseX%100); //grid
  mouseY=mouseY-(mouseY%100); //grid

  if (timer.isFinished()) { // If 1000ms stopped
    timer.start(); //start

  Crit myCrit = new Crit(mouseX,mouseY); 
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
   
  boolean isFinished() {   //The function isFinished() returns true if 2000 ms have passed.
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
  int o;
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
    o = random(50,100);
    xSpeed = int(random(-12,12));
    ySpeed = int(random(-12,12));

  }
 
void display() {              //what my critter is
  fill(255,o);
  strokeWeight(scw);
  stroke(sc,o);
  triangle(botleftx,botlefty,botrightx,botrighty,topx,topy);
  line(botleftx,botlefty,centerPTx,centerPTy);
  line(centerPTx,centerPTy,topx,topy);
  line(centerPTx,centerPTy,botrightx,botrighty);


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
  /*
  if (key=='w')     //move up
  {
    up();
  }
  if (key=='a')    //move left
  {
    left();
  }
  if (key=='s')    //move down
  {
    down();
  }
  if (key=='d')    //move right
  {
    right();
  }
}
 
void up(){    //move up
  if (topy > height) 
  centerPTy--;
  botlefty--;
  botrighty--;
  topy--;
}
 
void left(){    //move left
  if (botleftx > width)
  centerPTx--;
  botleftx--;
  botrightx--;
  topx--;
}
 
void down() {    //move down
  if (topy > height)
  centerPTy++;
  botlefty++;
  botrighty++;
  topy++;
}

void right() {    // move right
  if (botleftx > width)
  centerPTx++;
  botleftx++;
  botrightx++;
  topx++;
} 
*/


//void frame () {    //create white frame to hide instructions when saved
  //fill(200);
  //noStroke();
  //rect(0,0,52,600);
  //rect(0,0,600,52);
  //rect(548,0,600,600);
  //rect(0,548,600,600);
//}
/* 
void instructions () {    //create uniform boarder & display instructions
  fill(200,200,200,100);
  noStroke();
  rect(0,575,1000,575);
  rect(0,0,1000,25);
  rect(0,0,25,600);
  rect(975,0,1000,600);
  textFont(f);
  fill(100);
  textAlign(CENTER);
  text("Use Mouse to draw  |  l = faded layer  |  r = reset canvas  |  s = save image",width/2, 590);
 
}
*/





