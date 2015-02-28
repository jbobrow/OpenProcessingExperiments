
void setup()
{
  size(700,600);
  background(0, 100, 255);
  frameRate(40);
}

void draw()
{
  stroke(random(255), random(255), random(200));
  line(width/2, height/2, mouseX, mouseY);
  textAlign(CENTER);
  textSize(40);
  text("Revelation 21:4", width/2,50);
  textSize(34);
  text("He will wipe every tear from their eyes", width/2, 400);
  textSize(34);
  text("there will be no more death, or mourning", width/2, 450);
  textSize(34);
  text("or crying or pain, for the old order of things", width/2, 500);
  text("has passed away", width/2, 550);
}
