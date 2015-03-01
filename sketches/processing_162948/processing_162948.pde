

float x = 5;
float y = 0.0;
float  q = 0.0;
float xVelocity = 0.08;
float yVelocity = 0.2;
int r = 0;
void setup() {
  size(500, 700);
  background(100);
}
void draw() {
  background(100);

  for (int f = 0; f < width; f = f + 10) {

    rect(mouseX-20, 500, 40, 20); 
    fill(255);
    ellipse(x, y, 30, 30);
    x = x + xVelocity;
    y = y + yVelocity;

    if (x > width || x < 0) {
      xVelocity *= -1;
    }
    text("Your score is:" + r, 20, 40);
    if (x>(mouseX-20) && x<(mouseX+20) && y >= 500 && y <520 ) {
      yVelocity *= -1;
      fill(random(360), 82, 94);
      //text("Your score is:" + r, 20, 40);
      r = r + 1;
      //xVelocity= xVelocity + .001;
    //} else if(y
  } else if (y > height || y< 0) {
  yVelocity *= -1;
  }
}
}


