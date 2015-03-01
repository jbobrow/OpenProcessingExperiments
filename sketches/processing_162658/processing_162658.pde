
float num;

void setup() {
  size(640, 640);
  background(0);
  fill(255, 50);
  noStroke();
}

void draw() {
  translate(width/2, height/2);
  rotate(radians(num*50));
  /* Play around with the values for different patterns */
  float x = sin(radians(num*50)) * (sin(num)*200);
  float y = cos(radians(x)) * x;
  /* Our size is dependent on x and has a max size of 10 */
  float d = sin(x/100) * 10;

  /* 
   You may be thinking of using the point function and changing the strokeweight. However because our
   d (size) variable goes into negative numbers, the program will return an error. Also ellipses without 
   stroke gives a cleaner look.
   */
  ellipse(x, y, d, d);
  ellipse(-x, -y, d, d);

  num+=0.01;
}



