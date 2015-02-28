
/* @pjs preload="H-ESP-IZQ.png, M-ESP-IZQ.png, P01.png, P02.jpg, P03.jpg, P04.jpg, P05.jpg, P06.jpg, P07.jpg, P09.jpg, P10.jpg, P12.jpg, P13.jpg, corazonjuego.png"; 
 */


PImage F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F13, P1, P3, P5, vides;
//pantalles i botons
Boto b1a, b1b, b1c, b2a, b2b, b3, b4, b5, b6a, b6b, b7a, b7b, b8a, b8b, b8c;
int pantalla=1; //pantallas
boolean pasa = true; //no pot entrar a una porta fins que no completi la anterior
//posició personatje dins del minijoc
float xPosCara = 400; 
float yPosCara = 580;
int nivel=1; //nivell del joc
//velocitat del joc
int xVel=3;
int yVel=3;
boolean apretar = false; //Boolean per a agafar el personatje en el minijoc
//mida i posicio personatje
int xMidaPersonatje = 114;
int yMidaPersonatje = 341;
int xPosPersonatje = (400-(xMidaPersonatje/2));
int yPosPersonatje = (600-yMidaPersonatje);
//seleccio noi i noia
int personaje = 1;
//perdua de vides de una en una
boolean pasaVida = false;
//posicio numeros del minijoc
int xPosCuartoNumero;
int xPosPrimerNumeroFalso;
int xPosSegundoNumeroFalso;
//posicio de la resposta correcta
int posicionAleatoria = int(random(1,4));
int pasado = 0; 
//boleans para les portes
boolean puerta1 = false;
boolean puerta2 = false;
boolean prueba = false;
boolean prueba2 = false;
boolean apretado = false;
//puntuacio final
float puntuacionFinal = 0;
//fer que la puntuacio final surti
boolean puntuacionFinalBoolean = true;
boolean puntuacionFinalBoolean2 = true;
//numeros minijoc
int primerNumero;
int segundoNumero;
int tercerNumero;
float cuartoNumero=(segundoNumero*tercerNumero)/primerNumero;
float primerNumeroFalso;
float segundoNumeroFalso;

Input entrada; //entrada de text
Monigote[] m = new Monigote[12]; //minijoc
Temps cronometre; //temps minijoc


void setup(){
  //mida pantalla
  size(800,600);
  //cargar imatges 
  F1 = loadImage("P01.png");
  F2 = loadImage("P03.jpg");
  F3 = loadImage("P02.jpg");
  F4 = loadImage("P04.jpg");
  F5 = loadImage("P05.jpg");
  F6 = loadImage("P06.jpg");
  F7 = loadImage("P07.jpg");
  F8 = loadImage("P08.jpg");
  F9 = loadImage("P09.jpg");
  F10 = loadImage("P10.jpg");
  F11 = loadImage("P12.jpg");
  F13 = loadImage("P13.jpg");
  P1 = loadImage("H-ESP-IZQ.png");
  P3 = loadImage("M-ESP-IZQ.png");
  P5 = P1;
  escullpersonatje = loadImage("P05.jpg");
  casaavi = loadImage("P06.jpg");
  entrada = new Input();
  vides= loadImage("corazonjuego.png");
  cronometre = new Temps();
  
  for (int i = 0; i < m.length;i++){
    m[i] = new Monigote(random(18,width-18), random(218,542),nivel*xVel,nivel*yVel,36,color(random(0,255),random(0,255),random(0,255)));
  }
  
  //declarar botons
  b1a = new Boto(200, 230, color(255), 440,70,1,2);
  b1b = new Boto(200, 350, color(255), 440,70,1,6);
  b1c = new Boto(200, 460, color(255), 440,70,1,7);
  b2a = new Boto(650, 520, color(255), 125,50,2,3);
  b2b = new Boto(40, 525, color(255), 80,45,2,1);
  b3a = new Boto(115, 130, color(255), 265,380,3,4);
  b3b = new Boto(420, 130, color(255), 265,380,3,4);
  b4 = new Boto(560, 215, color(255), 225,230,4,5);
  b5 = new Boto(330, 225, color(255), 130,140,5,9);
  b6a = new Boto(650, 520, color(255), 80,45,6,3);
  b6b = new Boto(40, 525, color(255), 80,45,6,1);
  b7a = new Boto(650, 520, color(255), 80,45,7,3);
  b7b = new Boto(40, 525, color(255), 80,45,7,1);
  b8a = new Boto(180, 210, color(255), 70,250,5,8);
  b8c = new Boto(540, 210, color(255), 70,250,5,8);
  
  //switch generador de operacions
  switch(posicionAleatoria){
  case 1: xPosCuartoNumero = 58;
          xPosPrimerNumeroFalso = 325;
          xPosSegundoNumeroFalso = 592;
          break;
  case 2: xPosCuartoNumero = 325;
          xPosPrimerNumeroFalso = 592;
          xPosSegundoNumeroFalso = 58;
          break;
  case 3: xPosCuartoNumero = 592;
          xPosPrimerNumeroFalso = 58;
          xPosSegundoNumeroFalso = 325;
          break;
  }
}

