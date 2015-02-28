
void setup()
{
  size(400, 600);
  background(0, 0, 0);
  // frameRate(5);
  textSize(30);
  textAlign(CENTER);
}

void draw()
{

  {
    fill(0, 0, 0, 75);
    rect(0, 0, width, height);

    fill(random(255), random(200), random(222));
    ellipse(mouseX, mouseY, 100, 100);
    ellipse(mouseX, mouseY-75, 80, 80);
    ellipse(mouseX, mouseY-130, 60, 60);
    fill(0);
    ellipse(mouseX-10, mouseY-135, 10, 10);
    ellipse(mouseX+10, mouseY-135, 10, 10);
    ellipse(mouseX, mouseY-80, 10, 10);
    ellipse(mouseX, mouseY-10, 10, 10);
    ellipse(mouseX, mouseY+10, 10, 10);
    fill(234, 203, 24);

    triangle(mouseX, mouseY-125, mouseX-18, mouseY-117, mouseX+7, mouseY-117);

    fill(random(246), random(255), random( 0));
    if (frameCount < 300)
    {
      ellipse(30, 50, frameCount/2, frameCount/2);
      text("Dont Walk Into The Light!", 200, 540);
    }
    else
    {
      ellipse(30, 50, 150, 150);
      text("Dont Walk Into The Light!", 200, 540);
    }
  }
}

