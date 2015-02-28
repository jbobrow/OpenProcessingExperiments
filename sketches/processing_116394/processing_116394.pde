
int numberTacos;
GravityBall paco;
GravityBall maria;
void setup() {
  size(400, 600);
  paco = new GravityBall( color(200, 3, 10) );
  maria = new GravityBall( color(20, 130, 10) );
  maria.gravity = .3;
}
void draw() {
  background(200);
  paco.display();
  paco.move();
  maria.display();
  maria.move();
}
class GravityBall {
  float x;
  float x_speed;
  float y;
  float y_speed;
  float gravity;
  color fill_color;

  GravityBall(color temp_color) {
    x = 50;
    y = 63;
    y_speed = 0;
    x_speed = random(-4, 4);
    gravity = .2;
    fill_color = temp_color;
  }
  void display() {
    fill(fill_color);
    ellipse(x, y, 20, 20);
  }
  void move() {
    y += y_speed;
    y_speed += gravity;

    x += x_speed;
    if (y >= height) {
      y = 40;
      y_speed = -2;
      x = random(width);
      x_speed = random(-4, 4);
    }
  }
}



