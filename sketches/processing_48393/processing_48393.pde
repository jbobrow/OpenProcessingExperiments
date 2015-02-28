
void setup()
{
  size(400, 600);
  background(225, 54, 67);
  smooth();
  frameRate(30);
}

void draw()
{
  textAlign(CENTER);
  textSize(36);
  fill(255,255,255);
  text("Merry Christmas!",width/2,height/2);
  

  strokeWeight(10);
  stroke(255, 255, 255, 5); 
  fill( random(255), random(255), random(255), 55);

  ellipse(mouseX, mouseY, 20, 20) ;
}

void keyPressed()
{
  save("snapshot.png");
  background(0, 0, 0);
}











