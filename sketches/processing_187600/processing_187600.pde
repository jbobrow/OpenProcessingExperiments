
//variables pantalla-menú principal
float pant1x, pant1y, pant2_1x, pant2_1y, 
pant2_2x, pant2_2y, pant2_3x, pant2_3y, 
pant3x, pant3y;
float sz_pantalla = 30;
//variables personaje
float posX_jugador, posY_jugador, sz_jugador;
boolean menu,pantalla_1;

void setup() {
  menu = true;
  pantalla_1 = false;
  ellipseMode(CENTER);
  rectMode(CENTER);
  size(500, 500);
  //posición inicial variables menú
  pant1x = 60;
  pant1y = 250;
  pant2_1x = pant1x + 120;
  pant2_1y = pant1y - 130;
  pant2_2x = pant1x + 120;
  pant2_2y = pant1y;
  pant2_3x = pant1x + 120;
  pant2_3y = pant1x + 320;

  //jugador
  posX_jugador = pant1x;
  posY_jugador = pant1y;
  sz_jugador = 25;
}

void draw() {
  if(menu = true){
  background(#C5CDEA);
  posiciones_menu();
  movimiento_menu();
  } else if (pantalla_1 = true){
    pantalla_1();
  }

}

void posiciones_menu() {
  //posiciones iconos pantalals
  rect(pant1x, pant1y, sz_pantalla, sz_pantalla);
  rect(pant2_1x, pant2_1y, sz_pantalla, sz_pantalla);
  rect(pant2_2x, pant2_2y, sz_pantalla, sz_pantalla);
  rect(pant2_3x, pant2_3y, sz_pantalla, sz_pantalla);

  //jugador
  ellipse(posX_jugador, posY_jugador, sz_jugador, sz_jugador);
}


void movimiento_menu() {
  //movimiento jugador menú
  //ir a pantalla 1
  if (mousePressed == true 
    && mouseX > pant1x - sz_pantalla/2 && mouseX < pant1x+sz_pantalla/2
    && mouseY > pant1y - sz_pantalla/2 && mouseY < pant1y+sz_pantalla/2) 
  { 
    posX_jugador = pant1x;
    posY_jugador = pant1y;
  }

  // ir a pantalla 2.1
  if (mousePressed == true 
    && mouseX > pant2_1x - sz_pantalla/2 && mouseX < pant2_1x+sz_pantalla/2
    && mouseY > pant2_1y - sz_pantalla/2 && mouseY < pant2_1y+sz_pantalla/2) 
  { 
    posX_jugador = pant2_1x;
    posY_jugador = pant2_1y;
  }

  // ir a pantalla 2.2
  if (mousePressed == true 
    && mouseX > pant2_2x - sz_pantalla/2 && mouseX < pant2_2x+sz_pantalla/2
    && mouseY > pant2_2y - sz_pantalla/2 && mouseY < pant2_2y+sz_pantalla/2) 
  { 
    posX_jugador = pant2_2x;
    posY_jugador = pant2_2y;
  }

  // ir a pantalla 2.3
  if (mousePressed == true 
    && mouseX > pant2_3x - sz_pantalla/2 && mouseX < pant2_3x+sz_pantalla/2
    && mouseY > pant2_3y - sz_pantalla/2 && mouseY < pant2_3y+sz_pantalla/2) 
  { 
    posX_jugador = pant2_3x;
    posY_jugador = pant2_3y;
  }
}

void pantalla_1() {
  background(20, 30, 40);
  text("PANTALLA UNO", width/2, height/2);
}

void keyPressed() {
  if (key == ENTER && posX_jugador == pant1x && posY_jugador == pant1y) {
    menu = false;
    pantalla_1 = true;
  }
}









