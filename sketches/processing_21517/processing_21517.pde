
class Word {
  float x;
  float y;
  float speed;
  float w;
  float h;
  int ranIndex;

  Word(float tempX, float tempY, float tempW,float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speed = 0;
    ranIndex = int(random(0,21));
  }

  void gravity() {
    speed = speed + gravity;   //adds gravity
  }

  void move() {
    //reverse speed
    if (y<5) {              //boundary
      speed = speed * -.8; //slows down object
    }

    /* color c  = get(int(x), int(y-speed));
     if((red(c) == 255)&&(green(c) == 255)&&(blue(c) == 255))
     return;
     else */
    y = y-speed;
  }

  void display() {
    fill(22,random(206),242); //word color
    //rectMode(CENTER);
    text(words[ranIndex],x,y,w,h);
    textSize(random(28,30));
  }
}


