
class CARROT
{
  float x, y;
  float speed, xpos, ypos;
  float selecter;
  float d;

  CARROT()
  {

    ypos = (random(20, 500));
    speed = (random(3, 9));
    xpos=0;
  }
  void carrot()
  {
    {
      fill(240, 158, 48);
      noStroke();
      ellipse(xpos, ypos, 10, 55);
      xpos +=speed;
      d = dist(xpos, ypos, 780, mouseY);
     // if (mouseClicked)
      

      if (xpos>950)
      {  
        xpos = 0;
        ypos=  (random(20, 500));
        speed = (random(1, 9));
      }
        if (d<=40)
      {
        xpos =960;
        score -= 5;
      }
    }
  }
}


