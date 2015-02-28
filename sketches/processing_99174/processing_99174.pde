
void setup()
{
  size(600, 600);
  background(255, 255, 255);
  smooth();
}
void draw()
{
  fill(random(255), random(255), random(255));
  textSize(35);
  textAlign(CENTER);
  text( "Tennis in the summer!!!", 300, 300);
  ellipse(mouseX,mouseY,50,50);
}


void mousePressed()
{
   image( loadImage("tennis racquet.png"),mouseX,mouseY);
 
}



