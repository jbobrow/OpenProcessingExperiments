



void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}


void draw()
{ 
  fill(114, 192, 225, 30);
  rect(0, 0, width, height);

  if (frameCount%10 == 1)  // Thanks T!
  {
    fill(0, 0, 0);
    textAlign(CENTER);
    text("Go Eagles!", random(width), random(height));
    textSize(34);
  }

    image(loadImage("logo.png"), mouseX, mouseY, mouseY*0.5, mouseY*0.5);
  
  
}


