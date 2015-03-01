
float num = 10;

void setup() {
  size(800, 800);
  background(0);
  stroke(random(100, 256), random(100, 256), random(100, 256), 50);
}

void draw() {
  translate(width/2, height/2);
  rotate(radians(num));
  for (int i = 0; i < 360; i+=10) {

    float x = sin(radians(i+num)) * (num+80);
    float y = cos(radians(x)) / (num-60);
    point(x, y);
    point(y, x);
    point(-x, -y);
    point(-y, -x);
  }

  if (num > 600)
    {
       num += 10;
    }
  else
    {
       num += 2;  
    }
}



