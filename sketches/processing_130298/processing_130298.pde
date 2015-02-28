
PImage smiley;
PImage customBrush;
color  brushColor;

void setup()
{
  size(500, 500);
  smiley = requestImage("Happy_smiley_face.png");
  customBrush = new PImage(100, 100);
  background(255);
}



void draw()
{
  noStroke();
  fill(255, 0, 0);
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      // random
      fill(random(255), random(255), random(255));
      
      //fill(brushColor); would use the color selected with space bar
      
      ellipse(mouseX + random(100), mouseY + random(100), 50, 50);
    }
    else if (mouseButton == RIGHT)
    {
      if (smiley.width > 0)
      {
        image(smiley, mouseX, mouseY, 50, 50);
        //image(customBrush, mouseX, mouseY, 100, 100);
      }
    }
    
    if (keyPressed)
    {
      // red while holding down 1
      if (key == '1')
      {
        tint(255, 0, 0);
      }
      // green while holding down up
      else if (keyCode == UP)
      {
        tint(0, 255, 0);
      }

    }
    else
    {
      noTint();
    }
  }
}

void keyReleased()
{
  if (key == ' ')
  {
    //save("image01.png"); save image to hard drive (doesnt work open processing)
    
    imageMode(CENTER);
    
    // store part of the screen to an image we can use as a brush
    customBrush = get(width/ 2, height / 2, 100, 100);
    
    brushColor = get(mouseX, mouseY);
  }
}


