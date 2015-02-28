
float rect_x;
float rect_y;

float rect_xspeed;
float rect_yspeed;



void setup(){
  size(400, 800);
  rect_x = 30;
  rect_y = 30;
  
  rect_xspeed = 0;
  rect_yspeed = .2;
}


void draw(){
  background(200);
  move_rect();
  draw_rect();
}


void draw_rect(){
  fill(200, 30, 143);
  rect(rect_x, rect_y, 30,30);
}


void move_rect() {
  //rect_y += rect_yspeed; increasing linearly to draw//
  rect_y = rect_y + rect_yspeed;
  rect_yspeed = rect_yspeed + .3;
  if(rect_y > height - 30) {
      rect_yspeed = rect_yspeed * -.1;
      rect_y = height - 30;}
}