void draw(){
  //switch de pantallas
  switch(pantalla){
    case 1: Portada();break;
    case 2: Historia();break;
    case 3: Personaje();break;
    case 4: Casa();break;
    case 5: Pasillo();break;
    case 6: Instrucciones();break;
    case 7: Credits();break;
    case 8: Joc();break;
    case 9: Final();break;
  }
  
  // personatge sigi noi o noia
  if(personaje==1){
    P5 = P1;
  } else {
    P5 = P3;
  }
  
  //pasar de pantalla
  if(puerta1 == true && pasado == 1){
    F5 = F10;
  }
  
  if(cronometre.Puntuacio() < 0){
  image(F9,0,0);
  }
  
  if(puntuacionFinalBoolean == true && pantalla==9){
    puntuacionFinal = cronometre.Puntuacio();
    puntuacionFinalBoolean = false;
  }
}


void mousePressed(){
  //botons de anada i retorn a les pantallas
  if(pantalla==9){
    apretado=true;
  }
  b1a.apreta();
  b1b.apreta();
  b1c.apreta();
  b2a.apreta();
  b2b.apreta();
  if((pantalla == 3 &&mouseX>115 && mouseX<380 && mouseY>130 && mouseY<510) && entrada.texte.length>0){
    b3a.apreta();
    personaje=1;
  }
  if((pantalla == 3 && mouseX>420 && mouseX<685 && mouseY>130 && mouseY<510) && entrada.texte.length>0){
    b3b.apreta();
    personaje=2;
  }  
  b4.apreta();
  if(puerta1 == true && pasado >= 1){
    b5.apreta();
  }
  b6a.apreta();
  b6b.apreta();
  b7a.apreta();
  b7b.apreta();
  b8a.apreta();
  if(m[0].apretar==true){
  b8b.apreta();
  m[0].apretar=false;
  puerta1 = true;
  }
  if(puerta1 == true) {
  b8c.apreta();
  }

}

void mouseReleased(){   
  pasa = true;
  pasaVida= false;
}

void keyReleased() {
  //texte
  if (keyCode == BACKSPACE || keyCode == DELETE){
    entrada.borrar();
  } else if (key != CODED){
    if(entrada.texte.length() < entrada.limit){
       entrada.afegeix(key);
      }
  }
}
class Boto{
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti;
  int resultat;
  
  Boto(){
    xPos = 2;
    yPos = 15;
    c = color(0);
    widthB = 50;
    heightB = 32;
    pantallaActual = 1;
    pantallaDesti = 2;

  }
   Boto(float x, float y, color col, float w, float h, int Segona, int Tercera){
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = Segona;
    pantallaDesti = Tercera;
  }  
  
  void dibuixa(){
    noStroke();
    noFill();
    rect(xPos, yPos, widthB, heightB, 5);
  }

  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual && pasa == true){
      pasa = false;
      pantalla = pantallaDesti;
    }
  }
}

