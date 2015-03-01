
int time = millis();
float r=255;
float b=0;
Timer timer;

 
void setup()
{
  size(400, 400);
  smooth();
  frameRate(30);
    background(#890707);
  timer = new Timer(5000);
  timer.start();
}
 
void draw(){
 if (timer.isFinished()) {
    background(random(255));
    timer.start();
  }
  strokeWeight(2);
  stroke(0);
   heart(150,150);
   r-=0.5;
 if(r<2){
    r=255;
  }
if(b<3){
b=0;
  }


}
void heart (int x, int y) { 
    smooth();
    noStroke();
     fill(r,0,b);
    beginShape();
    vertex(50+x, 25+y);
    bezierVertex(50+x, -5+y, 120+x, 5+y, 50+x, 60+y);
    vertex(50+x, 25+y);
    bezierVertex(50+x, -5+y, -20+x, 5+y, 50+x, 60+y);
    endShape();
      
}

void mousePressed() {
  stroke(0);
  fill(100);
  rectMode(CENTER);
  rect(200,185,150,100);
}


class Timer {
 
  int savedTime; 
  int totalTime; 
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  

  void start() {
    savedTime = millis(); 
  }
  

  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}


