
/* @pjs preload="Pantalla_Comedor.jpg, Pantalla_Crèdits(2).jpg, Pantalla_Habitacion.jpg, Pantalla_Instruccions.jpg, Pantalla_Jardí.jpg, Pantalla_Sotano.jpg, TDL.png, Tetsu_Back_Little.png, Tetsu_Back_Move.png, Tetsu_Back_Move2.png, Tetsu_Front.png, Tetsu_Front_Move.png, Tetsu_Front_Move2.png, Tetsu_Side.png, Tetsu_Side2.png, Tetsu_Side2_Move.png, Tetsu_Side2_Move2.png, Tetsu_Side_Move.png, Tetsu_Side_Move2.png, Tetsuo_Intents.jpg, a_circulo.jpg, a_cuadrado.jpg, a_pent.jpg, a_trapecio.jpg, button next.jpg, button retry.jpg, clock_normal.jpg, clock_pista.jpg, crèdits.png, historia.jpg, jugar1.jpg, jugar2.jpg, jugar3.jpg, jugar4.jpg, maleta.png, minigame_template1.jpg, obj1.jpg, obj2.jpg, obj3.jpg, obj4.jpg, object1.png, object2.png, object3.png, object4.png, p_circulo.jpg"; 
 */

Tetsuo prota;
Players npc_1, npc_2, npc_3, npc_4;
int pantalla = 1;
Minijoc1 joc1;
Minijoc2 joc2;
Minijoc3 joc3;
Minijoc4 joc4;

//Booleans d'encert dels minijocs
boolean victory1 = false;
boolean victory2 = false;
boolean victory3 = false;
boolean victory4 = false;

//
int creditPuja = 660;
boolean history_read = false;
boolean subter = false;
boolean end = false;

//Import de les diferents classes per cada minijoc
Temps cronometre;
Solucion pentC, cercA, trapA, cuadA;
Resposta hexagonR, rectangleR, triangleR, pentagonR, cercleR;
Input entrada;
Temps2 cronometre2;
Input2 entrada2;
//Botons de reinici i continuació del joc
Button inici, option, credit, tornar, fora_hist, sortir, ajuda, next, reinici, sub_mes, finalB;
// Futura variable pel canvi de pantalles
//Imatges varies
PImage menu, game, intent, a_cerc, a_cuad, a_pent, a_trap, hab, men, jar, maleta, clock, clock_pista, options, credits, history, credits_text, jugar1, jugar2, jugar3, jugar4, obj1, obj2, obj3, obj4, sub, contra, contra2, fin;
//Compte enrera per a resoldre el problema
//Vides restants de Tetsuo
int intents = 3;
//Posició de la primera vida de Tetsuo
int x = 12;
int y = 618;

//npcs
boolean npc1 = false;
boolean npc2 = false;
boolean npc3 = false;
boolean npc4 = false;

//varaiblesMinijoc3
float bGran = random(12,30);
float bPetita = random(7,10);
float altura = random(4,7);
int bG = int(bGran);
int bP = int(bPetita);
int h = int(altura);
float resposta = ((bG+bP)*h)/2;
int res = int(resposta);

//variablesMinijoc4
double resp = 3.14;
double per = 19.73;

void setup(){
  size(600,680);
  menu = loadImage("TDL.png");
  hab = loadImage("Pantalla_Habitacion.jpg");
  men = loadImage("Pantalla_Comedor.jpg");
  jar = loadImage("Pantalla_Jardí.jpg");
  sub = loadImage("Pantalla_Sotano.jpg");
  game = loadImage("minigame_template1.jpg");
  intent = loadImage("Tetsuo_Intents.jpg");  
  a_cerc = loadImage("a_circulo.jpg");
  a_cuad = loadImage("a_cuadrado.jpg");
  a_pent = loadImage("a_pent.jpg");
  a_trap = loadImage("a_trapecio.jpg");
  maleta = loadImage("maleta.png");
  clock = loadImage("clock_normal.jpg");
  clock_pista = loadImage("clock_pista.jpg");
  options = loadImage("Pantalla_Instruccions.jpg");
  credits = loadImage("Pantalla_Crèdits(2).jpg");
  history = loadImage("historia.jpg");
  credits_text = loadImage("crèdits.png");
  jugar1 = loadImage("jugar1.jpg");
  jugar2 = loadImage("jugar2.jpg");
  jugar3 = loadImage("jugar3.jpg");
  jugar4 = loadImage("jugar4.jpg");
  obj1 = loadImage("object1.png");
  obj2 = loadImage("object2.png");
  obj3 = loadImage("object3.png");
  obj4 = loadImage("object4.png");
  contra = loadImage("sub_message.jpg");
  contra2 = loadImage("sub_message2.jpg");
  fin = loadImage("the_end.jpg");
  prota = new Tetsuo();
  joc1 = new Minijoc1();
  joc2 = new Minijoc2();
  joc3 = new Minijoc3();  
  joc4 = new Minijoc4();
  reinici = new Button(250,250,100,100,6);
  next = new Button(250,250,100,100,2);
  inici = new Button(196, 217, 212, 72, 2);
  option = new Button(196, 339, 212, 72, 10);
  credit = new Button(196, 457, 212, 72, 11);
  tornar = new Button(518, 596, 82, 72, 1);
  fora_hist = new Button(280, 516, 68, 46, 2);
  sortir = new Button(560, 622, 22, 22, 1);
  ajuda = new Button(504, 616, 24, 32, 2);
  sub_mes = new Button(280,516,68,46,5);
  finalB = new Button(280,516,68,46,11);
  npc_1 = new Players(118,24);
  npc_2 = new Players(30,220);
  npc_3 = new Players(380,95);
  npc_4 = new Players(392, 244);
//Friend 2 (habitación) = 118 > xPos < 170 | 24 > yPos < 92
//Mother (comedor) = 392 > xPos < 446 | 244 > yPos < 314
//Friend 1 (jardín, pelo gris) = 30 > xPos < 78 | 220 > yPos < 288
//Friend 3 (jardín, pelo rojo) = 380 > xPos < 436 | 94 > yPos < 162
}