class Monigote {
  color colores;
  float xPos;
  float yPos;
  float xVel;
  float yVel;
  float mida;
  int img=1;
  PImage div, mas, men, mul;
  
  Monigote(float xP, float yP, float xV, float yV, float m, color c){
    xPos = xP;
    yPos = yP;
    xVel = xV;
    yVel = yV;
    mida = m;
    colores = c;
  }
  
  void dibuixa(){
    background(138,138,138);
    //La pantalla dividida 800 entre 3 es 266
    stroke(0);
    fill(#0900FF);//Fondo cuadrado arriba
    strokeWeight(5);//Borde
    rect(0,0,800,100);//Rectangulo arriba
    image(vides,40,25,60,60);
    line(200,0,200,100);//linea primera rectangulo
      fill(0);
      textSize(30);
      text(cronometre.vidas, 120, 70);
      fill(0);
      textSize(30);
      text(primerNumeroFalso, xPosPrimerNumeroFalso+50, 150);
      fill(0);
      textSize(30);
      text(segundoNumeroFalso, xPosSegundoNumeroFalso+50, 150);    
      fill(0);
      textSize(30);
      text(cuartoNumero, xPosCuartoNumero+50, 150);
      fill(0);
      textSize(30);
      text("Nivell"+" "+nivel, 420, 40);
      
      text(primerNumero,245,40);
      line(235,55,270,55);
      text(segundoNumero,310,40);
      text(tercerNumero,245,90);
      line(302,55,337,55); 
      text("X",307,90);
      text("=",280,65);
      
    line(580,0,580,100);//linea segunda rectangulo
    line(266,100,266,200);//linea primera
    line(534,100,534,200);//linea segunda
    strokeWeight(1);
    noFill();
    //fill(255,255,255);
    //noStroke();
    rect(0,560,800,100);//cuadrado donde empezaremos
    for (int i = 0; i < m.length;i++){
      m[i].dibuixaSignes();
      m[i].mouSignes();
      m[0].colisio();
      m[0].dibuixaCara();
      cronometre.dibuixaComptaEnrere();
      cronometre.dibuixaPuntuacio();
    }
  
  }
  void dibuixaSignes(){
    fill(colores);
    ellipse(xPos, yPos, mida, mida);
  }
  
  void mouSignes(){
    xPos = xPos + xVel;
    yPos = yPos + yVel;
    
    if(xPos>width-mida/2 || xPos+mida/2<mida){
    xVel = xVel * -1;
    }
    
    if(yPos>560-18 || yPos<200+18){
    yVel = yVel * -1;
    }
  }
  
boolean apretar=false;
int colisions=0;

  void colisio(){
    if(mousePressed && mouseX<xPosCara+mida/2 && mouseX>xPosCara-mida/2 && mouseY<yPosCara+mida/2 && mouseY>yPosCara-mida/2){
      apretar=true;
    }
    if (apretar==true){
      xPosCara=mouseX;
      yPosCara=mouseY;
      apretar=true;
    }  
    if (apretar==false){
      xPosCara=400;
      yPosCara=580;
    } 
    for(int i = 0;i<m.length;i++){
      if(dist(m[i].xPos, m[i].yPos, xPosCara, yPosCara) < m[i].mida && apretar==true){
        xPosCara=400;
        yPosCara=580;
        apretar=false;
        colisions++;
      }
    }
  }
    
  void dibuixaCara(){
    ellipse(xPosCara, yPosCara, 36, 36);
    if(mouseY<100){
      yPosCara = 100;
    } else if (mouseY<100 && apretar==false){
      xPosCara = 400;
      yPosCara = 580;
    }
  }
}

//tiempo
class Temps{
 int principi;
 int enrera;
 int vidas=5;
 int restant;
 int puntuacio1;
 int puntuacio2;
  Temps(){
    principi = millis();
    enrera = 484000 + principi;
  }
  
  int segons(){
    return (int)((millis() - principi)/ 1000)%60;
  }
  
