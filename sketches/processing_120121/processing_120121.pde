
void setup(){
size(500,500);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  
  float sec = map(second(), 0,60,0,360);
  println(sec);
  pushMatrix();
  rotate(radians(sec)); // Um sec rotieren
  translate(0, -200); // Um Radians verschieben
  fill(#080707);
  rect(0, 0, 2, 200);
  popMatrix();
  
  float min = map(minute(), 0,60,0,360);
  println(min);
  pushMatrix();
  rotate(radians(min));
  translate(0,-200);
  fill(#F20F48);
  noStroke();
  rect(0, 0, 2, 200);
  popMatrix();
  
  float h = map(hour(),0,60,0,360);
  println(h);
  pushMatrix();
  rotate(radians(h));
  translate(0,-200);
  fill(#080707);
  rect(0, 0, 2, 200);
  popMatrix();
  
  ellipse(0,0,20,20);
  
  
  fill(#F20F48);
  ellipse(0,-225,40,40);
  fill(#F20F48);
  ellipse(0,225,40,40);
    fill(#F20F48);
  ellipse(225,0,40,40);
    fill(#F20F48);
  ellipse(-225,0,40,40);
    
  
fill(#9FA59D);
for (int i=0; i<360; i+=30) { // 360 Grad in 20° Schritten
pushMatrix();
rotate(radians(i)); // Um i rotieren
translate(0, 225); // Um Radius verschieben
ellipse(0, 0, 10, 10);
popMatrix();

}
}

