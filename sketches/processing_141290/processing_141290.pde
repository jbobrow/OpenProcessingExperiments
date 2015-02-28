
Fortune fortune;
Ball ball;

void setup() {
  background(127);
  size(600, 600);
  ball = new Ball(300, 250);
  fortune = new Fortune();
}

void draw() {
  ball.update();
  fortune.update();
  
  background(127);

  ball.draw();
  fortune.draw();
}
void mousePressed(){
  fortune.reset();
}

void mouseReleased(){
  //text fades in
  fortune.fadeIn();
}
class Ball {
  private PFont font;
  private int x;
  private int y;
  private int shakeOffsetY;
  public Ball(int posx, int posy) {
    x = posx;
    y = posy;
    shakeOffsetY = 0;
    font = createFont("Arial", 16, true);
  }  
  void draw() {
    textFont(font, 80);                 

    fill(0);
    ellipse(x, y + shakeOffsetY, 300, 300);

    fill(255);
    ellipse(x, y + shakeOffsetY, 150, 150);

    fill(0); 
    textAlign(CENTER);  
    text("8", x, y + 20 + shakeOffsetY);
  }
  void update() {
    shakeOffsetY = 0;
    if (mousePressed) {
      shakeOffsetY = (int)random(-10, 10);
    }
  }
}

class Fortune {
  private PFont font;
  private boolean isFadingIn;
  private int alpha;
  private String[] fortuneTexts = new String[5];
  private int fortuneIndex;

  public Fortune() {
    font = createFont("Arial", 16, true);
    reset();
    fortuneTexts[0] = "This fortune isn't real.";
    fortuneTexts[1] = "This random message has no bearing on your life.";
    fortuneTexts[2] = "The universe doesn't care about you. Do what you want.";
    fortuneTexts[3] = "Your day is as wonderful as you want it.";
    fortuneTexts[4] = "Have a cookie. Unless you're diabetic. Then don't have a cookie.";
  }

  void update() {
    if (alpha == 255) {
      isFadingIn = false;
    }

    if (isFadingIn) {
      alpha++;
    }
  }

  void draw() {
    rect(0, 460, 600, 140);

    textFont(font, 32);
    fill(255, alpha); 
    textAlign(CENTER);  
    text(fortuneTexts[fortuneIndex], 10, 470, 580, 140);
  }

  void fadeIn() {
    isFadingIn = true;
  }

  void reset() {
    isFadingIn = false;
    alpha = 0;
    fortuneIndex = (int)random(0,fortuneTexts.length);
    //println("Picking index: " + fortuneIndex);
  }
}



