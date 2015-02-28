
float carWidth;
float carHeight = 50;
float wheelSize;

void setup()
{
  size(400, 400);
  background(255, 255, 255);
  smooth();
  
  carWidth = carHeight * 2;
  wheelSize = carHeight / 2;
}

void draw()
{
  background(255, 255, 255);

  noStroke();
  fill(255, 0, 0);
  
  // Draw car top:
  ellipse(mouseX, mouseY-carHeight/2, carHeight, carHeight/2);

  // Draw car body:
  ellipse(mouseX, mouseY, carWidth, carHeight);  
  fill(255, 255, 255);
  rect(mouseX-carWidth/2, mouseY, carWidth, carHeight);

  // Draw wheels:
  fill(0, 0, 0);
  ellipse(mouseX-carWidth/4, mouseY, wheelSize, wheelSize);
  ellipse(mouseX+carWidth/4, mouseY, wheelSize, wheelSize);
  fill(128, 128, 128);
  ellipse(mouseX-carWidth/4, mouseY, wheelSize/2, wheelSize/2);
  ellipse(mouseX+carWidth/4, mouseY, wheelSize/2, wheelSize/2);
  

  
}
