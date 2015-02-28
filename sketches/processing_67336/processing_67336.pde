
PFont font;
int secondArray = second();
float[] secondXSpeed= new float[secondArray];
float[] secondYSpeed= new float[secondArray];
float[] secondBallx= new float[secondArray];
float[] secondBally= new float[secondArray];

int minuteArray = minute();
float[] minuteXSpeed= new float[minuteArray];
float[] minuteYSpeed= new float[minuteArray];
float[] minuteBallx= new float[minuteArray];
float[] minuteBally= new float[minuteArray];

int hourArray = hour();
float[] hourXSpeed= new float[hourArray];
float[] hourYSpeed= new float[hourArray];
float[] hourBallx= new float[hourArray];
float[] hourBally= new float[hourArray];


void setup() {
  size(600, 200);
  font = loadFont("CenturyGothic-150.vlw");
  
  //hour balls
  for(int i=0; i < hourArray; i++){
    hourXSpeed[i] = random(5);
    hourYSpeed[i] = random(7);
    hourBallx[i] = random(10, 195); 
    hourBally[i] = random(10, height-10);
  }
  
  //minute balls
  for(int i=0; i < minuteArray; i++){
    minuteXSpeed[i] = random(5);
    minuteYSpeed[i] = random(7);
    minuteBallx[i] = random(205, 395); 
    minuteBally[i] = random(10, height-10);
  }
  
  //Second Balls
  for(int i=0; i < secondArray; i++){
    secondXSpeed[i] = random(5);
    secondYSpeed[i] = random(7);
    secondBallx[i] = random(405, width-10); 
    secondBally[i] = random(10, height-10);
  }
  
}

void draw() {
  background(255);
  
  
  //Hour Bouncing ball
  for(int i = 0; i < hourArray; i++){
       smooth();
       noStroke();
       fill(0, 255, 0, 90);
       ellipse(hourBallx[i], hourBally[i], 20, 20);
       hourBallx[i] += hourXSpeed[i];
       hourBally[i] += hourYSpeed[i];
   
     if(hourBallx[i] >= 195 || hourBallx[i] <= 10){
       hourXSpeed[i] *= -1;
     }
     if(hourBally[i] >= height-10 || hourBally[i] <= 10){
       hourYSpeed[i] *= -1;
       
     }
  }
  
  //Minute Bouncing balls
  for(int i = 0; i < minuteArray; i++){
       smooth();
       noStroke();
       fill(0, 0, 255, 90);
       ellipse(minuteBallx[i], minuteBally[i], 20, 20);
       minuteBallx[i] += minuteXSpeed[i];
       minuteBally[i] += minuteYSpeed[i];
   
     if(minuteBallx[i] >= 395 || minuteBallx[i] <= 205){
       minuteXSpeed[i] *= -1;
     }
     if(minuteBally[i] >= height-10 || minuteBally[i] <= 10){
       minuteYSpeed[i] *= -1;
       
     }
  }
  
  //Second Bouncing balls
  for(int i = 0; i < secondArray; i++){
       smooth();
       noStroke();
       fill(255, 0, 255, 90);
       ellipse(secondBallx[i], secondBally[i], 20, 20);
       secondBallx[i] += secondXSpeed[i];
       secondBally[i] += secondYSpeed[i];
   
     if(secondBallx[i] >= width-10 || secondBallx[i] <= 405){
       secondXSpeed[i] *= -1;
     }
     if(secondBally[i] >= height-10 || secondBally[i] <= 10){
       secondYSpeed[i] *= -1;
       
     }
  }
  
  fill(0);
  textFont(font);
  textAlign(CENTER, CENTER);
  text(hour(), 95, 85);
  text(minute(), 295, 85);
  text(second(), 495, 85);
  
  
  rectMode(CORNER);
  noFill();
  stroke(0);
  strokeWeight(10);
  rect(5, 5, 590, 190);
  line(200, 0, 200, height);
  line(400, 0, 400, height);
  fill(255);
  noStroke();
  rectMode(CENTER);
  rect(200, 75, 15, 20);
  rect(200, 125, 15, 20);
  rect(400, 75, 15, 20);
  rect(400, 125, 15, 20);
  
}

