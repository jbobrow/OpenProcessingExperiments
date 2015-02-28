
Rectangle[] squares = new Rectangle[200];
void setup() {
  size(400, 400);

  for (int i=0; i < 200; i = i+1) {
    squares[i] = new Rectangle();
    squares[i].rect_x = i*2;
    squares[i].rect_y = i;
    squares[i].rect_yspeed = squares[i].rect_yspeed * random(1);//this makes it jagged
  }
}
void draw() {
  background(200);
  for (int i=0; i < 200; i = i+1) {
    squares[i].move_rect();
    squares[i].draw_rect();
  }
}
class Rectangle {
  float rect_x;
  float rect_y;

  float rect_xspeed;
  float rect_yspeed;

  Rectangle() {//constructor statement
    rect_x = 30;
    rect_y = 30;

    rect_xspeed = 0;
    rect_yspeed = 2;
  }
  void draw_rect() {
    fill(200, 30, 143);
    rect(rect_x, rect_y, 30, 30);
  }
  void move_rect() {
    //  rect_y += rect_yspeed;
    rect_y = rect_y + rect_yspeed;
    rect_yspeed = rect_yspeed + .3;
    if (rect_y > height - 30) {
      rect_yspeed = rect_yspeed * -1;//bounce
      rect_yspeed = rect_yspeed * .9;//lose a bit of bounce
      rect_y = height - 30;
    }
  }
}//end Rectangle class
