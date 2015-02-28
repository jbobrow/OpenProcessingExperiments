
void setup()
{
  size(400, 600);
  background(155,146,245);
  smooth();
  noStroke();
  textSize(36);
 
  fill(7, 111, 26);
  triangle(200,0,100,500,300,500);
  
  fill(77, 32, 2);
  rect(175, 500, 50, 50);
 
 
}

void draw()
{
 
   fill(240, 252, 69);
  triangle( 200,0,175,35,225,35);
  triangle(200, 50, 175, 15, 225, 15);
 
 fill(255,0,0);

  
  textAlign(CENTER);
  text("Merry Christmas!",width/2, height-20);
  }

void mousePressed()
{

fill(random(255));
ellipse(mouseX, mouseY, 15, 15);
}
