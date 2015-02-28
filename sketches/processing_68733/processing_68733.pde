
float speed = 1;
PVector point_a = new PVector(350, 500);
PVector point_b = new PVector(350, 200);
PVector ship = new PVector(point_a.x, point_a.y);

void setup() {
  size(800, 800);
  strokeWeight(25);
  background(255);
}

void moveCloserTo(PVector src, PVector dest) {
  float x_distance = dest.x - src.x;
  float y_distance = dest.y - src.y;
  float divisor = sqrt(pow(x_distance+y_distance,2.0));
  float x_speed = speed*(x_distance/divisor);
  float y_speed = speed*(y_distance/divisor); 
  float margin = 5; 
  
  if(((src.x+margin > dest.x) && (src.x-margin < dest.x)) &&
     ((src.y+margin > dest.y) && (src.y-margin < dest.y))) {
    src.x = dest.x;
    src.y = dest.y;
  } else {  
    src.x = src.x + x_speed;
    src.y = src.y + y_speed;
  }  
}

void update() {
  moveCloserTo(ship, point_b);
}

void draw() {
  update();
  background(255);
  draw_point_a();
  draw_point_b();
  draw_ship();
}

void draw_player() {
  stroke(#F71BB9);
  point(player.x, player.y);
}

void draw_point_a() {
  stroke(#16B742);
  point(point_a.x, point_a.y);
}

void draw_point_b() {
  stroke(#F71B1B);  
  point(point_b.x, point_b.y);
}

void draw_ship() {
  stroke(0);
  point(ship.x, ship.y);
}