void draw(){
  println(mouseX+","+mouseY);
  println(victory1+","+victory2+","+victory3+","+victory4);
    if(prota.xPos > 410 && prota.yPos > 200 && pantalla == 2 && npc1 == true && victory1 == false && victory2 == false && victory3 == false && victory4 == false){
      pantalla = 6;
    }
    if(prota.xPos > 410 && prota.yPos > 200 && pantalla == 2 && npc2 == true && victory1 == true && victory2 == false && victory3 == false && victory4 == false){
      pantalla = 7;
    }
    if(prota.xPos > 410 && prota.yPos > 200 && pantalla == 2 && npc3 == true && victory1 == true && victory2 == true && victory3 == false && victory4 == false){
      pantalla = 8;
    }
    if(prota.xPos > 410 && prota.yPos > 200 && pantalla == 2 && npc4 == true && victory1 == true && victory2 == true && victory3 == true && victory4 == false){
      pantalla = 9;
    }
  
  switch (pantalla) {
    case 1: background(menu);break;
    case 2: background(hab);
            prota.dibuixa();
            prota.moure();
            npc_1.acabat1();
            npc_1.start1();
            if (victory1 == true) {
              image(obj1,144,615);
            }
            if (victory2 == true) {
              image(obj2,228,615);
            }
            if (victory3 == true) {
              image(obj3,308,620);
            }
            if (victory4 == true) {
              image(obj4,406,615);
            }
            if (history_read == false) {
              image(history,0,0);
            }
            break;
    case 3: background(men);
            prota.dibuixa();
            prota.moure();
            npc_4.start4();
            npc_4.acabat4();
            npc_4.interactua4();
            if (victory1 == true) {
              image(obj1,144,615);
            }
            if (victory2 == true) {
              image(obj2,228,615);
            }
            if (victory3 == true) {
              image(obj3,308,620);
            }
            if (victory4 == true) {
              image(obj4,406,615);
            }
            break;
    case 4: background(jar);
            prota.dibuixa();
            prota.moure();
            npc_2.start2();
            npc_2.acabat2();
            npc_2.interactua2();
            npc_3.start3();
            npc_3.acabat3();
            npc_3.interactua3();
            if (victory1 == true) {
              image(obj1,144,615);
            }
            if (victory2 == true) {
              image(obj2,228,615);
            }
            if (victory3 == true) {
              image(obj3,308,620);
            }
            if (victory4 == true) {
              image(obj4,406,615);
              if (subter == true) {
                image(contra2,0,0);
                image(obj1,89,302);
                image(obj2,206,301);
                image(obj3,315,301);
                image(obj4,451,302);
              }
            }
            else {
              if (subter == true) {
                image(contra,0,0);
                if (victory1 == true) {
                  image(obj1,89,302);
                }
                if (victory2 == true) {
                  image(obj2,206,301);
                }
                if (victory3 == true) {
                  image(obj3,315,301);
                }
              }
            }
            break;
    case 5: background(sub);
            prota.dibuixa();
            prota.moure();
            if (end == true) {
              image(fin,0,0);
            }
            break;
    case 6: background(game);
            joc1.dibuixa1();
            if (victory1 == true) {
              image(obj1,144,615);
            }
            break;
    case 7: background(game);
            joc2.dibuixa2();
            if (victory1 == true) {
              image(obj1,144,615);
            }
            if (victory2 == true) {
              image(obj2,228,615);
            }
            break;
    case 8: background(game);
            joc3.dibuixa3();
            if (victory1 == true) {
              image(obj1,144,615);
            }
            if (victory2 == true) {
              image(obj2,228,615);
            }
            if (victory3 == true) {
              image(obj3,308,620);
            }
            break;
    case 9: background(game);
            joc4.dibuixa4();
            if (victory1 == true) {
              image(obj1,144,615);
            }
            if (victory2 == true) {
              image(obj2,228,615);
            }
            if (victory3 == true) {
              image(obj3,308,620);
            }
            if (victory4 == true) {
              image(obj4,406,615);
            }
            break;
    case 10: background(options);
             break;
    case 11: background(credits);
             image(credits_text,150,creditPuja);
             creditPuja--;
             break;
  }
}



void keyReleased(){
  prota.moviment = false;
  if(keyCode == UP){
    prota.orientacio = 1;
  }
  if(keyCode == LEFT){
    prota.orientacio = 4;
  }
  if(keyCode == RIGHT){
    prota.orientacio = 2;
  }
  if(keyCode == DOWN){
    prota.orientacio = 3;
  }
  if (keyCode == ENTER || keyCode == RETURN) {
    text("OK", 20,20);
    if(pantalla == 8){
      entrada.solucio();
    }
    else if(pantalla == 9){
      entrada2.solucio();
    }
  }
  else if (keyCode == BACKSPACE || keyCode == DELETE){
    if(pantalla == 8){
    entrada.borrar();
  }else if(pantalla == 9){
    entrada2.borrar();
  }
  }else if (key != CODED){
    if(pantalla == 8){
      if(entrada.texte.length() < entrada.limit){
        entrada.afegeix(key);
      }
    }
  }
  else if(pantalla == 9){
    if(entrada2.texte.length() < entrada2.limit){
        entrada2.afegeix(key);
    }
  }
  if (key == 'a') {
    victory4 = true;
  }
}


void mousePressed(){
  switch (pantalla){
    case 1: inici.screenChange(); option.screenChange(); credit.screenChange(); break;
    case 2: fora_hist.desplegable(); sortir.cleaner(); break;
    case 3: sortir.cleaner(); break;
    case 4: sortir.cleaner(); sub_mes.desplegable(); break;
    case 5: sortir.cleaner(); finalB.desplegable(); break;
    case 6: joc1.mouse1(); sortir.cleaner(); break;
    case 7: joc2.mouse2(); sortir.cleaner(); break;
    case 8: joc3.mouse3(); sortir.cleaner(); break;
    case 9: joc4.mouse4(); sortir.cleaner(); break;
    case 10: tornar.screenChange(); break;
    case 11: tornar.screenChange(); break;
  }
}

class Players{
  
    int xPos;
    int yPos;
    int llarg;
    int ample;
    String complert, evasiu;    
    int textPosX;
    int textPosY;
  
  Players(int x, int y){
    xPos = x;
    yPos = y;
    llarg = 60;
    ample = 50;
    complert = "Ja no tinc res més a dir, bona sort!";
    evasiu = "Crec que no sóc la persona amb la que hauries de parlar";
  }
    
