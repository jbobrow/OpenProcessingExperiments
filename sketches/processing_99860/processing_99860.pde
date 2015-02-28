
int interval = 1000;//timer's interval
int lastRecordedTime = 0;

void setup(){
  size(300,300);
}

void draw(){
  background(0);
  //did the interval' time pass?
  if(millis()-lastRecordedTime>interval){
    //change FILL color
   fill(random(255),random(255),random(255));
   //and record time for next tick
   lastRecordedTime = millis(); 
  }
  //draw a rect
  ellipse(75,75,150,150);
   
}


