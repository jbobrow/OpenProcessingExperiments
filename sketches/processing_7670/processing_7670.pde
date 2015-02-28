
/* 
 Pre-Mature Greying 
 by Sarah Stern
 
 I had purple hair before I came to Bard. 
 This is why I dyed it back before I arrived.
 Click d, f, g, h in succession to watch what happens when it begins to fade.
 */


void setup()
{
  size(270, 330);
  smooth(); 
  //background(188, 206, 73);
  background(103, 83, 108);
}

void draw()
{
  {
    //rectangle face
    fill(242, 147, 115); 
    stroke(103, 83, 108);
    rect(75, 75, 150, 150); 
  }
  //bezier hair
  smooth();
  fill(49, 17, 7);
  stroke(49, 17, 7);
  strokeWeight(3);
  {
    //top hair
    bezier (208, 70, 60, 60, 60, 40, 70, 140); 
    //left side hair
    bezier (100, 70, 35, 150, 15, 225, 60, 270);
    //inner left side hair
    bezier (90, 100, 60, 170, 50, 200, 70, 290);
    //inner right side hair
    bezier (180, 70, 225, 250, 215, 225, 200, 290);
    //right side hair 
    bezier (220, 250, 280, 100, 230, 100, 180, 70);
    //right middle tuft 
    bezier (160, 40, 280, 100, 230, 100, 120, 70);  
    //right middle tuft 
    bezier (160, 60, 280, 100, 230, 100, 120, 75); 
    //right bottom tuft
    bezier (190, 100, 280, 100, 230, 100, 180, 75); 
    //dyed part
    bezier (150, 65, 200, 60, 50, 40, 50, 140); 
  }
  //dye hair
  if (key == 'd')
  {
    {
      //purple hair
      stroke(144, 4, 105);
      fill(144, 4, 105);
      bezier (150, 65, 200, 60, 50, 40, 50, 140);  
    } 
    //smile
    {
      fill(90, 25, 41);
      stroke(116, 35, 54);
      bezier(105, 180, 180, 180, 150, 150, 160, 170); 
    }
    {
      //eyes
      stroke(116, 35, 54);
      strokeWeight(5);
      point(115, 160);
      point(145, 152);
    }

  }

  //fade hair
  if (key == 'f')
  {
    {
      stroke(240, 99, 226);
      fill (240, 99, 226);
      bezier (150, 65, 200, 60, 50, 40, 50, 140);  
    }
    //ambivalent mouth

    {
      stroke(116, 35, 54);
      line(105, 180, 160, 180);
    }
    {
      //eyes
      stroke(116, 35, 54);
      strokeWeight(5);
      point(115, 160);
      point(145, 152);
    }
  }
  //gray hair
  if (key == 'g')
  {
    {
      stroke (255, 196, 249);
      fill (255, 196, 249); 
      bezier (150, 65, 200, 60, 50, 40, 50, 140);
    }
    {
      //eyes
      stroke(116, 35, 54);
      strokeWeight(5);
      point(115, 160);
      point(145, 152);
    }
    {
      //frown
      stroke(116, 35, 54);
      line (120, 180, 130, 180);
    }

  } 
  if (key == 'h')
    //smile
  {
    {
      fill(90, 25, 41);
      stroke(116, 35, 54);
      bezier(105, 180, 180, 180, 150, 150, 160, 170); 
    }
    {
      //eyes
      stroke(116, 35, 54);
      strokeWeight(5);
      point(115, 160);
      point(145, 152);
    }
  }
}






