
class Lightning
{  
  float x, y;
  float prevMillis = 0;
  float life;


  Lightning()
  {
    life = 255;
  }

  void display()
  {

    if (millis() - prevMillis < 500 && millis() > 500)
    {
      life-=8;
      fill(3, 255, 249, life);
      //ellipse(0, 0, 30, 30);
      pushMatrix();
      //fill(255, life);
      translate(mouseX, mouseY);
      shape(yellow, 50, 10, 100, 20);
      rotate(radians(100));
      shape(yellow, 50, 0, 80, 20);
      rotate(radians(150));
      shape(yellow, 25, 0, 80, 25);
      popMatrix();
      //ellipse(mouseX, mouseY, 30, 30);
    }
  }
  void refresh()
  {
    prevMillis = millis();
    life=255;
  }
}


