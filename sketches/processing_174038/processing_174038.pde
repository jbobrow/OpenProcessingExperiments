
void setup()
{
  size(600, 400);
  smooth();
  background(216, 246, 255);
}

void draw()
{
  /*void mouseClicked() 
  {
    if (value == 0) 
    {
      value = 255;
    } else {
      value = 0;
    }
  }*/

  if (mouseButton == LEFT)
  {
    for (int i=0; i <360; i+=20)
    {
      float ver = sin(millis()/350.0+i)*2;
      float amp = sin(millis()/350.0+i)*10;


      background(216, 246, 255);

      pushMatrix();
      noStroke();
      fill(144, 205, 237);
      ellipse(150+amp*1.5, 600-frameCount*2.2, 20+ver, 20+ver);
      ellipse(250-amp, 600-frameCount*1.7, 15+ver, 15+ver);
      ellipse(350+amp, 500-frameCount*2, 20+ver, 20+ver);
      ellipse(450-amp*2, 700-frameCount*1.9, 25+ver, 25+ver);
      popMatrix();
      
      if ( frameCount > 400)
    {
      frameCount = 0;
    }
    }
  }

  for ( int a=0; a < 700; a +=200)
  {
    fill(227, 218, 188);
    noStroke();
    ellipse(a, 400, 200, 100);
  }

  for ( int b=0; b < 700; b +=200)
  {
    fill(227, 218, 188);
    noStroke();
    ellipse(b+100, 400, 200, 110);
  }
}