    void interactua2(){
      if(prota.xPos < (xPos + 2*ample) && prota.xPos > (xPos - ample) && prota.yPos < (yPos + 1.5*llarg) && prota.yPos > (yPos - llarg) && victory1 == false && victory2 == false && pantalla == 4) {
        stroke(255);
        strokeWeight(2);
        fill(0,0,100);        
        rect(15,185,385,25,5);
        fill(255);
        textSize(15);
        text(evasiu,20,205);
      }
    }
    
    void interactua3(){
      if((prota.xPos < (xPos + (2*ample))) && (prota.xPos > (xPos - ample)) && (prota.yPos < (yPos + (1.5*llarg))) && (prota.yPos > (yPos - llarg)) && victory2 == false && victory3 == false && pantalla == 4){
        stroke(255);
        strokeWeight(2);
        fill(0,0,100);        
        rect(185,40,385,25,5);
        fill(255);
        textSize(15);
        text(evasiu,190,60);
      }
    }
    void interactua4(){
      if((prota.xPos < (xPos + (2*ample))) && (prota.xPos > (xPos - ample)) && (prota.yPos < (yPos + (1.5*llarg))) && (prota.yPos > (yPos - llarg)) && victory3 == false && victory4 == false && pantalla == 3){
        stroke(255);
        strokeWeight(2);
        fill(0,0,100);        
        rect(195,180,385,25,5);
        fill(255);
        textSize(15);
        text(evasiu,205,200);
      }
    }
    
    void start1(){
      if((prota.xPos < (xPos + (2*ample))) && (prota.xPos > (xPos - ample)) && (prota.yPos < (yPos + (1.5*llarg))) && (prota.yPos > (yPos - llarg)) && victory1 == false && pantalla == 2){
        image(jugar1,0,0);
        npc1 = true;
      }
    }
    
    void start2(){
      if((prota.xPos < (xPos + (2*ample))) && (prota.xPos > (xPos - ample)) && (prota.yPos < (yPos + (1.5*llarg))) && (prota.yPos > (yPos - llarg)) && (victory2 == false && victory1 == true) && pantalla == 4){
        image(jugar2,0,0);
        npc2 = true;
      }
    }
    
    void start3(){
      if((prota.xPos < (xPos + (2*ample))) && (prota.xPos > (xPos - ample)) && (prota.yPos < (yPos + (1.5*llarg))) && (prota.yPos > (yPos - llarg)) && (victory3 == false && victory2 == true) && pantalla == 4){
        image(jugar3,0,0);
        npc3 = true;
      }
    }
    
    void start4(){
      if((prota.xPos < (xPos + (2*ample))) && (prota.xPos > (xPos - ample)) && (prota.yPos < (yPos + (1.5*llarg))) && (prota.yPos > (yPos - llarg)) && (victory4 == false && victory3 == true) && pantalla == 3){
        image(jugar4,0,0);
        npc4 = true;
      }
    }
    
    void acabat1(){
      if((prota.xPos < (xPos + (2*ample))) && (prota.xPos > (xPos - ample)) && (prota.yPos < (yPos + (1.5*llarg))) && (prota.yPos > (yPos - llarg)) && victory1 == true && pantalla == 2){
        stroke(255);
        strokeWeight(2);
        fill(0,0,100);        
        rect(185,20,245,25,5);
        fill(255);
        textSize(15);
        text(complert,190,40);
      }
    }
    
    void acabat2(){
      if((prota.xPos < (xPos + (2*ample))) && (prota.xPos > (xPos - ample)) && (prota.yPos < (yPos + (1.5*llarg))) && (prota.yPos > (yPos - llarg)) && victory2 == true && pantalla == 4){
        stroke(255);
        strokeWeight(2);
        fill(0,0,100);        
        rect(15,185,245,25,5);
        fill(255);
        textSize(15);
        text(complert,20,205);
      }
    }
    
    void acabat3(){
      if((prota.xPos < (xPos + (2*ample))) && (prota.xPos > (xPos - ample)) && (prota.yPos < (yPos + (1.5*llarg))) && (prota.yPos > (yPos - llarg)) && victory3 == true && pantalla == 4){
        stroke(255);
        strokeWeight(2);
        fill(0,0,100);        
        rect(185,20,245,25,5);
        fill(255);
        textSize(15);
        text(complert,190,40);
      }
    }
    
    void acabat4(){
      if((prota.xPos < (xPos + (2*ample))) && (prota.xPos > (xPos - ample)) && (prota.yPos < (yPos + (1.5*llarg))) && (prota.yPos > (yPos - llarg)) && victory4 == true && pantalla == 3){
        stroke(255);
        strokeWeight(2);
        fill(0,0,100);        
        rect(195,180,245,25,5);
        fill(255);
        textSize(15);
        text(complert,190,40);
      }
    }
}
class Button {
  
  int x;
  int y;
  int llarg;
  int alt;
  int pantSeg;
  PImage screenB, retryB;
  
  Button(int xx, int yy, int llargB, int altB, int pSeg) {
    x = xx;
    y = yy;
    llarg = llargB;
    alt = altB;
    pantSeg = pSeg;
    screenB = loadImage("button next.jpg");
    retryB = loadImage("button retry.jpg");
  }
  
  void dibuixaScreenChange() {
    image(screenB, x, y);
  }

  
  void dibuixaRetry() {
    image(retryB, x, y);
  }
  
void screenChange() {
    if ((mouseX >= x && mouseX <= x + llarg) && (mouseY >= y && mouseY <= y + alt) && intents > 0) {
      pantalla = pantSeg;
      creditPuja = 660;
      if(pantalla == 6){        
      victory1 = true;
      }
      if(pantalla == 7){
      victory2 = true;
      }
      if(pantalla == 8){
      victory3 = true;
      }
      if(pantalla == 9){
      victory4 = true;
      } 
    }
  }  
  
  void retry() {
    if ((mouseX >= x && mouseX <= x + llarg) && (mouseY >= y && mouseY <= y + alt)) {
      intents = 3; 
    }
  }
    
  void desplegable() {
    if ((mouseX >= x && mouseX <= x + llarg) && (mouseY >= y && mouseY <= y + alt) && pantalla == 2 && history_read == false) {
      history_read = true;
    }
    if ((mouseX >= x && mouseX <= x + llarg) && (mouseY >= y && mouseY <= y + alt) && pantalla == 4) {
      if (victory4 == true) {
        subter = false;
        pantalla = 5;
      }
      else {
        subter = false;
      }
    }
    if ((mouseX >= x && mouseX <= x + llarg) && (mouseY >= y && mouseY <= y + alt) && pantalla == 5) {
      end = false;
      pantalla = 11;
    }
  }
  
