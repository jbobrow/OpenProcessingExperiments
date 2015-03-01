
float radius = 200;
float curDeg = 300;
float curDeg1 = 270;
float curDeg2 = 270;
float curDeg3 = 270;

void setup(){
  size(600,600);
  frameRate(1);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  
  ellipse(0,0,500,500);
  fill(random(255), 0, 0, random(100));
  
  
  curDeg1 += 6;//seconds
  float rad1 = radians(curDeg1);
  float x1 = radius * cos(rad1);
  float y1 = radius * sin(rad1);
  strokeWeight(1);
  line(0,0,1.2*x1,1.2*y1);
  
  
  curDeg += 6;//circle
  float x = radius * cos(rad1+PI/20);
  float y = radius * sin(rad1+PI/20);
  strokeWeight(1);
  ellipse(x,y,50,50);
  fill(random(255),random(255),random(255),random(100));
  

  curDeg2 += 0.1;//minutes
  float rad2 = radians(curDeg2);
  float x2 = radius * cos(rad2);
  float y2 = radius * sin(rad2);
  strokeWeight(2);
  line(0,0,1.1*x2,1.1*y2);
  
  
  
  curDeg3 += 1/120;//hours
  float rad3 = radians(curDeg3);
  float x3 = radius * cos(rad3);
  float y3 = radius * sin(rad3);
  strokeWeight(5);
  line(0,0,0.8*x3,0.8*y3);
}

