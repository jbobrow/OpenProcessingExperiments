
void setup(){
size(500,500);
}
 
void draw(){
  background(#030202);
  translate(width/2, height/2);
   
  float sec = map(second(), 0,60,0,360);
  println(sec);
  pushMatrix();
  rotate(radians(sec)); // Um sec rotieren
  translate(0, -200); // Um Radians verschieben
  fill(#4D4C4C);
  ellipse(0, 0, 40, 40);
  popMatrix();
   
  float min = map(minute(), 0,60,0,360);
  println(min);
  pushMatrix();
  rotate(radians(min));
  translate(0,-200);
  fill(#F20F48);
  noStroke();
  ellipse(0, 0, 30, 30);
  popMatrix();
   
  float h = map(hour(),0,60,0,360);
  println(h);
  pushMatrix();
  rotate(radians(h));
  translate(0,-200);
  fill(#4D4C4C);
  ellipse(0, 0,20, 20);
  popMatrix();
   
 
   
   

}
