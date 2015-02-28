
float rot = 0, my_num = 0;



void setup() {
  size(600, 600);
  background(68);
  smooth();
  noStroke();
}

void drawRotatingRectangle(float x, float y, float rectSize, float r) {

  translate(x, y);
  rotate(r); 
  rect(0, 0, rectSize, rectSize);
  resetMatrix();
}

void draw() {
  background(68);
  
  float x = 0; 
  while ( x < 20) {
    float y = 0;
    while ( y < 10) {
      drawRotatingRectangle(200 + x * 10, 80 +y *50, 16 - x/2, rot + x*noise(my_num)/y);
      y++;

    }
    x++;
  }
  fill(255 * noise(my_num +100),255 * noise(my_num+40),255 * noise(my_num+200));
  rot += 0.05;
  my_num += 0.01;
  
}

