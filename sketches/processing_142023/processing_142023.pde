
class Face {
  PVector pos, speed;
  float gravity = 1.5;
  int time;
  float percentTime = 0;
  Face() {
    pos = new PVector( mouseX, mouseY);
    speed = new PVector(random(0, 0.5), random(2,50));
    time = millis();
  }
  void update() {
    percentTime = float((millis()-time))/3000.0;
    pos.add(speed);
    speed.y -= gravity;
    if(pos.y < 0) {
      speed.y *= -.50;
      pos.y = 10;
    }
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
  }
  void display() {
    float w = ( 1- percentTime) * 50;
    float x= (2 + percentTime) *10;
    float y= (10 / percentTime) *2;

    strokeWeight(3);
    fill(250 * percentTime, 0, 200);
    rect(pos.x - 5 * noise(percentTime), pos.y, x, w);
    fill(0 * percentTime, 250, 100);
    ellipse(pos.x + 400 * noise(percentTime), pos.y+10, y +3, y);
    fill(random(250 * percentTime, 250));
    rect(pos.y - 10 / noise(percentTime), pos.x, w, x);
  }
}