  void cleaner() {
    if ((mouseX >= x && mouseX <= x + llarg) && (mouseY >= y && mouseY <= y + alt)) {
      pantalla = pantSeg;
      victory1 = false;
      victory2 = false;
      victory3 = false;
      victory4 = false;
      intents = 3;
      prota.xPos = 326;
      prota.yPos = 216;
      prota.orientacio = 3;
    }
  }
}
class Resposta {
  
  float xPos;
  float yPos;
  int llarg;
  int alt;
  PFont estil;
  String nom;
  color marge;
  color fons;
  float velocitat;
  int moviment;
  boolean correcte;
  
  Resposta(float x, float y, int longitud, String name, float speed, int move, boolean cert) {
    xPos = x;
    yPos = y;
    llarg = longitud;
    alt = 20;
    estil = createFont("Georgia",14);
    nom = name;
    marge = color(0,163,228);
    fons = color(154,217,234);
    velocitat = speed;
    moviment = move;
    correcte = cert;
  }
  
  void dibuixa() {
    stroke(marge);
    strokeWeight(4);
    fill(fons);
    rect(xPos, yPos, llarg, alt, alt/2);
    fill(#FF4400);
    textFont(estil);
    text(nom, xPos + llarg/8, yPos + (3 * alt/4));
  }
  
  void moure() {
    if (intents > 0 || victory1 == false) {
      if (moviment == 1) {
        if (yPos > 52 && (xPos + llarg) < 548) {
          xPos = xPos + (2 * velocitat);
          yPos = yPos - velocitat;
        }
        else if (yPos <= 52) {
          moviment = 2;
        }
        else if ((xPos + llarg) >= 548) {
          moviment = 4;
        }
      }
      else if (moviment == 2) {
        if ((xPos + llarg) < 548 && (yPos + alt) < 498) {
          xPos = xPos + (2 * velocitat);
          yPos = yPos + velocitat;
        }
        else if ((xPos + llarg) >= 548) {
          moviment = 3;
        }
        else if ((yPos + alt) >= 498) {
          moviment = 1;
        }
      }
      else if (moviment == 3) {
        if ((yPos + alt) < 498 && xPos > 52) {
          xPos = xPos - (2 * velocitat);
          yPos = yPos + velocitat;
        }
        else if ((yPos + alt) >= 498) {
          moviment = 4;
        }
        else if (xPos <= 52) {
          moviment = 2;
        }
      }
      else if (moviment == 4) {
        if (xPos > 52 && yPos > 52) {
          xPos = xPos - (2 * velocitat);
          yPos = yPos - velocitat;
        }
        else if (xPos <= 52) {
          moviment = 1;
        }
        else if (yPos <= 52) {
          moviment = 3;
        }
      }
    }
    if (intents == 0 || victory1 == true) {
      velocitat = 0;
    }
    else{
      velocitat = random(1,2);
    }
  }
  
  void clica() {
    if ((mouseX > xPos && mouseX < (xPos + llarg)) && (mouseY > yPos && mouseY < (yPos + alt)) && correcte) {
      victory1 = true;
      npc1 = false;
      cronometre.parat();
    }
    else if ((mouseX > xPos && mouseX < (xPos + llarg)) && (mouseY > yPos && mouseY < (yPos + alt)) && !correcte) {
      if (intents > 0){
      intents = intents - 1;
      }
      if(intents == 0) {
        cronometre.parat();       
      }
    }
  } 
}
class Solucion {
  PImage formul;
  float xPos;
  float yPos;
  int llarg;
  int alt;
  boolean eureka;
  
   Solucion(PImage eq, float x, float y, int longit, int altura, boolean win) {
    formul = eq;
    xPos = x;
    yPos = y;
    llarg = longit;
    alt = altura;
    eureka = win;
  }
  
  void dibuixaPent() {
    if(cronometre.cd24s() >= 17){
      xPos = 340;
    }
    else if(cronometre.cd24s() < 17 && cronometre.cd24s() > 13){
      yPos = 320;
    }
    else if(cronometre.cd24s() <= 13 && cronometre.cd24s() > 9){
      xPos = 100;
    }
    else if(cronometre.cd24s() <= 9 && cronometre.cd24s() > 6){
      yPos = 145;
    }
    else if(cronometre.cd24s() <= 6){
      xPos = 340;
    }
    image(a_pent,xPos,yPos);
  }
  
  void dibuixaCerc() {
    if(cronometre.cd24s() >= 17){
      yPos = 320;
    }
    else if(cronometre.cd24s() < 17 && cronometre.cd24s() > 13){
      xPos = 100;
    }
    else if(cronometre.cd24s() <= 13 && cronometre.cd24s() > 9){
      yPos = 145;
    }
    else if(cronometre.cd24s() <= 9 && cronometre.cd24s() > 6){
      xPos = 340;
    }
    else if(cronometre.cd24s() <= 6){
      yPos = 320;
    }
    image(a_cerc,xPos,yPos);
  }
  
  void dibuixaTrap() {
    if(cronometre.cd24s() >= 17){
      xPos = 100;
    }
    else if(cronometre.cd24s() < 17 && cronometre.cd24s() > 13){
      yPos = 145;
    }
    else if(cronometre.cd24s() <= 13 && cronometre.cd24s() > 9){
      xPos = 340;
    }
    else if(cronometre.cd24s() <= 9 && cronometre.cd24s() > 6){
      yPos = 320;
    }
    else if(cronometre.cd24s() <= 6){
      xPos = 100;
    }
    image(a_trap,xPos,yPos);
  }
  
  void dibuixaCuad() {
    if(cronometre.cd24s() >= 17){
      yPos = 145;
    }
    else if(cronometre.cd24s() < 17 && cronometre.cd24s() > 13){
      xPos = 340;
    }
    else if(cronometre.cd24s() <= 13 && cronometre.cd24s() > 9){
      yPos = 320;
    }
    else if(cronometre.cd24s() <= 9 && cronometre.cd24s() > 6){
      xPos = 100;
    }
    else if(cronometre.cd24s() <= 6){
      yPos = 145;
    }
    image(a_cuad,xPos,yPos);
  }
  
