
class Square {
  int x; // x location of square
  int y; // y location of square
  int w; // width of square
  int h; // height of square

  int speed; //speed of square
  int state; // square state
  int level;

  int r;
  int g;
  int b;

  Square(int pos, int w, int h, int speed) {
    this.x = pos*w; // based on the pos*w
    this.y = pos*h; // based on the pos*h
    this.w = w;
    this.h = h;

    this.speed = speed; //speed of square
    state = 0; // square state

    level = pos;
  }

  void setFill(int r, int g, int b) { 
    fill(r,g,b);
  }

  void drawSquare() {
    //stroke(0);
    rect(x, y, w, h); //rect

    // If state= 0, move to the right
    if (state == 0){
      x = x + speed;
      if (x > width-(level*w)-w){ 
        x = width-(level*w)-w;
        state = 1;
      }
      // If state = 1, move down right side  
    } 
    else if (state == 1){
      y = y + speed;
      if (y > height-(level*h)-h){
        y = height-(level*h)-h;
        state = 2;
      }

    } 
    else if (state == 2){
      x = x - speed;
      if (x < level*w){
        x = level*w;
        state = 3;
      }
    } 
    else if (state == 3){
      y = y - speed;
      if (y < level*h){
        y = level*h;
        state = 0;
      }
    }
  }

  void drawRevSquare() {
    rect(x, y, w, h); //rect

    if (state == 0){
      y = y + speed;
      if (y > height-(level*h)-h){
        y = height-(level*h)-h;
        state = 1; 
      }
    } 
    else if (state == 1) {
      x = x + speed;
      if (x > width-(level*w)-w){
        x = width-(level*w)-w;
        state = 2;
      }
    } 
    else if (state == 2){
      y = y - speed;
      if (y < level*h){
        y = level*h;
        state = 3;
      }
    } 
    else if (state == 3){
      x = x - speed;
      if (x < level*w){
        x = level*w;
        state = 0;
      }
    }
  }
}