  int minuts(){
    return (int)((millis() - principi)/ 60000);
  }
 
  int minutsEnrera(){
      int resultat = (int)((enrera-millis())/ 60000); 
      if (resultat < 0){
        resultat = 0;
      }
      return resultat;
  }
  
  int segonsEnrera(){
    int resultat = (int)((enrera-millis())/ 1000)%60;
    if (resultat < 0){
        resultat = 0;
      }
      return resultat; 
   }
   
  boolean fiEnrera(){
    return minutsEnrera() == 0 && segonsEnrera() == 0;
  }
  
  void reiniciaEnrera(int segons){
    enrera = millis() + segons * 000;
  }
  
  void dibuixaComptaEnrere(){
    fill(0);
    
    textSize(35);
    text(minutsEnrera()+":"+segonsEnrera(), 430, 85);
   
  }
  
  int Pcolisions(){
    return m[0].colisions * 100;
  }
  
  int Ptemps1(){
    return minutsEnrera()*60+segonsEnrera();
  }
  int Ptemps2(){
    return Ptemps1()*5;
  }
  int Pvidas(){
    return vidas * 1000;
  }
 int Puntuacio(){
   return Ptemps2() + Pvidas() - Pcolisions();
 }
  void dibuixaPuntuacio(){
    fill(0);
    textSize(35);
    text(Puntuacio(), 600, 60);
  }
  void restarVidas(){
    vidas--;
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
    xPos = 430;
    yPos = 42;
    limit = 15;
    fonBoto = createFont("Euphemia", 20);
    textFont(fonBoto);
  }
  
  Input (String r, float x, float y, int l){
    texte = r; 
    xPos = x;
    yPos = y;
    limit = l;
    fonBoto = createFont("Euphemia", 12);
    textFont(fonBoto);
  }
  
