
float px, py, prx, pry, pyr2, vx, vy;
int ampler = 20, altr = 45;
int diametre = 20;
PFont myFont;
int j1, j2;
float mod, var, pyfin, pxfin;
float vxfalsa, vyfalsa;

void setup()
{
  myFont = createFont("verdana", diametre);
  textFont(myFont);
  //orientation(LANDSCAPE);
  //size(screenWidth, screenHeight);
  size(600, 400); 
  fill(255);
  noStroke();
  background(0, 255, 50);
  
  //inicialitzar posicions
  px = width/2;
  py = height/2;
  prx = 1;
  pry = height/2;
  pyr2 = height/2 - altr/2;
  
  //inicialitzar velocitats
  vx = -2;
  vy = 0;
  var = 2;
}

void draw()
{
  background(0, 255, 100);
  stroke(255);
  strokeWeight(10);
  noFill();
  line(width/2, 0, width/2, height);
  rect(0, 0, width-1, height-1);
  stroke(0);
  fill(255);
  marcador(j1, j2);
  
  //rebot en la paleta del jugador
  if(px - diametre/2 < ampler + 4){
    
    mod = sqrt((vx*vx) + (vy*vy));
        
    if(py >= pmouseY && py < pmouseY + 5){
      vy = -(1 + cos(0.35)*mod);
      vx = 1 + sin(0.35)*mod;
    }
    if(py >= pmouseY + 5 && py < pmouseY + 10){
      vy = -(1 + cos(0.70)*mod);
      vx = 1 + sin(0.70)*mod;
    }
    if(py >= pmouseY + 10 && py < pmouseY + 15){
      vy = -(1 + cos(1.05)*mod);
      vx = 1 + sin(1.05)*mod;
    }
    if(py >= pmouseY + 15 && py < pmouseY + 20){
      vy = -(1 + cos(1.39)*mod);
      vx = 1 + sin(1.39)*mod;
    }
    if(py >= pmouseY + 20 && py < pmouseY + 25){
      vy = 0;
      vx *= -1.1;
    }
    if(py >= pmouseY + 25 && py < pmouseY + 30){
      vy = 1 + cos(1.39)*mod;
      vx = 1 + sin(1.39)*mod;
    }
    if(py >= pmouseY + 30 && py < pmouseY + 35){
      vy = 1 + cos(1.05)*mod;
      vx = 1 + sin(1.05)*mod;
    }
    if(py >= pmouseY + 35 && py < pmouseY + 40){
      vy = 1 + cos(0.70)*mod;
      vx = 1 + sin(0.70)*mod;
    }
    if(py >= pmouseY + 40 && py < pmouseY + 45){
      vy = 1 + cos(0.35)*mod;
      vx = 1 + sin(0.35)*mod;
    }
    //pyfin = posicioFinal(vx, vy);  
  }
  
  //text(pyfin, 50, 50);
  //rebot en la paleta de la consola
  if(px + diametre/2 > width - ampler-2){
    
    mod = sqrt((vx*vx) + (vy*vy));
    
    if(py >= pyr2 && py < pyr2 + 5){
      vy = -(1 + cos(0.35)*mod);
      vx = -(1 + sin(0.35)*mod);
    }
    if(py >= pyr2 + 5 && py < pyr2 + 10){
      vy = -(1 + cos(0.70)*mod);
      vx = -(1 + sin(0.70)*mod);
    }
    if(py >= pyr2 + 10 && py < pyr2 + 15){
      vy = -(1 + cos(1.05)*mod);
      vx = -(1 + sin(1.05)*mod);
    }
    if(py >= pyr2 + 15 && py < pyr2 + 20){
      vy = -(1 + cos(1.39)*mod);
      vx = -(1 + sin(1.39)*mod);
    }
    if(py >= pyr2 + 20 && py < pyr2 + 25){
      vy = 0;
      vx *= -1.1;
    }
    if(py >= pyr2 + 25 && py < pyr2 + 30){
      vy = 1 + cos(1.39)*mod;
      vx = -(1 + sin(1.39)*mod);
    }
    if(py >= pyr2 + 30 && py < pyr2 + 35){
      vy = 1 + cos(1.05)*mod;
      vx = -(1 + sin(1.05)*mod);
    }
    if(py >= pyr2 + 35 && py < pyr2 + 40){
      vy = 1 + cos(0.70)*mod;
      vx = -(1 + sin(0.70)*mod);
    }
    if(py >= pyr2 + 40 && py < pyr2 + 45){
      vy = 1 + cos(0.35)*mod;
      vx = -(1 + sin(0.35)*mod);
    }
  }
  
  if(px + diametre/2 > width){
    j1++;
    if(j1 == 10){
      marcador(j1, j2);
      textAlign(CENTER);
      text("FIN DEL JUEGO\nGANA EL JUGADOR 1\n" +
      "PRESIONA R PARA REINICIAR", width/2, height/2);
      noLoop();
    } else {
      marcador(j1, j2);
      noLoop();
      reset();
    }
  }
  
  if(px - diametre/2 < 0){
    j2++;
    if(j2 == 10){
      marcador(j1, j2);
      textAlign(CENTER);
      text("FIN DEL JUEGO\nGANA EL JUGADOR 2\n" +
      "PRESIONA R PARA REINICIAR", width/2, height/2);
      noLoop();
    } else {
      marcador(j1, j2);
      noLoop();
      reset();
    }
  }
  //rebot de dalt
  if (py + diametre/2 > height - 1){
    py = height - diametre/2;
    vy *= -1.0;
  }
  //rebot de baix
  if (py - diametre/2 < 0){
    py = diametre/2;
    vy *= -1.0;
  }
  
  //moviment de la paleta amb IA
  /**var = sqrt(vx*vx + vy*vy);-> aço ho vaig provar per donarli a la paleta amb 
  IA la velocitat que porta la pilota en cada instant, per a que arribara millor a la pilota.
  Pero em va donar problemes i ho vaig llevar*/
  
    /*if(px < width/5){
      if(pyr2 + altr > height)
        var *= -1.0;
      else if(pyr2 < 0)
        var *= -1.0;
    } else if(px > width/5){*/
      //var = vy;
      //var = sqrt(vx*vx + vy*vy);
      if(var > 0 && pyr2 + altr/2 > py)
        var *= -1.0;
      else if(var < 0 && pyr2 + altr/2 < py)
        var *= -1.0;
      if(pyr2 + altr > height){
        var *= -1.0;
        pyr2 = height - altr - 3;
      }
      else if(pyr2 < 0){
        var *= -1.0;
        pyr2 = 3;
      }
    //}
    
  //actualitzar posicions
  pyr2 += var;  
  px += vx;
  py += vy;
  
  //dibuixar pilota i raquetes
  strokeWeight(1);
  ellipse(px, py, diametre, diametre);
  raquetes();
}

