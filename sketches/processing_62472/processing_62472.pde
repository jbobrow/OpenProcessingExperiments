
class Ball {

  Ball(float _x, float _y) {
  }
  void update() {
    stroke(0);
    strokeWeight(.5);
    smooth();

    int step = 10;
    float lastx = -9;
    float lasty = -9;
    float ynoise = random(100);
    float y;

    for (int x = 20; x<=80; x+=step) {
      y = 10 + noise(ynoise)*40;
      if (lastx > -999) {
        


        ellipse(width/2+xSpeed, height/2+ySpeed, 5+lastx+mouseX, 5+lasty+mouseY);
        
      }
      lastx = x;
      lasty = y;
      ynoise +=.1;
      smooth();
    }
  }
}


