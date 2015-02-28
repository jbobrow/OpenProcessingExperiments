
void setup()
{
  text(240,240,240);
  frameRate(5);
size(400, 600);
background(240, 240, 240);
smooth();
}

void draw()
{
  fill(0);
  rect(0,0,width,height);
  // noStroke();
  // ellipse(mouseX, mouseY,mouseX,mouseY);
  point (random(width), random(height));
  point (random(width), random(height));
  point (random(width), random(height));
  
  fill(0,255,0);
  textAlign(CENTER);
  textSize(40);
  text("JACOB!",random(width),random(height));

stroke(220, 220, 220);
line(0, 0, mouseX, mouseY);
}