  void clica() {
    if ((mouseX > xPos && mouseX < (xPos + llarg)) && (mouseY > yPos && mouseY < (yPos + alt)) && eureka == true){
      victory2 = true;
      npc2 = false;
      cronometre.parat();
    }      
    if ((mouseX > xPos && mouseX < (xPos + llarg)) && (mouseY > yPos && mouseY < (yPos + alt)) && !eureka){
      if (intents > 0){
      intents = intents - 1;
      }
      else {
        cronometre.parat();
      }
    }
  }
}
class Input {
  String texte;
  float xPos;
  float yPos;
  int limit;
  PFont fonBoto;
 
  Input (){
    texte = "";
    xPos = 390;
    yPos = 425;
    limit = 8;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);

  }
  
  Input (String r, float x, float y, int l){
    texte = r; 
    xPos = x;
    yPos = y;
    limit = l;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
  }
  
  void dibuixa(){
    stroke (0);
    fill(160,60,153);
    rect(xPos-10,yPos-10,120,60);
    fill(255);
    rect (xPos, yPos, 100, 40);
    fill(#030000);
    text (texte+(frameCount/20 % 2== 0 ? "_" : ""), xPos + 10, yPos + 20);
  }
  void borrar(){ 
      texte = texte.substring(0,max(0,texte.length()-1));
  }
  
  void afegeix(char key){
    texte = texte.concat(new String(key));
  }
  
  int aEnter(){
    return parseInt(texte);
  }
  
  void solucio(){
    if (aEnter() == res){
      victory3 = true;
      npc3 = false;
      cronometre.parat();
      fill(0);
      rect(0,0,20,20);
      text("OK",30,30);
    }
  }
}
class Input2 {
  String texte;
  float xPos;
  float yPos;
  int limit;
  PFont fonBoto;
 
  Input2 (){
    texte = "";
    xPos = 390;
    yPos = 425;
    limit = 8;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);

  }
  
  Input2 (String r, float x, float y, int l){
    texte = r; 
    xPos = x;
    yPos = y;
    limit = l;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
  }
  
  void dibuixa(){
    stroke (0);
    fill(160,60,153);
    rect(xPos-10,yPos-10,120,60);
    fill(255);
    rect (xPos, yPos, 100, 40);
    fill(#030000);
    text (texte+(frameCount/20 % 2== 0 ? "_" : ""), xPos + 10, yPos + 20);
  }
  void borrar(){ 
      texte = texte.substring(0,max(0,texte.length()-1));
  }
  
  void afegeix(char key){
    texte = texte.concat (new String(key));
  }
  
  int aEnter(){
    return parseInt(texte);
  }  
  
  void solucio(){
    if (texte == resp){
      victory4 = true;
      npc4 = false;
      cronometre.parat();
      fill(0);
      rect(0,0,20,20);
      text("OK",30,30);
    }
    else if (texte != resp){
      intents = intents - 1;
    }
  }
}
class Minijoc2{
  
  Minijoc2(){
  cronometre = new Temps();
  pentC = new Solucion(a_pent, 100, 145, 140, 70, true);
  cercA = new Solucion(a_cerc, 340, 145, 140, 70, false);
  trapA = new Solucion(a_trap, 100, 320, 140, 70, false);
  cuadA = new Solucion(a_cuad, 340, 320, 140, 70, false);
  }
  
  void dibuixa2(){
  fill(154,217,234);
  strokeWeight(3);
  stroke(0,163,228);
  rect(80,110,200,150);
  rect(80,295,200,150);
  rect(315,110,200,150);
  rect(315,295,200,150);
  cronometre.timer();
  pentC.dibuixaPent();
  cercA.dibuixaCerc();
  trapA.dibuixaTrap();
  cuadA.dibuixaCuad();
  if(victory2 == true){
    strokeWeight(2);
    stroke(100,100,100);
    fill(200,200,200);
    rect(52,52,496,446);
    fill(0);
    textSize(32);
    text("Resposta correcta!",180,200);
    next.dibuixaScreenChange();
  }
  if(intents == 0){
    strokeWeight(2);
    stroke(100);
    fill(200);
    rect(52,52,496,446);
    fill(0);
    textSize(32);
    text("GAME OVER",212,200);
    reinici.dibuixaRetry();
  }
  for (int i = 0; i < intents; i++) {
    image(intent,x,y);
    x = x + 35;
  }
  x = 12;
}

  void mouse2(){
    pentC.clica();
    cercA.clica();
    trapA.clica();
    cuadA.clica();
    reinici.retry();
    next.screenChange();
  }

}
class Minijoc3{
  
  Minijoc3(){
    cronometre = new Temps();
    entrada = new Input();
  }
  
  void dibuixa3(){    
    image(maleta,100,85);
    fill(255);
    textSize(24);
    text("H = "+h,60,205);
    text("Base petita = "+bP,205,110);
    text("Base gran = "+bG,205,365);    
    entrada.dibuixa();
    cronometre.timer();
    if(victory3 == true){
    strokeWeight(2);
    stroke(100,100,100);
    fill(200,200,200);
    rect(52,52,496,446);
    fill(0);
    textSize(32);
    text("Resposta correcta!",180,200);
    next.dibuixaScreenChange();
  }
  if(intents == 0){
    strokeWeight(2);
    stroke(100);
    fill(200);
    rect(52,52,496,446);
    fill(0);
    textSize(32);
    text("GAME OVER",212,200);
    reinici.dibuixaRetry();
  }
  for (int i = 0; i < intents; i++) {
    image(intent,x,y);
    x = x + 35;
  }
  x = 12;
}

void mouse3() {
  next.screenChange();
  reinici.retry();
}
}
class Minijoc4{
  
  Minijoc4(){
    cronometre2 = new Temps2();
    entrada2 = new Input2();
  }
  
