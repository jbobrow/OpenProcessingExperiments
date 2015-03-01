
Tinta tintas;
int posX, posY;

void setup() {
  size(940,60);
  tintas = new Tinta();
}

void draw() {
  posX = (int) random(0,width);
  posY = (int) random(0,height);
  tintas.desenha(posX,posY);
}
class Tinta {

  int totalPt, sizePt, corPt, R, G, B, bg;
  float sentX, sentY, 
  sentXOld, sentYOld;

  Tinta() {
    R = (int) random(255);
    G = (int) random(255);
    B = (int) random(255);
    bg = 0;
    sentX = random(-2, 2);
    sentY = random(-2, 2);
  }

  void desenha(float X, float Y) {
    totalPt=(int) random(1, 40);

    //–––––––––Primeiro pingo–––––––––––––––
    //corPt=(int) random(360);
    R = (int) random(255);
    G = (int) random(255);
    B = (int) random(255);
    sizePt=(int) random(1, 50);
    fill(R, G, B);
    noStroke();
    ellipse(X, Y, sizePt, sizePt);

    //––––––––Sentido X–––––––––––
    sentXOld = sentX;
    if (sentX == sentXOld) {
      while (sentX == sentXOld) {
        sentX = random(-2, 2);
      }
    }
    sentX = random(-2, 2);
    //println(sentX);

    //–––––––Sentido Y–––––––––––
    sentYOld = sentY;
    if (sentY == sentYOld) {
      while (sentY == sentYOld) {
        sentY = random(-2, 2);
      }
    }
    sentY=random(-2, 2);
    //println(sentY);

    //–––Restante dos pingos–––––
    for (int I=0; I<=totalPt; I++) {
      int distX=int(random(25));
      int distY=int(random(25));
      X=X+int(distX*sentX);
      Y=Y+int(distY*sentY);
      sizePt=(int)random(1, 50);
      fill(R, G, B);
      ellipse(X, Y, sizePt, sizePt);
    }
  }
}



