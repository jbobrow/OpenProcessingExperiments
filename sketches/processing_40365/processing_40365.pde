
public class Fly
{
  String word;
  float[] splatX;
  float[] splatY;
  float xPos;
  float yPos;
  float centerX;
  float centerY;
  boolean alive;
  PFont font;
  float distanceX;
  float distanceY;
  float rads;
  
  Fly()
  {
    word = "flies";
    splatX = new float[5];
    splatY = new float[5];
    alive = true;  
    font = loadFont("HelveticaNeue-CondensedBold-14.vlw");
    textFont(font);
    rads = 0.0;
    distanceX = random(50, 200);
    distanceY = random(50, 200);
    centerX = random(100, 500);
    centerY = random(100, 500);
  }
  
  void squish()
  {
    alive = false;
    for(int i = 0; i < 5; i++)
    {
      splatX[i] = random(xPos - 50, xPos + 50);
      splatY[i] = random(yPos - 50, yPos + 50);
    }
  }
  
  boolean isAlive() { return alive; }
  
  void update()
  {
    if(isAlive())
    {
       xPos = centerX + distanceX * sin(rads) + random(10, 50) * noise(1.0, 2.0);
       yPos = centerY + distanceY * cos(rads) + random(10, 50) * noise(1.0, 2.0);
       
       text(word, xPos, yPos);
       rads += PI/64;
       
    }
    else
    {
      for(int i = 0; i < word.length(); i++)
        text(word.substring(i, i + 1), splatX[i], splatY[i]);
    }
  }
  
  float getX() { return xPos; }
  
  float getY() { return yPos; }
}