  void dibuixa4(){
    if(cronometre2.cd24s() >= 30){
  image(clock,150,85);
  }
  if(cronometre2.cd24s() < 30){
  image(clock_pista,150,85);
  }  
  entrada2.dibuixa();
  cronometre2.timer();
  fill(255);
  textSize(24);  
  text("Prímetre de la circumferència: "+per,90,420);
  text("Arrodoneix fins a les centèsimes",90,480);
  fill(0);
  text("Radi = ???",290,205);
  if (victory4 == true) {
    strokeWeight(2);
    stroke(100);
    fill(200);
    rect(52,52,496,446);
    fill(0);
    textSize(32);
    text("Resposta correcta!",180,200);    
    next.dibuixaScreenChange();
  }
  if (intents == 0 || cronometre2.cd24s() == 0) {
    strokeWeight(2);
    stroke(100);
    fill(200);
    rect(52,52,496,446);
    fill(0);
    textSize(32);
    text("GAME OVER",212,200);
    cronometre.parat();
    reinici.dibuixaRetry();
  }
  for (int i = 0; i < intents; i++) {
    image(intent,x,y);
    x = x + 35;
  }
  x = 12;
}

void mouse4() {
  next.screenChange();
  reinici.retry();
}
}
class Minijoc1{

Minijoc1() {
  cronometre = new Temps();  
  hexagonR = new Resposta(75,110,70,"Hexàgon",random(1,2),1,false);
  rectangleR = new Resposta(280,65,75,"Rectangle",random(1,2),2,false);
  triangleR = new Resposta(410,340,70,"Triangle",random(1,2),3,true);
  pentagonR = new Resposta(220,420,70,"Pentàgon",random(1,2),4,false);
  cercleR = new Resposta(135,170,60,"Cercle",random(1,2),1,false);  
}

void dibuixa1() {
  cronometre.timer();
  hexagonR.dibuixa();
  rectangleR.dibuixa();
  triangleR.dibuixa();
  pentagonR.dibuixa();
  cercleR.dibuixa();
  hexagonR.moure();  
  rectangleR.moure();
  triangleR.moure();
  pentagonR.moure();
  cercleR.moure();
  if (victory1 == true) {
    strokeWeight(2);
    stroke(100);
    fill(200);
    rect(52,52,496,446);
    fill(0);
    textSize(32);
    text("Resposta correcta!",180,200);
    next.dibuixaScreenChange();   
  }
  if (intents == 0) {
    strokeWeight(2);
    stroke(100);
    fill(200);
    rect(52,52,496,446);
    fill(0);
    textSize(32);
    text("GAME OVER",212,200);
    reinici.dibuixaRetry();
  }
}

void mouse1() {
  hexagonR.clica();
  rectangleR.clica();
  triangleR.clica();
  pentagonR.clica();
  cercleR.clica();
  next.screenChange();
  reinici.retry();
}
}
class Tetsuo{
  int xPos;
  int yPos;
  int llarg;
  int alt;
  int orientacio;
  boolean moviment;
  int tipusDesp;
  PImage tetsuU, tetsuR, tetsuL, tetsuD, tetsuU1, tetsuU2, tetsuR1, tetsuR2, tetsuL1, tetsuL2, tetsuD1, tetsuD2;
  
  Tetsuo(){
    tetsuU = loadImage("Tetsu_Back_Little.png");
    tetsuR = loadImage("Tetsu_Side2.png");
    tetsuL = loadImage("Tetsu_Side.png");
    tetsuD = loadImage("Tetsu_Front.png");
    tetsuD1 = loadImage("Tetsu_Front_Move.png");
    tetsuD2 = loadImage("Tetsu_Front_Move2.png");
    tetsuU1 = loadImage("Tetsu_Back_Move.png");
    tetsuU2 = loadImage("Tetsu_Back_Move2.png");
    tetsuL1 = loadImage("Tetsu_Side_Move.png");
    tetsuL2 = loadImage("Tetsu_Side_Move2.png");
    tetsuR1 = loadImage("Tetsu_Side2_Move.png");
    tetsuR2 = loadImage("Tetsu_Side2_Move2.png");
    xPos = 326;
    yPos = 216;
    llarg = 52;
    alt = 64;
    orientacio = 3;
    moviment = false;
    tipusDesp = 1;
  }
  
  void dibuixa(){
    if(orientacio == 1 && moviment == false){
      image(tetsuU,xPos,yPos);
    }
    else if(orientacio == 2  && moviment == false){
      image(tetsuR,xPos,yPos);
    }
    else if(orientacio == 3  && moviment == false){
      image(tetsuD,xPos,yPos);
    }
    else if(orientacio == 4  && moviment == false){
      image(tetsuL,xPos,yPos);
    }
    if(moviment == true){  
      if(orientacio == 1 && tipusDesp == 1){
        image(tetsuU1,xPos,yPos);
      }else if(orientacio == 1 && tipusDesp == 2){
        image(tetsuU2,xPos,yPos);
      }
      if(orientacio == 2 && tipusDesp == 1){
        image(tetsuR1,xPos,yPos);
      }else if(orientacio == 2 && tipusDesp == 2){
        image(tetsuR2,xPos,yPos);
      }
      if(orientacio == 3 && tipusDesp == 1){
        image(tetsuD1,xPos,yPos);
      }else if(orientacio == 3 && tipusDesp == 2){
        image(tetsuD2,xPos,yPos);
      }
      if(orientacio == 4 && tipusDesp == 1){
        image(tetsuL1,xPos,yPos);
      }else if(orientacio == 4 && tipusDesp == 2){
        image(tetsuL2,xPos,yPos);
      }
    }
  }
  
