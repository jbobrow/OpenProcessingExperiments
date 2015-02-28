
/**Sketch by Amanda Kessel
Press your mouse to decorate the tree with ornaments
*/

void setup()
{
  size(400,600);
  background(255,255,255);
  smooth();
  textAlign(CENTER);
  frameRate(5);
  strokeWeight(5);
  fill(96,232,52);
  triangle(100,400,300,400,200,100);
  frameRate(15);
  fill(108,54,27);
  quad(175,425,225,425,225,400,175,400);
  image(loadImage("sb140.png"),190,90,22,22);
}

void draw()
{
  fill(random(255),0,0);
  textSize(26);
  text("Have a Blessed Christmas!",width/2, 500);

}

void mousePressed()
{
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,15,15);
 
}

