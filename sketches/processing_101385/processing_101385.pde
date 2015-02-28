
float my_num = 0;

void setup() {
  size(400,400);
  smooth();
}

void draw() {
  background(noise(my_num + 100)*128);
  stroke(255);
  strokeWeight(1);
  float x = noise(my_num) * width;
  line(x,0, x, height);
  float y = noise(my_num) * width;
  line(0,y, width, y);
  fill(255,200,0,150);
  strokeWeight(2);
  ellipse(x,y,noise(my_num) * width, noise(my_num) * height);
  my_num += 0.01;
}
