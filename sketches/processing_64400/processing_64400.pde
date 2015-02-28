
PFont font;

ArrayList<Ripple> ripples;
int rippleWidth = 10;

String words = "HELLOWORLD";
int len = words.length();
int angle = 360 / len;
int radius = 50;


void setup() {
  size(500, 500);
  smooth();
  noStroke();
  //frameRate(30);

  ripples = new ArrayList<Ripple>();
  ripples.add(new Ripple(this, width/2, height/2, rippleWidth));

  colorMode(HSB, 360, 100, 100);

  font = loadFont("font.vlw");
  textFont(font);
  textAlign(CENTER);
}

void draw() {
  background(360);

  Ripple ripple;
  for (int i=0; i<ripples.size(); i++) {
    ripple = ripples.get(i);
    ripple.wave();
    ripple.display();
    if (ripple.finished()) {
      ripples.remove(i);
    }
  }
}

void mousePressed() {
  float x, y;
  for (int i=1; i<=10; i++) { 
    float z = 36*i;
    x = mouseX;// + 100 * sin(radians(z));
    y = mouseY;// - 100 * cos(radians(z));
    ripples.add(new Ripple(this, x, y, rippleWidth));
  }
}

public class Ripple {
  PApplet papplet;

  float x, y, w;
  float life;

  public Ripple(PApplet p, float x, float y, float w) {
    papplet = p;
    this.x = x;
    this.y = y;
    this.w = w;
    this.life = 75;
  }

  public void wave() {
    w += w/30;
  }

  public boolean finished() {
    life--;
    if (life < 0) {
      return true;
    }
    else {
      return false;
    }
  }

  public void display() {
    //papplet.fill(random(50), random(100), random(255), life);
    papplet.pushMatrix();
    papplet.translate(x, y);
    for (int i = 0; i  < len; i++) {

      papplet.pushMatrix();

      papplet.rotate(radians(i * angle - 90));
      papplet.translate(radius*1.8, 0);
      papplet.rotate(radians(90));
      papplet.fill(i * angle * 100 / 360, 100, 100, life);
      //papplet.fill(179, 53, 100);
      papplet.textSize(w);
      papplet.text(words.charAt(i), 0, 0);
      papplet.popMatrix();
    }
    papplet.popMatrix();
    //papplet.text(x, y, w, w);
  }
}

