
void setup ()
{
 
  size(300,300);
  background(255,166,154);
noStroke();
  smooth();
  frameRate(5);
}
 void draw ()
 {
  if(mousePressed)
  {
  fill(255);
  ellipse(mouseX,150,20,20);
}else{
  fill(225,10);
  ellipse(150,150,290,290);
  }
     
}
