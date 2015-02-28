
/*=======================================
 Autora:Katielen de Castro Silva
 Data da criação:05/11/2013
 A ideia principal do código foi representar de forma 
 dinamica o halllowen,e também revisar algumas funções 
 do processing.Como imagem,if,else,void mouseClicked e 
 mouseMoved,mousePressed.
 =======================================================*/
int x=0;
int y=0;
PImage casa;
PImage varcem;
PImage mj;
void setup() {
  size(300, 300);
  varcem=loadImage("cemiterio.jpg");
  casa=loadImage("casa1.jpg");
  mj=loadImage("michael.jpg");
}

void draw() {
  image(casa, 1, 1);
  //Corpo
  noStroke();
  fill(255, 20);
  ellipseMode(CENTER);
  ellipse(130, 150, 80, 150);
  //Olhos
  fill(0);
  ellipse(120, 110, 5, 10);
  fill(0);
  ellipse(140, 110, 5, 10);
  //Boca
  fill(0);
  ellipse(130, 180, 30, 50);

  if (mousePressed == true) {
    image (casa, 1, 1);
    image(varcem, 1, 1);

    if (x<200)
      x+=1;
    else
      x=0;
    y+=1;
    fill(227, 55, 55);
    textSize(25);
    text("THRILLER", x, y);

    noCursor();
    fill(0);
    image(mj, mouseX, mouseY, 70, 70);
  }
}

void mouseClicked() {
  image(casa, 1, 1);
  image(varcem, 1, 1);
}

void mouseMoved() {

  fill(252, 104, 5);
  textSize(25);
  text("THIS IS HALLOWEEN!!!", 40, 290);
  fill(255);
  textSize(70);
  text("BOO!!", 10, 60);
}



