

//noise takes one parameter gives value between 0 and 1
float n = 0;
void setup() {
  size(500, 500);
}
void draw() {
  background(255 * noise(n));
  stroke(255);

  float x = noise(n) * width;
  line(x, 0, x, height);
  
    float y = noise(n) * height;
  line(0, y, width, y);
  println(noise(n));

  n = n+0.01;
}


