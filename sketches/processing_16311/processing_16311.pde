
public class ColorBall {
  PVector pos;
  color c;
  float speed;
  boolean ALIVE = true;

  ColorBall(String mode) {
    pos = new PVector(random(0, width),random(-height/2, height));
    //c = color(#FF4C4C);
    c = color((int)random(0,255),(int)random(200,255),(int)random(200,255));
    if (mode.equals("colorfull"))
      speed = random(.2,1.5);
    else if(mode.equals("sketchy"))
      speed = 3;
  }

  void draw() {
    pos.y += speed;
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y,7,7);// random(2, 10),random(2, 10));
    if (pos.y > height) {
      ALIVE = false;
    }
  }
}


