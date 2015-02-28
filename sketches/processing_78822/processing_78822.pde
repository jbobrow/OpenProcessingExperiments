
float el_x = 200;
float el_y = 0;
float el_speed = 0;
float gravity = .3;

void setup() {
  size(400, 400);
}


  
void draw() {
  background(200);
  ellipse(el_x, el_y, 20, 20);
  el_y += el_speed;
  el_speed += gravity;
  
  if(el_y > height) {
    el_y = 0;
    el_speed = 0;
    el_x = random(width);
  }
  
  
}

