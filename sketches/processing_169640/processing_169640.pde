
int minutes;
int seconds;
int hours;
float value;
float c;
float size;


void setup() {
  size(1000,300);
  size = width/60;
 
  
  
}


void draw() {
  value = second();
  seconds = second();
  minutes = minute();
  hours = hour();
  float c = map(value,0,60,195,255);
  
  
  //map(minutes,0,60,0,width);
  //map(seconds,0,60,0,width);
  //map(hours,0,24,0,width);
  background(0);
  fill(c,0,0);
  rectMode(CENTER);
  size = width/60;
  
  pushMatrix();
  for (int i = 0; i < seconds; i++) {
  rect(i*size+(size/2),50,size,height/3);
  }
  popMatrix();
  
  for (int j = 0; j < minutes; j++) {
  rect(j*size+(size/2), height/2, size, height/3);
  }
  size = width/24;
  for (int k = 0; k < hours; k++) {
  rect(k*size+(size/2), 250, size, height/3);
  }
  
}


