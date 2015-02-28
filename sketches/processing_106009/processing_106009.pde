
float hour;
float minute;
float second;

void setup(){
  size(400, 240);
  strokeWeight(2);
  
  
}

void draw(){
  background(0);
  stroke(55, 25, 25);
  line(100,0,100,240);
  line(200,0,200,240);
  line(300,0,300,240);
  fill(55, 25, 25);
  
  //hour markers
  for(int i = 0; i < 240; i += 10){
    noStroke();
    ellipse(100, i, 4, 4);
  }
  
  //minute and second markers
  for(int i = 0; i < 240; i += 4){
    noStroke();
    ellipse(200, i, 4, 4);
    ellipse(300, i, 4, 4);
  }
  
  
  //Locations
  hour = map(hour(), 0, 23, 0, (height-10));
  minute = map(minute(), 0, 59, 0, (height-10));
  second = map(second(), 0, 59, 0, (height-10));
  
  //Hours
  fill(255, 255, 0);
  noStroke();
  ellipse(100, hour, 20, 20);
  
  //Minutes
  fill(0, 0, 255);
  noStroke();
  ellipse(200, minute, 20, 20);
  
  //Seconds
  fill(0, 255, 0);
  noStroke();
  ellipse(300, second, 20, 20);
}

    