  //Totes les funcions que fan moure a Tetsuo
  void moure(){
    if(keyPressed){
      //Moviment en direcció vertical i sentit superior
      if(keyCode == UP){
        moviment = true;
        orientacio = 1;
        if(yPos > 0 && orientacio == 1) {
          yPos = yPos - 2;
          if((yPos/10)%2 == 0){
            tipusDesp = 1;
          }
          else if((yPos/10)%2 != 0){
            tipusDesp = 2;
          }
        }
        else if(yPos <= 0 && orientacio == 1){
          yPos = 2;
        }
        //LÍMITS HABITACIÓ
        //Límit de l'escriptori
        if(xPos < 90 && yPos < (310 - alt) && yPos > (176 - alt) && orientacio == 1 && pantalla == 2) {
          yPos = 312 - alt;
        }
        //Límit de les escales
        if (xPos < 268 && yPos < (514 - alt) && yPos > (502 - alt) && orientacio == 1 && pantalla == 2) {
          yPos = 516 - alt;
        }
        //Límit del NPC (friend 2)
        if (xPos < 168 && xPos > (120 - llarg) && yPos < (94 - alt) && orientacio == 1 && pantalla == 2) {
          yPos = 96 - alt;
        }
        //LÍMITS MENJADOR
        //Límit taula
        if (xPos > (240 - llarg) && xPos < 392 && yPos < (374 - alt) && yPos > (222 - alt) && orientacio == 1 && pantalla == 3) {
          yPos = 376 - alt;
        }
        //Límit televisor
        if (xPos < 100 && yPos < (362 - alt) && yPos > (234 - alt) && orientacio == 1 && pantalla == 3) {
          yPos = 364 - alt;
        }
        //Límit de les escales
        if (xPos > (366 - llarg) && yPos < (512 - alt) && yPos > (500 - alt) && orientacio == 1 && pantalla == 3) {
          yPos = 514 - alt;
        }
        //Canvi a jardí
        if (xPos > 240 && xPos < 436 && yPos < (70 - alt) && orientacio == 1 && pantalla == 3) {
          pantalla = 4;
          yPos = 540 - alt;
        }
        //Límit del NPC (mother)
        if (xPos > 390 && xPos < 446 && yPos < (314 - alt) && yPos > (244 - alt) && orientacio == 1 && pantalla == 3) {
          yPos = 316 - alt;
        }
        //LÍMITS JARDÍ
        //Límit caseta
        if (xPos < 140 && yPos < (424 - alt) && yPos > (300 - alt) && orientacio == 1 && pantalla == 4) {
          yPos = 426 - alt;
        }
        //Límit llac
        if (xPos < 330 && yPos < (264 - alt) && orientacio == 1 && pantalla == 4) {
          yPos = 266 - alt;
        }
        //Límit arbre
        if (xPos < 530 && xPos > 442 && yPos < (166 - alt) && orientacio == 1 && pantalla == 4) {
          yPos = 168 - alt;
        }
        //Límit del NPC (friend 3)
        if (xPos > (384 - llarg) && xPos < 434 && yPos < (162 - alt) && yPos > (96 - alt) && orientacio == 1 && pantalla == 4) {
          yPos = 164 - alt;
        }
        //LÍMITS SOTERRANI
        //Fi del joc
        if (yPos < 200 && orientacio == 1 && pantalla == 5) {
          end = true;
        }
      }
      //Moviment en direcció horitzontal i sentit esquerre
      if(keyCode == LEFT){
        moviment = true;
        orientacio = 4;
        if(xPos > 0 && orientacio == 4){
          xPos = xPos - 2;
          if((xPos/10)%2 == 0){
            tipusDesp = 1;
          }
          else if((xPos/10)%2 != 0){
            tipusDesp = 2;
          }
        }
        else if(xPos <= 0 && orientacio == 4){
          xPos = 2;
        }
        //LÍMITS HABITACIÓ
        //Límit de l'escriptori
        if(xPos < 90 && yPos < (310 - alt) && yPos > (176 - alt) && orientacio == 4 && pantalla == 2) {
          xPos = 92;
        }
        //Límit de les escales
        if (xPos < 268 && yPos < (514 - alt) && yPos > (502 - alt) && orientacio == 4 && pantalla == 2) {
          xPos = 270;
        }
        //Canvi a menjador
        if (xPos < 50 && yPos > (514 - alt) && orientacio == 4 && pantalla == 2) {
          pantalla = 3;
          xPos = 525 - llarg;
        }
        //Límit del NPC (friend 2)
        if (xPos < 168 && xPos > (120 - llarg) && yPos < (94 - alt) && orientacio == 4 && pantalla == 2) {
          xPos = 170;
        }
        //LÍMITS MENJADOR
        //Límit taula
        if (xPos > (236 - llarg) && xPos < 392 && yPos < (374 - alt) && yPos > (222 - alt) && orientacio == 4 && pantalla == 3) {
          xPos = 394;
        }
        //Límit televisor
        if (xPos < 100 && yPos < (362 - alt) && yPos > (234 - alt) && orientacio == 4 && pantalla == 3) {
          xPos = 102;
        }
        //Límit del NPC (mother)
        if (xPos > 390 && xPos < 446 && yPos < (314 - alt) && yPos > (244 - alt) && orientacio == 4 && pantalla == 3) {
          xPos = 448;
        }
        //LÍMITS JARDÍ
        //Límit caseta
        if (xPos < 140 && yPos < (424 - alt) && yPos > (300 - alt) && orientacio == 4 && pantalla == 4) {
          xPos = 142;
        }
        //Límit llac
        if (xPos < 330 && yPos < (264 - alt) && orientacio == 4 && pantalla == 4) {
          xPos = 332;
        }
        //Límit arbre
        if (xPos < 530 && xPos > 442 && yPos < (166 - alt) && orientacio == 4 && pantalla == 4) {
          xPos = 532;
        }
        //Límit del NPC (friend 1)
        if (xPos < 74 && yPos < (288 - alt) && orientacio == 4 && pantalla == 4) {
          xPos = 76;
        }
        //Canvi a soterrani
        if (xPos < 150 && yPos > (320 - alt) && yPos < (366 - alt) && orientacio == 4 && pantalla == 4) {
          subter = true;
        }
        //LÍMITS SOTERRANI
        //Límit esquerra
        if (xPos < 136 && yPos < (408 - alt) && orientacio == 4 && pantalla == 5) {
          xPos = 138;
        }
      }
      //Moviment en direcció horitzontal i sentit dreta
      if(keyCode == RIGHT){
        moviment = true;
        orientacio = 2;
        if(xPos < (600 - llarg) && orientacio == 2){
          xPos = xPos + 2;
          if((xPos/10)%2 == 0){
            tipusDesp = 1;
          }
          else if((xPos/10)%2 != 0){
            tipusDesp = 2;
          }
        }
        else if(xPos >= 560 && orientacio == 2){
          xPos = 558;
        }
        //LÍMITS HABITACIÓ
        //Límit del NPC (friend 2)
        if (xPos < 168 && xPos > (120 - llarg) && yPos < (94 - alt) && orientacio == 2 && pantalla == 2) {
          xPos = 118 - llarg;
        }
        //LÍMITS MENJADOR
        //Límit taula
        if (xPos > (236 - llarg) && xPos < 392 && yPos < (374 - alt) && yPos > (222 - alt) && orientacio == 2 && pantalla == 3) {
          xPos = 234 - llarg;
        }
        //Canvi a habitació
        if (xPos > (525 - llarg) && yPos > (512 - alt) && orientacio == 2 && pantalla == 3) {
          pantalla = 2;
          xPos = 50;
        }
        //Límit de les escales
        if (xPos > (366 - llarg) && yPos < (512 - alt) && yPos > (500 - alt) && orientacio == 2 && pantalla == 3) {
          xPos = 364 - llarg;
        }
        //LÍMITS JARDÍ
        //Límit arbre
        if (xPos < 530 && xPos > (442 - llarg) && yPos < (166 - alt) && orientacio == 2 && pantalla == 4) {
          xPos = 440 - llarg;
        }
        //Límit del NPC (friend 3)
        if (xPos > (384 - llarg) && xPos < 434 && yPos < (162 - alt) && yPos > (96 - alt) && orientacio == 2 && pantalla == 4) {
          xPos = 382 - llarg;
        }
        //LÍMITS SOTERRANI
        //Límit dreta
        if (xPos > (466 - llarg) && yPos < (408 - alt) && orientacio == 2 && pantalla == 5) {
          xPos = 464 - llarg;
        }
      }
      //Moviment en direcció vertical i sentit inferior
      if(keyCode == DOWN){
        moviment = true;
        orientacio = 3;
        if(yPos < 534 && orientacio == 3){
          yPos = yPos + 2;
          if((yPos/10)%2 == 0){
            tipusDesp = 1;
          }
          else if((yPos/10)%2 != 0){
            tipusDesp = 2;
          }
        }
        else if(yPos >= 534 && orientacio == 3){
          yPos = 532;
        }
        //LÍMITS HABITACIÓ
        //Límit de l'escriptori
        if(xPos < 90 && yPos > (176 - alt) && yPos < (310 - alt) && orientacio == 3 && pantalla == 2) {
          yPos = 174 - alt;
        }
        //Límit de les escales
        if (xPos < 268 && yPos < (514 - alt) && yPos > (502 - alt) && orientacio == 3 && pantalla == 2) {
          yPos = 500 - alt;
        }
        //LÍMITS MENJADOR
        //Límit taula
        if (xPos > (236 - llarg) && xPos < 392 && yPos < (374 - alt) && yPos > (222 - alt) && orientacio == 3 && pantalla == 3) {
          yPos = 220 - alt;
        }
        //Límit televisor
        if (xPos < 100 && yPos < (362 - alt) && yPos > (234 - alt) && orientacio == 3 && pantalla == 3) {
          yPos = 232 - alt;
        }
        //Límit de les escales
        if (xPos > (366 - llarg) && yPos < (512 - alt) && yPos > (500 - alt) && orientacio == 3 && pantalla == 3) {
          yPos = 498 - alt;
        }
        //Límit del NPC (mother)
        if (xPos < 446 && xPos > 390 && yPos < (314 - alt) && yPos > (244 - alt) && orientacio == 3 && pantalla == 3) {
          yPos = 242 - alt;
        }
        //LÍMITS JARDÍ
        //Límit caseta
        if (xPos < 140 && yPos < (424 - alt) && yPos > (300 - alt) && orientacio == 3 && pantalla == 4) {
          yPos = 298 - alt;
        }
        //Canvi a menjador
        if (xPos < 416 && xPos > 194 && yPos > (530 - alt) && orientacio == 3 && pantalla == 4) {
          pantalla = 3;
          yPos = 70 - alt;
        }
        //Paret inferior
        if (yPos >= (524 - llarg) && orientacio == 3 && pantalla == 4) {
          yPos = 522 - llarg;
        }
        //Límit del NPC (friend 3)
        if (xPos > (384 - llarg) && xPos < 434 && yPos < (162 - alt) && yPos > (96 - alt) && orientacio == 3 && pantalla == 4) {
          yPos = 94 - alt;
        }
        //LÍMITS SOTERRANI
        //Paret inferior
        if (yPos > (506 - alt) && orientacio == 3 && pantalla == 5) {
          yPos = 504 - alt;
        }
        //Canvi a jardí
        if (xPos > (214 - llarg) && xPos < 388 && yPos > (500 - alt) && orientacio == 3 && pantalla == 5) {
          pantalla = 4;
          orientacio = 2;
          xPos = 150;
          yPos = 360;
        }
      }
    }
  }  
}
class Temps{
  int cdown;
  int origen;
  int parat;
  boolean stop;
  PFont fontClock;
   
