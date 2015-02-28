
class name
{
  float x, y;
  String samplename = "Sample Name";

  name(float x_local, float y_local)
  {
    x = x_local;
    y = y_local;
  }

  void window()
  {
    // text window
    for (int i = 0; i < 10; i++)
    {
      stroke(75,75,75);
      fill(50,50,50);
      rectMode(CORNER);
      rect(512+48, i*64+32, 200, 32);
      // s1
      fill(255);
      textAlign(CENTER);
      text("Kick", 512+48, 0*64+40, 200, 40);
      // s2
      fill(255);
      textAlign(CENTER);
      text("Snare 1", 512+48, 1*64+40, 200, 40);
      // s2
      fill(255);
      textAlign(CENTER);
      text("Snare 2", 512+48, 2*64+40, 200, 40);
      // s3
      fill(255);
      textAlign(CENTER);
      text("Funky", 512+48, 3*64+40, 200, 40);
      // s4
      fill(255);
      textAlign(CENTER);
      text(s5name, 512+48, 4*64+40, 200, 40);
      // s5
      fill(255);
      textAlign(CENTER);
      text(s6name, 512+48, 5*64+40, 200, 40);
      // s6
      fill(255);
      textAlign(CENTER);
      text(s6name, 512+48, 6*64+40, 200, 40);
      // s7
      fill(255);
      textAlign(CENTER);
      text(s7name, 512+48, 7*64+40, 200, 40);
      // s8
      fill(255);
      textAlign(CENTER);
      text(s8name, 512+48, 8*64+40, 200, 40);
      // s9
      fill(255);
      textAlign(CENTER);
      text(s9name, 512+48, 9*64+40, 200, 40);
    }
    // end text window
  }

  void click(float x_local, float y_local)
  {
    if ((y_local >= 9*32 )  && (y_local <= 10*32 ) && (512+48 <= x_local) && (x_local <= 512+48+200)) 
    {
      fill(255,50);
      rect(x, 9*32, 200, 32);
     s5name = selectInput();
    }

    if ((y_local >= 11*32 )  && (y_local <= 12*32 ) && (512+48 <= x_local) && (x_local <= 512+48+200)) 
    {
      fill(255,50);
      rect(x, 11*32, 200, 32);
      s6name = selectInput();
    }

    if ((y_local >= 13*32 )  && (y_local <= 14*32 ) && (512+48 <= x_local) && (x_local <= 512+48+200)) 
    {
      fill(255,50);
      rect(x, 13*32, 200, 32);
      s7name = selectInput();
    }

    if ((y_local >= 15*32 )  && (y_local <= 16*32 ) && (512+48 <= x_local) && (x_local <= 512+48+200)) 
    {
      fill(255,50);
      rect(x, 15*32, 200, 32);
      s8name = selectInput();
    }

    if ((y_local >= 17*32 )  && (y_local <= 18*32 ) && (512+48 <= x_local) && (x_local <= 512+48+200)) 
    {
      fill(255,50);
      rect(x, 17*32, 200, 32);
      s9name = selectInput();
    }

    if ((y_local >= 19*32 )  && (y_local <= 20*32 ) && (512+48 <= x_local) && (x_local <= 512+48+200)) 
    {
      fill(255,50);
      rect(x, 19*32, 200, 32);
      s10name = selectInput();
    }
  }
}


