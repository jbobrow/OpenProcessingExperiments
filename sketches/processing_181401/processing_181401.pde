
Button knopf;
Moorhuhn hendl;

int counter = 0;
int score = 0;

void setup() {
  size (500, 500);
  knopf = new Button (200, 300, 20, 20);
  hendl = new Moorhuhn("Moorhuhn.gif");
  knopf.onoff = "on";
}

void draw () {
  background (0);
  textSize(20);
  fill(255);
  text("Clicks " + counter, 50, 50);
  text("Score " + score, 50, 80);
  hendl.zeichne();
}

void mousePressed() {
  if (knopf!=null) knopf.klick();
  if (hendl.klick()) {
    hendl.setPosition();
    score++;
  }
  counter++;
}

class Moorhuhn extends Button {

  PImage img;

  Moorhuhn(String bild) {
    super(200, 200, 50, 50);
    img = loadImage(bild);
    weite = img.width;
    hoehe = img.height;
  }

  void zeichne() {
    xPos+=5;
    if (xPos > width) xPos = -weite; 
    {
      speed++;
      yPos += speed;
      if (yPos >= height-25) {
        speed *= -1;
        yPos = height-25;
      }
    }
    image(img, xPos, yPos);
  }

  void setPosition() {
    xPos = floor(random(0, width));
    yPos = floor(random(0, height));
  }
}

class Button {

  protected int xPos;
  protected int yPos;
  protected int weite;
  protected int hoehe;
  protected int speed;

  public String onoff = "off";

  Button(int xPos, int yPos, int weite, int hoehe) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.weite = weite;
    this.hoehe = hoehe;
  }

  public boolean klick() {
    if (mousePressed && darueber()) return true;
    else return false;
  }

  protected boolean darueber() {
    if (mouseX > xPos
      && mouseX < xPos +weite
      && mouseY > yPos
      && mouseY < yPos +hoehe) {
      return true;
    } else {
      return false;
    }
  }
}



