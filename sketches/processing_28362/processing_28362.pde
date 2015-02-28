
class Dotty
{
  /* parameters to play with */
  int temperament = 4;
  float speed = 0.4; // 0 - 1
  int transparency = 30; // 0 - 255
  float splitfactor = 10; // 1 - ...
  
  /* nothing to play with */
  float xPos;
  float yPos;
  float direction;
  
  Dotty( float oX, float oY, float oDirection, boolean theFirstOne )
  {
    xPos = oX;
    yPos = oY;
    if(theFirstOne == true)
    {
      direction = 270;
    }
    else
    {
      direction = oDirection + ( random( -1, 1 ) * splitfactor );
    }
    stroke( random(255), random(255), random(255), transparency ); // "problem": wie mach ich, dass die farben nur für einen strang sind? pushstyle/popstyle?
  }
  
  void updateMe()
  {
    direction += random( -temperament, temperament );
    xPos += cos( radians( direction ) ) * speed;
    yPos += sin( radians( direction ) ) * speed;
  }
  
  void drawMe()
  {
    point( xPos, yPos );
  }
}

