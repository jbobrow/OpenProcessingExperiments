
void setup()
{
  size(500,500);
}

void draw()
{
  background(255);
  
  translate(width/2, height/2);
  
  //SEKUNDEN
  float sec = map (second(), 0,60,0,360);
  println(sec);
  
  
  pushMatrix();
  fill(0);
  stroke(0);
  strokeWeight(1);
  rotate(radians(sec)); 
  translate(0, -120); 
  line(0, 0, 0, 120);
  popMatrix();
  
  
  //MINUTEN
  float min = map (minute(), 0,60,0,360);
  println(min);
  
  
  pushMatrix();
  fill(0);
  stroke(0);
  strokeWeight(2);
  rotate(radians(min)); 
  translate(0, -180); 
  line(0, 0, 0, 180);
  popMatrix();
  
  
  rotate(-0.525);
  //STUNDEN
  float hr = map (hour(), 12,23,30,360);
  println(min);
  
  
  pushMatrix();
  fill(0);
  stroke(0);
  strokeWeight(3);
  rotate(radians(hr)); 
  translate(0, -150); 
  line(0, 0, 0, 150);
  popMatrix();
  rotate(0.525);
  
  //STUNDEN
for (int i=0; i<360; i+=30) { 
pushMatrix();
rotate(radians(i)); 
translate(0, 200); 
line(0, 0, 0, 150);
noFill();
stroke(0);
popMatrix();
}
  
  
  
}
