

void setup(){
  size(400,400);
  background(#3b929f);
  smooth();
  strokeWeight(1);
  stroke(0);
}
 
void draw(){
  fill(#eeb405,20);
  fill(#eeb405,30);
  fill(#eeb405,20);
  ellipse(mouseX, mouseY, random(20,100), random(20,100));
   if (mousePressed)
  {
    stroke(#3b929f);

    background(0);



}
}