  void dibuixa(){
    stroke (0);
    fill(255);
    rect (xPos, yPos, 216, 45);
    fill(#030000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), xPos + 10, yPos + 20);
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
}

void Portada(){
  image(F1, 0, 0,800,600);
  b1a.dibuixa();
  b1b.dibuixa();
  b1c.dibuixa();
}
PFont f;
void Historia(){
  image(F2, 0, 0);
  b2a.dibuixa();
  b2b.dibuixa();
  
  //text història
  f = createFont("Comic Sans MS",16,true);
  textFont(f,13);
  fill(#000000);
  text("Estimat net/a,", 215,195);
  text("et deixo aquesta carta per explicar-te com aconseguir...", 215,225);
  text("La Herència:", 215,245);
  text("Hauràs d’anar a casa meva, un cop dins hauràs ", 215,275);
  text("de superar les proves que he fet perquè ningú aliè", 215,295);
  text("a la casa la pugi robar.", 215,315);
  text("Situat al passadís central de casa i ves habitació ", 215,335);
  text("per habitació superant el petit mini joc que e deixat.", 215,355);
  text("Si el aconsegueixes superar et donaré uns dígits ", 215,395);
  text("que al final et serviran per obrir la meva caixa forta ", 215,415);
  text("i emportar-te la recompensa.", 215,435);
  text("Bona sort.", 215,475);
}
void Personaje(){
  image(F3, 0, 0,800,600);
  entrada.dibuixa();//Input


}
void Casa(){
  image(F4, 0, 0);
  b4.dibuixa();
}
void Pasillo(){
  if(pantalla == 5){
    prueba = true;
  }
  
  image(F5, 0, 0);
  image(P5,((width/2)-57),(height-341));
  posicionAleatoria = int(random(1,4));
  switch(posicionAleatoria){
    case 1: xPosCuartoNumero = 58;
            xPosPrimerNumeroFalso = 325;
            xPosSegundoNumeroFalso = 592;
            break;
    case 2: xPosCuartoNumero = 325;
            xPosPrimerNumeroFalso = 592;
            xPosSegundoNumeroFalso = 58;
            break;
    case 3: xPosCuartoNumero = 592;
            xPosPrimerNumeroFalso = 58;
            xPosSegundoNumeroFalso = 325;
            break;
  }
  
  b8b = new Boto(xPosCuartoNumero, 100, color(255), 150,80,8,5);  
  primerNumero=int(random(1,10));
  segundoNumero=int(random(1,10));
  tercerNumero=int(random(1,10));
  cuartoNumero=(segundoNumero*tercerNumero)/primerNumero;
  primerNumeroFalso=random(0,10);
  segundoNumeroFalso=random(0,10);

}
PFont f;
void Instrucciones(){
  image(F6, 0, 0);
  b6a.dibuixa();
  b6b.dibuixa();
  
  //text instruccions
  f = createFont("Comic Sans MS",16,true);
  textFont(f,13);
  fill(#000000);
  text("Moviments", 210,175);
  text("* Per mouret per les pantalles inicials fes servir el ratoli", 210,195);
  text("* Fes servir el ratoli per entrar a les portes de la casa", 210,215);
  text("el primer nivell es la porta esquerra.", 210,245);
  text("* Minijoc: Seleccionar la pilota situada sota del joc,", 210,275);
  text("  fer clic a sobre i moure el ratoli fins la resposta de ", 210,295);
  text("  l'equació plantejada. Evitant colisionar amb els signes", 210,315);
  text("Puntuació", 210,345);
  text("Vidas:", 210,365);
  text("* x5", 210,385);
  text("* Si t’equivoques de resposta perdras una vida", 210,400);
  text("* Quan la puntuació sigi menor a 0 Game Over", 210,415);
  text("Punts:", 210,440);
  text("* Cada vida son 1000 punts", 210,460);
  text("* Cada segon son 5 punts", 210,475);
  text("* Cada col·lisio resta 100 punts", 210,490);
  text("La partida Començarà  amb 7400 punts i anirem perdent", 210,510);
  text("conforme passa el temps i/o col·lisionem.", 210,525);
  text("Al final del mini joc sumarem els punts que has aconseguit.", 210,540);
}
PFont f;
void Credits(){
  image(F7, 0, 0);
  b7a.dibuixa();
  b7b.dibuixa();
  //text credits
  
  f = createFont("Comic Sans MS",16,true);
  textFont(f,16);  
  
  fill(#FE642E);
  text("            TREBALL REALITZAT PER", 215,195);
  fill(#FF8000);
  text("                    Cap de Disseny", 215,255);
  text("                Aspeix Garcia, Francesc", 215,295);
  fill(#DF3A01);
  text("                    Cap de Projecte", 215,355);
  text("                Escudero Moyano, David", 215,405);
  fill(#B43104);  
  text("                    Cap de Programació", 215,455);
  text("                Montes Vázquez, Nicolas", 215,495);
  
  fill(#8A0808);
  text("Alumnes de 1r ASIX Centre D'estudis Roca", 215,575);
}
void Joc(){
  if(pantalla == 8){
    if(puerta1 == true && prueba == true){
      pasado++;
      prueba = false;
  }
  }
  b8a.dibuixa();
  m[0].dibuixa();
  b8b.dibuixa();
  if(mousePressed && ((mouseX < xPosPrimerNumeroFalso+150 && mouseX > xPosPrimerNumeroFalso) || (mouseX < xPosSegundoNumeroFalso+150 && mouseX > xPosSegundoNumeroFalso)) && mouseY < 180 && mouseY > 100 && pasaVida == false && cronometre.vidas > 0 && m[0].apretar==true){
    cronometre.restarVidas();
    pasaVida = true;
  }
 }
void Final(){
  image(F11, 0, 0);
  if(apretado==true){
    F11=F13;
    fill(0);
    textSize(35);
    if(puntuacionFinalBoolean2 == true){
      puntuacionFinal=int(puntuacionFinal*5.15625);
      puntuacionFinalBoolean2=false;
    }
    text("Molt bé "+entrada.texte+" has aconseguit "+puntuacionFinal, 50, 60);
  }
}


