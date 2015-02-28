
float angleS = 0.0;

void setup() {
   size(300,300); 
   frameRate(30);
}

void draw() {
  background(255);
  smooth();
  
  int mySecond = (second()-15);  
  int myMinute = minute();  
  int myHour = hour();
  
  angleS = mySecond*.1045;
  
  strokeWeight(2);
  stroke(0,0,255,90);
  fill(0,255,255,90);
  rect(0, 0, myMinute*5, 299);
  
  fill(255,0,255,90);
  rect(0, 0, 299, myHour*12.5);
  
  strokeWeight(10);
  translate(150,150);
  rotate(angleS);
  line(0, 0, 145, angleS);
  
 
}

