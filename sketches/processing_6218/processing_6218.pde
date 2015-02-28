
//based off of example 43-10 from Processing

class Bot {
  float x, y;
  float speed;
  int direction = 1;
  PImage tb, lleg, rleg;
  float s;
  float a = 0.0;
  float angleInc = PI/1.5;
  float scalar = 1.05;

  Bot (float xpos, float ypos, float sp) {
    x = xpos;
    y = ypos;
    speed = sp;
    tb = loadImage("tb.gif");
    lleg = loadImage("lleg.gif");
    rleg = loadImage("rleg.gif");
  }
  
  void Move (){
    y+=(speed * direction);
    if ((y > (height-90)) || (y < 0)){
      direction *=-1;
    }
  }
  
  
  void Display (){
    //marching
    float lpos, rpos;
    float m = millis();
    //x vibration
    a = a + angleInc;
    s = sin(a)*scalar;
    //leg oscilation
    lpos = y + 60;
    rpos = y + 45;
    if (m % 4 < 2){
      lpos = y + 80;
    }
    else {
      rpos = y + 65;
    }
    image (lleg, x, lpos, 20, 37);
    image (rleg, x+35, rpos, 17, 37);
    image (tb, x+s, y);
  }

}



