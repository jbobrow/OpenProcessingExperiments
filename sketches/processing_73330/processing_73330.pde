
int duration=5;
int percent=0;
float persent=0;
int diff;

void setup(){
  size(300,300);
  background(0);
  smooth();
  stroke(255);
  text("LOADING", width/2-100, height/2-25);
  noFill();
  rect(width/2-100, height/2-20, 200,20);
  noStroke();
  diff=millis();
}

void draw(){
  
  if(persent<100){
  percent=round(map(millis()-diff,0,duration*1000,0,100));
  persent=(map(millis()-diff,0,duration*1000,0,100));
  }
  fill(0);
  rect(width/2-45, height/2-38,100,15);
  fill(255);
  text(percent+"%", width/2-40, height/2-25);
  rect(width/2-99, height/2-19, percent*2,19);
  if(mousePressed==true && percent>99){
   percent=0;
   persent=0;
   diff=millis();
   fill(0);
   rect(width/2-99, height/2-19, 198,19);
  }
  println(percent);
}

