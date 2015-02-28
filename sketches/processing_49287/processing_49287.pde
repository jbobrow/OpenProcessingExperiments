
//Serial Triangles Animation by Kenneth Auyeung
Caterpillar cat0;
Caterpillar cat1;
Caterpillar cat2;

void setup(){
  size(600, 600);
  smooth();
  //constuctor params: start_x, start_y, speed, color_speed, diameter
  cat0 = new Caterpillar(width/1.9, height/1.9, 4, 2.5, 13);
  cat1 = new Caterpillar(width/2, height/2, 7, 2.5, 15);
  cat2 = new Caterpillar(width/2.1, height/2.1, 8, 2.5, 12);
}

void draw() {
  if (frameCount < 3500) {
    cat0.display();
    cat1.display();
    cat2.display();
    strokeWeight(.025);
    line(cat0.x, cat0.y, cat1.x, cat1.y);
    line(cat1.x, cat1.y, cat2.x, cat2.y);
    line(cat2.x, cat2.y, cat0.x, cat0.y);
  }
}

class Caterpillar {
  float x, y;
  float speed;
  float c_speed;
  float diameter;
  float[] rgb_val;
  
  Caterpillar(float start_x, float start_y, 
              float speed, float c_speed, float diameter) {
    this.x = start_x;
    this.y = start_y;
    this.speed = speed;
    this.c_speed = c_speed;
    this.diameter = diameter;
    rgb_val = new float[3];
  }
  
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
  
  void color_shift() {
    for (int i = 0; i < 3; i++)
      rgb_val[i] += random(-(c_speed-.11), c_speed);
  }
  
  void display() {
    move();
    color_shift();
    fill(rgb_val[0], rgb_val[1], rgb_val[2]);
    ellipse(x, y, diameter, diameter);
  }
}                                                                                                                           
