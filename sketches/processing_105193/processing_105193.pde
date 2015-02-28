
//generating random numbers. Random numbers are float numbers rather than integers

void setup(){
  size(400,400);
  frameRate(5);
}

void draw(){

  float rx = random(50, 250);
  float ry =random(50, 250);
  background(rx, ry, ry);
  rectMode(CENTER);
  rect(rx, ry, 20, 20);
  
  println ("My random value is: " + rx);
  
  point(mouseX+rx, mouseY+ry);
}
