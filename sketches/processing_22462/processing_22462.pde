

float mili, secs, mins, hrs;



void setup(){
  
 
  size(800, 500);
  textSize(30);
  background(0);
  colorMode(RGB);
  strokeWeight(10);
  smooth();
  
}

void draw(){

if(second()%10 == 0){
 
  background(150);
  
}else{ background(0);}
  
  mili = millis();
  secs = mili/1000;
  mins = mili/60000;
  hrs = mili/360000;
  
  timeEllipse();
  
  
}

void timeEllipse(){

 
  if(second() <= 60){
    
    
    stroke(100, 100, 255);
    ellipse(400, 250, second() + 100, second() + 100);
    
  }
    
  
  if(minute() <= 60){
   
    stroke(100, 255, 100);
    fill(0, 0, 0, 0);
    ellipse(400, 250, minute() + 10, minute() + 10);
    
  }
  
  if(hour() <= 60){
   
    stroke(255, 100, 100);
    fill(0, 0, 0, 0);
    ellipse(400, 250, hour() + 10, hour() + 10);
    
  }
   
    
    
  }
  

