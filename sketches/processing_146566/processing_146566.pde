
/*
 Autor: Joan Soler-Adillon (www.joan.cat)
 Tutorial de Processing
 */

var audioElement = document.createElement("audio");



int posX, posY, velX, velY;
int sz = 20;

void setup() {
  size(400, 300);
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 4;

}

void draw() {
  background(0);

  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;

  //dibuixem
  ellipse(posX, posY, sz, sz);

  //comprovem la posiciÃ³ X
  if ((posX<0)||(posX>width)) {
    velX = -velX;
audioElement.setAttribute("src", "poik.mp3");
  audioElement.play();
  }
  if ((posY<0)||(posY>height)) {
    velY = -velY;
      audioElement.setAttribute("src", "poik.mp3");
  audioElement.play();  }
}




