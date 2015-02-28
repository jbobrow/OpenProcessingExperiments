
class Robot
{
  float x;
  float y;
  float w;
  float h;
  float LEDw;
  float LEDh;
  float hu;
  float angle;
  float grey;
  int i = -1;
  int j = 1;

  Robot(float xpos, float ypos, float wid, float hei, float huu, float ang, float gre)
  {
    x = xpos;
    y = ypos;
    w = wid;
    h = hei;
    LEDw = wid;
    LEDh = hei;
    hu = huu;
    angle = ang;
    grey = gre;
  }

  void LEDupdate()
  {  
    LEDw += 3*i;
    LEDh += 1.1*i;

    if (LEDw <= w/3 || LEDw >= w)
    {
      i = -i;
    }
    if (LEDh <= h/3 || LEDh >= h*1.3)
    {
      j = -j;
    }
  }

  void clickUpdate()
  {
    float newx = mouseX;
    float newy = mouseY;
    float neww = random(75, 200);
    float newh = random(50, 200); 
    float newhu = random(0, 355);
    float newang = random(180, 270);
    float newgre = random(37, 89);
    x = newx;
    y = newy;
    w = neww;
    h = newh;
    LEDw = neww;
    LEDh = newh;
    hu = newhu;
    angle = newang;
    grey = newgre;
  }

  void display()
  {
    tint(random(0,360), 100, 100, 70);
    shape(leds[int(random(0,4))], x-((5*LEDw)/11), y-(LEDh*1.55), LEDw*.9, LEDh*1.5);
    
    fill(0, 0, grey);
    arc(x + random(0,2), y+random(0,2), w, h, radians(180), radians(360));
    
    strokeWeight(2);
    stroke(0);
    fill(359, 100, 100);
    ellipse(x-(w/4) + random(0,2), y-(h/6) + random(0,2), h/13, h/13);
    ellipse(x+(w/4) + random(0,2), y-(h/6) + random(0,2), h/13, h/13);
    
    float mouthY = sin(frameCount/10.0);
    if(mouthY % 2 == 0)
      {mouthY = -mouthY;}
    fill(random(0,360), 100, 100);
    rect(x-(w/10) + random(0,2), y-5 + random(0,2), w/5, mouthY*8);
  }
}