  Temps(){
    cdown = millis() + 22000;
    origen = millis();
    fontClock = createFont("Pristina",26);
  }
   
  int origenSec(){
    return (int)(millis()-origen)/1000%60;
  }
   
  int cd24s(){
    int resultat = (int)(cdown-millis())/1000%60;
    if (resultat < 0){
      resultat = 0;
    }
    return resultat;
  }
   
  int cd24m(){
    int resultat = (int)(cdown-millis())/60000;
    if (resultat < 0){
      resultat = 0;
    }
    return resultat;
  }
  
  void parat(){
    stop = true;
    parat = cdown -millis();
  } 
  
  boolean endcd24(){
    return cd24m() == 0 && cd24s() == 0;
  }
  
  void rest(int origenSec){
    cdown =  millis()+origenSec*1000;
  }
  
  void timer(){
    fill(255,0,0);
    textFont(fontClock,34);
    if (stop == false){
      text("Time: "+cd24m() + ":" +cd24s(),420,560);
    }
    else {
      text("Time: 0:"+parat/1000,420,560);
    }
  }
}
class Temps2{
  int cdown;
  int origen;
  int parat;
  boolean stop;
  PFont fontClock;
   
  Temps2(){
    cdown = millis() + 50000;
    origen = millis();
    fontClock = createFont("Pristina",26);
  }
   
  int origenSec(){
    return (int)(millis()-origen)/1000%60;
  }
   
  int cd24s(){
    int resultat = (int)(cdown-millis())/1000%60;
    if (resultat < 0){
      resultat = 0;
    }
    return resultat;
  }
   
  int cd24m(){
    int resultat = (int)(cdown-millis())/60000;
    if (resultat < 0){
      resultat = 0;
    }
    return resultat;
  }
  
  void parat(){
    stop = true;
    parat = cdown -millis();
  } 
  
  boolean endcd24(){
    return cd24m() == 0 && cd24s() == 0;
  }
  
  void rest(int origenSec){
    cdown =  millis()+origenSec*1000;
  }
  
  void timer(){
    fill(255,0,0);
    textFont(fontClock,34);
    if (stop == false){
      text("Time: "+cd24m() + ":" +cd24s(),420,560);
    }
    else {
      text("Time: 0:"+parat/1000,420,560);
    }
  }
}


