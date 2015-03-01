
float size;
int seconds;
int minutes;
int hours;

void setup () {

  size(600, 600);
  stroke(#7db8ff);
  smooth();
}
  
void draw () {
    
  background(#b0fbff);
  rectMode(CENTER);
  fill(#7df9ff);
  size = width/60;
  
  seconds = second();
  minutes = minute();
  hours = hour();


 
 pushMatrix();
  for (int i = 0; i < seconds; i++) {
  rect(i*size+(size/2), width/6, size, height/3);
  }
  popMatrix();
   
  pushMatrix();
  for (int j = 0; j < minutes; j++) {
  rect(j*size+(size/2), width/2, size, height/3);
  }
  popMatrix();
  
  pushMatrix();
  for (int k = 0; k < hours; k++) {
  rect(k*size+(size/2), width/1.2, size, height/3);
  }
  popMatrix();  
}
   




