
PImage cauda;
PImage orelha;
PImage braco1;
PImage braco2;
PImage corpo;
PImage rosto;

//load das imagens
void setup() {
  size(500, 500);
  noStroke();
  cauda = loadImage("cauda.png");
  corpo = loadImage("corpo.png");
  orelha = loadImage("orelha.png");
  braco1 = loadImage("braco-esquerdo.png");
  braco2 = loadImage("braco-direito.png");
  rosto = loadImage("rosto.png");
}

void draw() {
  //background
  background(255);
  translate(250, 250);
  fill (255, 0, 0);
  ellipse(0, 0, 230, 230);

  //cauda
  if (mouseX < 250) {
    pushMatrix();
    rotate(radians(150));
    image(cauda, 0, 0);
    popMatrix();
  }
  else {
    pushMatrix();
    rotate(radians(270));
    image(cauda, 0, 0);
    popMatrix();
  }

  //braço esquerdo
  if (mouseY < 250) {
    pushMatrix();
    rotate(radians(180));
    image(braco1, -50, -15);
    popMatrix();
  }
  else {
    pushMatrix();
    image(braco1, -50, -15);
    popMatrix();
  }

  //braço direito
  if (mouseY < 250) {
    pushMatrix();
    rotate(radians(180));
    image(braco2, 15, -15);
    popMatrix();
  }
  else {
    pushMatrix();
    image(braco2, 15, -15);
    popMatrix();
  }

  //orelha esquerda
  if (mouseY < 250) {
    pushMatrix();
    translate(-20, -58);
    rotate(radians(180));
    image(orelha, 0, 0);
    popMatrix();
  }
  else {
    pushMatrix();
    translate(-20, -58);
    rotate(radians(90));
    image(orelha, 0, 0);
    popMatrix();
  }

  //orelha direita
  if (mouseY < 250) {
    pushMatrix();
    translate(20, -58);
    rotate(radians(270));
    image(orelha, 0, 0);
    popMatrix();
  }
  else {
    pushMatrix();
    translate(20, -58);
    image(orelha, 0, 0);
    popMatrix();
  }
  //corpo fixo
  pushMatrix();
  image(corpo, -40, -68);
  popMatrix();

  //rosto
  pushMatrix();
  image(rosto, -30, -50);
  popMatrix();
}



