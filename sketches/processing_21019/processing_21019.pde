
int hours;
int minutes;
int seconds;
 
 
void setup() {
  size(700, 700);
  colorMode(HSB, 100);
  background(0, 0, 100);
  smooth();
}
 
void draw() {
 
  hours = hour();
  minutes = minute();
  seconds = second();
 
  println(hours + " " + minutes + " " + seconds);
 
  if (hours>7 && hours<13) {   
    background(55,100,100); // blue morning
  }
  else if (hours>13 && hours<18) {
    background(12,100,100); //orange afternoon
  }
  else {
    background(0); //black night
  }
 
// center sketch
translate(350,350);
rotate(radians(90));
noFill();
 
// hours
for (int k = 0; k < 25; k++) {
  strokeWeight(2);
  stroke(50);
  fill(40);
  pushMatrix();
  rotate(radians(15*k));
  rect(0,0,200,200);
  popMatrix();
}
 
 
//load hours
for (int k = 0; k < hours; k++) {
  strokeWeight(2);
  stroke(0);
  fill(88,90,100);
  pushMatrix();
  rotate(radians(15*k));
  rect(0,0,200,200);
  popMatrix();
}
 
 
// minutes
for (int j = 0; j < 61; j++) {
  strokeWeight(1);
  stroke(50);
  fill(70);
  pushMatrix();
  rotate(radians(6*j));
  rect(0,0,100,100);
  popMatrix();
}
 
//load minutes
for (int j = 0; j < minutes; j++) {
  strokeWeight(1);
  stroke(0);
  fill(10,87,78);
  pushMatrix();
  rotate(radians(6*j));
  rect(0,0,100,100);
  popMatrix();
}
 
//seconds
for (int i = 0; i < 61; i++) {
  strokeWeight(1);
  stroke(30);
  fill(50);
  pushMatrix();
  rotate(radians(6*i));
  rect(0,0,50,50);
  popMatrix();
}
 
//load seconds
for (int i = 0; i < seconds; i++) {
  strokeWeight(1);
  stroke(0);
  fill(21,80,70);
  pushMatrix();
  rotate(radians(6*i));
  rect(0,0,50,50);
  popMatrix();
}
 
}


