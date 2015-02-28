
//game try out
//thomas beelen feb 22 2013

Obstacle[] obstacles = new Obstacle[35]; 

int stoneSize = 60;
int obstacleSize = 20;
float swipeThreshold = 50;

float averageSpeed;
float speedAdder = 0.5;

int obstacleSpeed =2 ;
int obstacleCounter = 0;

int timer;

void setup () {
  size(600, 600);
  background (245);
  frameRate(60);
  smooth();
  averageSpeed =1;
  timer = 40;
  //float randomizer;
  
}


void draw () {
background (245);


swipe();


drawStone(width/2, height-100);

for (int i =0; i<obstacleCounter; i++){
obstacles[i].move();
obstacles[i].display();};

println (averageSpeed);
showSpeed();

float randomizer = random(-15,15);
if (millis() > timer){averageSpeed = averageSpeed + randomizer; timer= millis() +600;}


}




void drawStone(int x_, int y_) {
  int x = x_;
  int y = y_;

  noStroke();
  strokeWeight(1);
    fill (10, 10, 10);
  ellipse (x, y, stoneSize, stoneSize);
}



void swipe () {
  if (mouseY<height/2 && abs(pmouseX-mouseX)>swipeThreshold) {
    averageSpeed = averageSpeed + speedAdder;
    noStroke();
    fill(10,10,230,20);
    rect (0,0, width, height/2);
  }
}


void mousePressed (){
  for (int j = 0; j <35; j++) {
  obstacles[j] = new Obstacle (mouseX, mouseY);
}; obstacleCounter +=1; 
    noStroke();
    rect (0, height/2, width, height/2);


if (obstacleCounter >= 35){obstacleCounter =0;}
averageSpeed = averageSpeed - 4*speedAdder;
} 






void showSpeed(){
  strokeWeight(2);  
  stroke(20);
    fill(200,10,10,200);
   line(width -25, height -60, width -5, height -60);
   rect(width -20, height -60, 10, -averageSpeed);
}





class Obstacle {
  int x;
  float y;
  int size;
  float speed;
  
  Obstacle (int x_, int y_){
    x = x_;
    y = y_;
    size = obstacleSize;
    speed = obstacleSpeed;
  }
void display() {
  
  strokeWeight (3);
  stroke(5);
  fill (100,10,10);
  ellipse(x,y, size,size);




}

void move () {
  
  //x = x+averageSpeed;
  
  y = y+speed;
}
  
  
/*
  strokeWeight (3);
  stroke(5);

  //rect (width-50, height -70, 20, 60);
  fill (200, 200, 10);
  //noStroke ();
  rect(width-50, height -70, 20, averageSpeed * 15);*/
}
