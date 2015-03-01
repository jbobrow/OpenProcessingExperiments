
//se usan las teclas awsd, y las flechas
//lo que tienes que hacer es chocar al otro cuadrado
//nota: no intente hacer que se muevan los dos cuadrados okno


int xpos= 270;
int ypos= 130;
boolean arriba;
boolean abajo;
boolean izquierda;
boolean derecha;
//
int xbot= 150;
int ybot= 200;
boolean arribaBot;
boolean abajoBot;
boolean izquierdaBot;
boolean derechaBot;

int plomo=100;

void setup() {
  size(400, 400);
  noStroke();
}
void draw() {
  background(#EA0E37);
  jugadorBot();
  jugadorPlayer();
  pushStyle();
  fill(255);
  text(int(frameRate),10 , 10);
  popStyle();
}
//JugadorBot
void jugadorBot() {
  if (arribaBot== true) {
    ybot= ybot- 1;
  }
  if (abajoBot== true) {
    ybot= ybot+ 1;
  }
  if (izquierdaBot== true) {
    xbot= xbot- 1;
  }
  if (derechaBot== true) {
    xbot= xbot+ 1;
  }
  //TOCANDO
  
  if ((xbot+10>= xpos && xbot- 10<= xpos) && (ybot+10>= ypos && ybot- 10<= ypos)) {
    plomo= 100;
    fill(plomo);
  } else {
    plomo= 255;
    fill(plomo);
  }
  if (xbot+10>= xpos) {
    if (xbot- 10<= xpos) {
      if (ybot+10>= ypos) {
        if (ybot- 10<= ypos) {
          xbot= xbot- 1;
        }
      }
    }
  }
  if (xbot- 10<= xpos) {
    if (xbot+10>= xpos) {
      if (ybot+10>= ypos) {
        if (ybot- 10<= ypos) {
          xbot= xbot+ 2;
        }
      }
    }
  }
  if (ybot+10>= ypos) {
    if (xbot+10>= xpos) {
      if (xbot- 10<= xpos) {
        if (ybot- 10<= ypos) {
          ybot= ybot- 1;
          xbot= xbot- 1;
        }
      }
    }
  }
  if (ybot- 10<= ypos) {
    if (xbot+10>= xpos) {
      if (xbot- 10<= xpos) {
        if (ybot+10>= ypos) {
          ybot= ybot+ 2;
        }
      }
    }
  }
 
  ellipse(xbot, ybot, 55, 55);
  fill (#C9EA0E);
}
//JugadorPlayer
void jugadorPlayer() {
  if (arriba== true) {
    ypos= ypos- 1;
  }
  if (abajo== true) {
    ypos= ypos+ 1;
  }
  if (izquierda== true) {
    xpos= xpos- 1;
  }
  if (derecha== true) {
    xpos= xpos+ 1;
  }
  //
  
  ellipse(xpos, ypos, 55, 55);
  
}
//Teclado
void keyPressed() {
  if (key== 'w') {
    arriba= true;
  }
  if (key== 'a') {
    izquierda= true;
  }
  if (key== 's') {
    abajo= true;
  }
  if (key== 'd') {
    derecha= true;
  }
  //bot
  if (key== CODED) {
    if (keyCode== UP) {
      arribaBot= true;
    }
    if (keyCode== DOWN) {
      abajoBot= true;
    }
    if (keyCode== LEFT) {
      izquierdaBot= true;
    }
    if (keyCode== RIGHT) {
      derechaBot= true;
    }
  }
}

void keyReleased() {
  if (key== 'w') {
    arriba= false;
  }
  if (key== 'a') {
    izquierda= false;
  }
  if (key== 's') {
    abajo= false;
  }
  if (key== 'd') {
    derecha= false;
  }
  //
  if (key== CODED) {
    if (keyCode== UP) {
      arribaBot= false;
    }
    if (keyCode== DOWN) {
      abajoBot= false;
    }
    if (keyCode== LEFT) {
      izquierdaBot= false;
    }
    if (keyCode== RIGHT) {
      derechaBot= false;
    }
  }
}


