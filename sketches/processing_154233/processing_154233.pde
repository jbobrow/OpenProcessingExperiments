
float mouthSize;
float mouthSize2;
float pacX;
float pacY;
float velocity;
float x, y, x1, y1, x2, y2;
void setup () {
  size (750, 750);
  background (0);
  mouthSize = PI/5;
  mouthSize2 = 2*PI - mouthSize;
  pacX = 100;
  pacY = height/2;
  x = random(700);
  y = random(700);
  x1 = random(700);
  y1 = random(700);
  x2 = random(700);
  y2 = random(700);
}
void draw () {

  background(0);

  fill (255, 255, 255);
  ellipse (x, y, 40, 40);
  ellipse (x1, y1, 40, 40);
  ellipse (x2, y2, 40, 40);
  fill (255, 255, 0);
  arc(pacX, pacY, 200, 200, mouthSize, mouthSize2 );

  if (keyPressed)
    if (key == 'w')
    {
      pacY-=3;
    }
  if (keyPressed)
    if (key == 's'){
      pacY+=3;  
      mouthSize =  12*PI/10 + PI /22;
      mouthSize2 = 8*PI/10+3*PI / 2;
        }
  if (keyPressed)
    if (key == 'd') {
      pacX+=3;
      mouthSize = PI/5;
      mouthSize2 = 2*PI - mouthSize;
    }
      if (keyPressed)
        if (key == 'a') {
          pacX-=3;
          mouthSize =  12*PI/10;
          mouthSize2 = 8*PI/10+2*PI;
        }
      if (dist(pacX, pacY, x, y) < 100) {
        println("you got one!");
        x = 1000;
        y=1000;
      }
      if (dist(pacX, pacY, x1, y1) < 100) {
        println("you got one!");
        x1 = 1000;
        y1=1000;
      }
      if (dist(pacX, pacY, x2, y2) < 100) {
        println("you got one!");
        x2 = 1000;
        y2=1000;
      }
    }

