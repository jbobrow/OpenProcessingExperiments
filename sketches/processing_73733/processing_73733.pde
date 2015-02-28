
class BadConclusion {

  PImage fin;
  PImage Explosion;
  PImage EvilHamburger2;

  BadConclusion () {
    size(400, 400);
    smooth();

    fin = loadImage("fin.png");
  }

  void update() {
    image (fin, 0, 0);

    PFont font;
    font = loadFont("HoboStd-30.vlw");
    textFont(font);
    textSize(60);
    fill(255);
    text(Score, 180, 120);

    if (millis() > 65000 && scene == BADCONCLUSION) {
      scene = RESET;
    }
   }
  }



