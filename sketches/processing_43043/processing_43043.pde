
class duo
{

  int x;
  int y;
  int w;
  int h;
  duo()
  {
    x=20;
    y=150;
    w=250;
    h=350;
  }

  void drawDuo()
  {
    //BOARD
    //strokeWeight(2);
    fill(9, 100, 131);
    rectMode(CORNER); 
    rect(x, y, w, h);
    //ANALOG IN PIN
    textFont(f, 12);
    noStroke();
    fill(50);
    rect(x+5, y+260, 15, 85);
    fill(0);
    ellipse(x+12, y+270, 10, 10);
    fill(255);
    text("A0", 45, 425);
    textFont (f, 25);
    text("CLICK pin A0 to turn on the LED", 25, 50);
  }
}


