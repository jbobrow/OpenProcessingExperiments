
//snowflake class
class Snowflake {
  color c;
  float xpos;
  float ypos;
  float yspeed;

  Snowflake (float tempX, float tempY, float tempSpeed) {
    c = color (255);
    xpos = tempX;
    ypos = tempY;
    yspeed = tempSpeed;
  }

  void display () {
    fill (c);
    stroke(255, 127);  
    strokeWeight (5);
    Snow (xpos, ypos, random (40,70));
  }

  void snowing () {
    ypos = ypos + yspeed;
  }
}


