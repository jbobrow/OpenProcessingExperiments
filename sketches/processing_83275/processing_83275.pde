
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  
   noStroke();
  fill(7,111,26);
  triangle(200,0,100,500,300,500);
  
  fill(77,32,2);
  rect(175,500,50,50);
  fill(255,0,0);
  textSize(36);
  textAlign(CENTER);

  text("Merry Christmas!",width/2,height-20);
}
void draw()
{
  fill(240,252,69);
  triangle(200,0,175,35,225,35);
  triangle(200,50,175,15,225,15);
  
}

void mousePressed()
{
  
  fill(random(255));
  ellipse(mouseX, mouseY, 15, 15);
}
