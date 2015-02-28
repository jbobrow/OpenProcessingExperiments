
float  guataX, guataY, puntoD, puntoI, pX, pY, vX, vX1, vY, vY1, sz;
int index;
String[] gm = {
  "perdedor", "maaalo!", "loooser!", "nuuulo!"
};


void recomenzar() {
  size(600, 400);
  pX = random(20,580);
  pY = random(30);
  vX = 2;
  vY = 3;
  sz = 20;
  index = int(random(gm.length)); //elige una palabra al azar
  background(0);
}


void setup() {
  size(600, 400);
  pX= 30;
  pY= 30;
  vX=2;
  vY=3;
  sz=20;
}

void draw() {

  background(0);
  guataX = 300;
  guataY = 300;
  puntoD = mouseX-140;
  puntoI = mouseX+140;
  pX=pX+vX;
  pY=pY+vY;


  if (pY > height+sz) { //la bola se pierde abajo y eres un perdedor!!!
    fill(0, random(200, 255), 100, random(255));
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, width, height);
    textSize(48);
    fill(255, 100, 0);
    textAlign(CENTER);
    text(gm[index], width/2, height/3-10);
    textSize(14);
    text("clicka si no temes ser humillado", width/2, height/3+15);

    //si presionas puedes recomenzar
    if (mousePressed) {
      recomenzar();
    }
  }


  if ((pX+sz/2 >= width)||(pX-sz/2 <= 0)) {
    vX = -vX ;
  }
  if (pY-sz/2 <= 0) {// rebota y se aumenta la dificultad la bola va mas rápido
    for (float i=0.2; i< 5; i++) {
      vY = -vY+i;
    }

  }
    //el rebotador elastico solo funciona entre 
    if ((mouseY >= 290)&&(mouseY<=height-20)&&(mousePressed)) { //&&((puntoI >=0)||(puntoD>=500)&&(mousePressed)))

      guataY = mouseY;
      guataX = mouseX;
    }

    fill(255, 0, 0);
    noStroke();
    ellipse(pX, pY, sz, sz);
    stroke(255);
    strokeWeight(3);
    noFill();
    bezier(puntoD, 300, guataX, guataY, guataX, guataY, puntoI, 300);
    print(puntoD);
  }

void mouseReleased() {
  if ((pY+sz/2 <= guataY)&&(pY+sz/2 >= 301)&&(pX>=puntoD)&&(pX<=puntoI)) {
    vY = -vY;
  }
  else {
    pX=pX+vX;
    pY=pY+vY;
  }
}
