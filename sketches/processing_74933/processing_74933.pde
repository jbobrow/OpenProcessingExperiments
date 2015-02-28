
float my_float;
Rectangle pick_rectangle;
Rectangle square2;

void setup() {
  size(400, 400);

  pick_rectangle= new Rectangle();
  square2 = new Rectangle();
  square2.rect_x=200;
 
}

void draw() {
  background(200);
  pick_rectangle.move_rect();
  pick_rectangle.draw_rect();
  
  square2.move_rect();
  square2.draw_rect();
}
class Rectangle {
  float rect_x;
  float rect_y;

  float rect_xspeed;
  float rect_yspeed;

  Rectangle() { //constructor statement
    rect_x= 30;
    rect_y=30;

    rect_xspeed = 0;
    rect_yspeed = 2;
  } //end rectangle class
  
  void draw_rect() {
    rect(rect_x, rect_y, 30, 30);
  }

  void move_rect() {
    rect_y = rect_y + rect_yspeed;
    rect_yspeed = rect_yspeed + .3;
    if (rect_y > height - 30) {
      rect_yspeed = rect_yspeed * -1;
      rect_yspeed = rect_yspeed * .9;
      rect_y=height - 30;
    };
  }
}
