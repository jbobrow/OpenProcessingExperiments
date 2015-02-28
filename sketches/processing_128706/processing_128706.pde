
class Spike{
  //Variables
  float x,y; //Location the spikes drop
  float speed; //Speed they fall
  float c; //color
  
  Spike(float tempX){
    x = tempX;
    speed = random(1,5);
    y = -speed;
    c = color(140);
  }
  
  void move(){
    y += speed;
  }
  
  //Check to see if it has hit the bottom
  boolean reachedBottom(){
    if(y>height+20){
      return true;
    } else{
      return false;
    }
  }
  //Display Spike
  void display(){
    fill(c);
    noStroke();
 triangle(x,y,x-10,y+10,x+10,y+10);
  }
  //Check for intersect
  boolean intersect(){
    float distance = dist(x,y,mouseX,mouseY);
    //Compare distance
    if(distance<10){
      return true;
    } else{
      return false;
    }
  
  }
}
class Booster{

float x,y; //Location the spikes drop
  float speed; //Speed they fall
  
  Booster(float tempX){
    x = tempX;
    speed = random(1,5);
    y = -speed;
  }
  
  void move(){
    y += speed;
  }
  
  //Check to see if it has hit the bottom
  boolean reachedBottom(){
    if(y>height+20){
      return true;
    } else{
      return false;
    }
  }
  //Display Points
  void display(){
    fill(0,255,0);
    noStroke();
 ellipse(x,y,15,15);
  }
  //A function that returns a value based on if 
  //the mouse intersects with the objects
  boolean intersect() {
    //Calculate distance
    float distance = dist(x,y,mouseX,mouseY);
    //Compare distance to sum of radius
    if(distance<7.5){
      return true;
    } else{
      return false;
    }
  }
 }
Spike[] spikes; //Array of Spikes
Timer spiketimer; //Timer
int totalSpikes = 0;
Point[] points; //Array of Points
Timer pointtimer; //Time
int totalPoints = 0;
Booster[] boosters;
Timer boostertimer;
int totalBoosters = 0;

int state=0;
int Score=0;

void setup() {
  size(600, 600);
  smooth();
  //Spikes
  spiketimer = new Timer(300);
  spikes = new Spike[300];
  for (int i = 0; i<spikes.length; i++) {
    spikes[i]= new Spike(2*width);
  }
  spiketimer.start();
  //Points
  pointtimer = new Timer(300);
  points = new Point[200];
  for (int i = 0; i<points.length; i++) {
    points[i]= new Point(2*width);
  }
  pointtimer.start();
  //Booster
  boostertimer = new Timer(2000);
  boosters = new Booster[5];
  for (int i = 0; i<boosters.length; i++) {
    boosters[i]= new Booster(2*width);
  }
  boostertimer.start();
}

void draw() {

  if (state==0) {
    drawStartScreen();
  }

  if (state==1) {
    fill(0);
    background(255);
    textSize(32);
    text("Score:"+Score+" ", 60, 50);


    if (spiketimer.isFinished()) {
      //Deal With Spikes
      //MAKE NEW ONES
      spikes[totalSpikes] = new Spike(random(width));
      //Increment totalSpikes
      totalSpikes ++ ;
      //If we hit the end of he array
      if (totalSpikes>=spikes.length) {
        totalSpikes = 0; //Start over
      }
      spiketimer.start();
    }
    if (pointtimer.isFinished()) {
      //Deal with Points
      //Make new ones
      points[totalPoints] = new Point(random(width));
      //Increment Points
      totalPoints ++;
      //If we hit the end of the array
      if (totalPoints>=points.length) {
        totalPoints = 0; //Start Over
      }
      pointtimer.start();
    }
    if (boostertimer.isFinished()) {
      //Make a new booster
      boosters[totalBoosters] = new Booster(random(width));
      //increment Booster
      totalBoosters ++;
      //If we hit the end of the array
      if (totalBoosters>=boosters.length) {
        totalBoosters = 0; //Start Over
      }
      boostertimer.start();
    }

    for (int i = 0; i<spikes.length; i++) {
      spikes[i].move();
      spikes[i].display();
      if (spikes[i].intersect()) {
        state=2;
      }
    }
    for (int i=0; i<points.length; i++) {
      points[i].move();
      points[i].display();
      if (points[i].intersect()) {
        points[i].x=2000;
        Score=Score+1;
        println(Score);
      }
    }
    for (int i=0; i<boosters.length; i++) {
      boosters[i].move();
      boosters[i].display();
      if (boosters[i].intersect()) {
        boosters[i].x=2000;
        Score=Score+5;
        println(Score);
      }
    }
  }
  if (state==2) {
    drawEndScreen();
  }
}



void drawEndScreen() {
  //End Screen

    fill(0);
  background(255);
  textSize(52);
  textAlign(CENTER);
  text("You Lost!", width/2, height/3);
  text("Your Final Score:"+Score+" ", width/2, height/2);
  text("Click to Play Again", width/2, height/1.5);
  if (mousePressed) {
    state=0;
    Score=0;
  }
}
void drawStartScreen() {
  //Start Screen
  fill(0);
  background(255);
  textSize(52);
  textAlign(CENTER);
  text("Avoid the Spikes!", width/2, height/3);
  textSize(32);
  text("Press S to Start", width/2, height/2);

  if (keyPressed) {
    if (key=='s') {
      state=1;
    }
  }
}




class Point{

float x,y; //Location the spikes drop
  float speed; //Speed they fall
  
  Point(float tempX){
    x = tempX;
    speed = random(1,5);
    y = -speed;
  }
  
  void move(){
    y += speed;
  }
  
  //Check to see if it has hit the bottom
  boolean reachedBottom(){
    if(y>height+20){
      return true;
    } else{
      return false;
    }
  }
  //Display Points
  void display(){
    fill(0,0,255);
    noStroke();
 ellipse(x,y,15,15);
  }
  //A function that returns a value based on if 
  //the mouse intersects with the objects
  boolean intersect() {
    //Calculate distance
    float distance = dist(x,y,mouseX,mouseY);
    //Compare distance to sum of radius
    if(distance<7.5){
      return true;
    } else{
      return false;
    }
  }
 }
class Timer {
  int savedTime; //When timer started
  int totalTime; //How long timer lasts

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  //Start Timer
  void start() {
    //Timer tarts in milliseconds
    savedTime = millis();
  }

  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}






