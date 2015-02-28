
float x = 120;
float y = 60;
int radius = 12;
float easing = 0.05;
float speed = 0;
float gravity = 0.1;
float upwardforce = -0.75;

void setup() {
  size(240, 120);
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background(204);

  fill(0);
  text(x, 15, 10);
  text(y, 15, 30);

  fill(255);
  float targetX = mouseX; 
  float targetY = mouseY;
  if (mousePressed) {
    if (targetX > x && x < width - 12 || targetX < x && x > 12) {
      x += (targetX - x) * easing;
    }
    if (targetY < y && y > 12 || targetY > y && y < height - 12) {
      y += (targetY - y) * easing;
    }
  } 
  else {
    y += speed;
    speed += gravity;
    if (y > height - 12) {
      y = height - 12;
      if (speed < 0.65) {
        speed = 0;
      } else {
        speed *= upwardforce;
        upwardforce += 0.01 * gravity;
      }
    }
  }  
  ellipse(x, y, radius, radius);
  

}
                
                                              
