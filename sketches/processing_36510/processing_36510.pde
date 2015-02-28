


float t = 0;
float max_fps = 30;
float x_inc = 0;
float y_inc = 0;

void setup() {
  size(640,640);
  frameRate(max_fps);
  //smooth();
}

void draw() {
  background(0);
  stroke(255);
  
  int dx = 5;
  int dy = 10;
  float wave_height = 200;
  float speed = 0.1;
  
  if (mousePressed) {
    x_inc += -pow(2*(mouseX / (float)width - 0.5), 5);
    y_inc += -pow(2*(mouseY / (float)height - 0.5), 5);
  }
  
  for(int y = dy; y < height; y += dy) {
    int last_y = y;
    for(int x = 0; x < width; x += dx) {
      int next_y = y + floor(wave_height*noise(0.005 * x + x_inc, 0.005 * y + y_inc, speed * t / max_fps) - wave_height/2);
      line(x, last_y, x + dx, next_y);
      last_y = next_y;
    }
  }
  
  t += 1.0;
}


