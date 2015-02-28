
void setup()
{
 size(600,600);
 background(0,0,0);
}
void draw()
{
  fill(0,0,0,75);
  rect(0,0,width,height);
  
  fill(0,0,255);
  textAlign(CENTER);
  text("eat, drink, and be merry", random(width), random(height));
  textSize(36);
 
  imageMode(CENTER);
  image(loadImage("beer-bottle-christmas-tree-funny-xmas-trees1.jpg"),mouseX,mouseY,200,200);
}



