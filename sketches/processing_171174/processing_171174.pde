
void setup()
{
 size (500,500);
//background(52, 152, 219);
noFill();
//stroke(26, 188, 156);
stroke(0);
strokeWeight(15);  
smooth();
rectMode(CENTER);
ellipseMode(CENTER);

}

void draw()

{
  pushMatrix();
//int s = second();
  translate(mouseX,mouseY);
  //background(52, 152, 219,10);
  background(255);
  //rotate(second()*50);
  rotate(mouseX/100.0);
  rotate(mouseY/100.0);
  rect(0,0,150,150);
  ellipse(0,0,150,50);
    ellipse(0,0,50,150);
  
  popMatrix();
  
  if (mousePressed == true) {
    noCursor();
 // } else {
   // cursor(HAND);
  }
}
