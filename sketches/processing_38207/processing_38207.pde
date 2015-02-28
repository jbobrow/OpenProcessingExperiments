
int button_x = 250;
int button_y = 250;
int button_radius = 50;

void setup()
{
  size(900, 450);
  setupSounds("MessageForMe.wav"); // THIS IS KEY, THIS THING. :00000000
}

void draw()
{
  background(15);
  drawButton();
}


boolean isTheMouseOverTheButton()
{
  if (dist(mouseX, mouseY, button_x, button_y)<=button_radius)
  {
    //that means it IS over the button
    return true;
  }
  else
  {
    return false;
  }
}

void drawButton()
{
  if (isTheMouseOverTheButton())
  {
    if (mousePressed)
    {
      playSample();
      //we're pushing the button!!!
      fill(150, 0, 150);
      button_x = int(random(900));
      button_y = int(random(450));
      button_radius = int(random(10, 200));
    }
    else
    {
      fill(195);
    }
  }
  else
  {
    fill(255);
  }
  stroke(150, 0, 150);
  strokeWeight(10);
  ellipse(button_x, button_y, 2*button_radius, 2*button_radius);
}

