
float index = 0.0;
float counter = 0;
void setup ()
{
  size (500, 500);
  textFont(createFont("SansSerif",50));
  background (255);
  colorMode(HSB, 360, 100, 100);
}


void draw ()
{ 
  //mousePressed
  if (mousePressed == true)
  {
    //random Farbe verliebt
    float h = map(sin(index), -1, 1, 290, 335);
    background(h, 30, 85); 
    index += 0.1; 
    //random Farbe verliebt END

    //Herzchen
    for (int i=0; i<10; i++)
    {
      pushMatrix();
      translate(5, height/2);
      translate(i*90, sin(counter+i)*100);
      float x = map(sin(counter+i), -1, 1, 320, 360);
      fill(x, 100, 70);
      noStroke();
      text("♥",0,0);
      popMatrix();
      counter += 0.01;
    }
    //Herzchen END
  }
  //mousePressed END
  

  //mouse not Pressed
  else if (mousePressed == false)
  {
    //random Farbe traurig
    float h = map(sin(index), -1, 5, 177, 250);
    background(h, 50, 50); 
    index += 0.05; 
    //random Farbe traurig END
  }
  //mouse not Pressed END
}