void raquetes(){
  strokeWeight(3);
  rect(prx, mouseY, ampler, altr);
  rect(width-ampler-2, pyr2, ampler, altr);
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    reiniciar();
  } /*else if(key == 'p' || key == 'P'){
    pausa();
  }*/
}

void reset(){
  px = width/2;
  py = height/2;
  pyr2 = height/2 - altr/2;
  vx = -2;
  vy = 0;
  var = 2;
  loop();
}

void marcador(int j1, int j2){
  text(j1, width/4, height/2);
  text(j2, width*3/4, height/2);
}

void reiniciar(){
  px = width/2;
  py = height/2;
  pyr2 = height/2 - altr/2;
  vx = -2;
  vy = 0;
  var = 2;
  loop();
  j1 = 0;
  j2 = 0;
}

/** Este mètode es un intent fallit de calcular la posició Y final de la pilota
per a millorar la intel·ligència artificial.*/

float posicioFinal(float vxfalsa, float vyfalsa){
  float aux = vyfalsa;
  pxfin = 0;
  while(pxfin < width){
      if (pyfin + diametre/2 > height - 1){
        aux *= -1.0;
      }
      if (pyfin - diametre/2 < 0){
        aux *= -1.0;
      }
      pyfin += aux;
      pxfin += vxfalsa;
  }
  return pyfin;
  
}

