
/* @pjs preload="fondo.jpg,ajuda.jpg, credits.jpg, historia.jpg, seleccio.jpg, Nivell1.png, Nivell2.png, Nivell3.png, Nivell4.png, 
Nivell5.png, N1.jpg, N2.jpg, N3.jpg, N4.jpg, N5.jpg, perdut.jpg, guanyat.jpg, BombaP.png, diamante.png, formula.jpg, nota.png, notano.png, robamonedas.png, aguabrava.png";
 */

import netscape.javascript.*;

//import ddf.minim.*;
//import ddf.minim.signals.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;

//Autors: David Capellán Ávila, Gerard Peix Auquer, Luis Romero Ballesta, Carlos Cevallos Manzano
//BAIXA QUALITAT DE IMATGES
//--------------------------------DECLARACIONS DE VARIABLES-----------------------------------
//declaració fins on crea l'array
int finsX = 152; 
int finsY = 132;
//declaració variable boolean de clic 
boolean clic;

//declaració scanner.
String typedText = "Nom";

//variable de pantalla en ús.
int nombrePantalla = 1;
int nivell= 0;

//declaracio d'imatges.
PImage inici, credits, opcions, historia ,seleccio, nivell1,nivell2,nivell3,nivell4,nivell5,
joc1, joc2, joc3, joc4, joc5, ajuda, guanyat, perdut,bomba,recompensa, formula, nota, notano, fondo;

//declaracions d'arrays utilitzats pel joc.
int [][]posicionMetros = new int [5][5];
int [][]posicionResultado = new int [2][5];
int [][]posicionBala = new int [2][5];
float []gravedadAcierto = new float [5];
float []gravedadFalloAr = new float [5];
float []gravedadFalloAb = new float [5];
int [][]posicionPirata = new int [2][5];
String []sabiasque = new String [16];


//declaració de reproducció de so del joc. 
//import ddf.minim.*;
//AudioPlayer player;
//Minim minim;

//declaració de la font a utilitzar.
PFont f;







//--------------------------------------VOID SETUP----------------------------------------------
void setup(){
  //font utilitzada al joc.
  f= loadFont("font.vlw");
  font = createFont("Helvetica", 60); 
 
 //declaració de reproducció de so de la resposta no correcta
  //AudioPlayer playerFallat;
 // Minim minimFallat;
  
  //declaració de reproducció de so de la resposta correcta
 // AudioPlayer playerCorrecte;
  //Minim minimCorrecte;
  
  //AudioPlayer playerClic; 
 // Minim minimClic; 
  
  //so utilitzat al joc.
 // minim = new Minim(this);
 // player = minim.loadFile("cancionpirata.mp3");
  //player.play();
  //player.loop();

  //tamany de la pantalla del joc
  size (800,600);
  smooth();
  

  //classe Ardanada.
  Bala = new Ardanada ();
  
  //font utilitzada
  font = createFont("arial", 10);
  
  //funció random dels nombres.
  creaciorandom();
  
  //posicions inicials.
  posicions();
  
  //fiquem les imatges que utilitzarem
  inici= loadImage("fondo.jpg");
  ajuda= loadImage ("ajuda.jpg");
  credits= loadImage("credits.jpg");
  historia= loadImage("historia.jpg");
  seleccio= loadImage("seleccio.jpg");
  nivell1= loadImage("Nivell1.png");
  nivell2= loadImage("Nivell2.png");
  nivell3= loadImage("Nivell3.png");
  nivell4= loadImage("Nivell4.png");
  nivell5= loadImage("Nivell5.png");
  joc1= loadImage("N1.jpg");
  joc2= loadImage("N2.jpg");
  joc3= loadImage("N3.jpg");
  joc4= loadImage("N4.jpg");
  joc5= loadImage("N5.jpg");
  perdut = loadImage ("perdut.jpg");
  guanyat = loadImage ("guanyat.jpg");
  bomba = loadImage ("BombaP.png");
  recompensa = loadImage ("diamante.png");
  formula = loadImage ("formula.jpg");
  nota = loadImage ("nota.png");
  notano = loadImage ("notano.png");
  
}









//----------------------------------VOID DRAW-------------------------------------------
void draw(){   
  background (255);  
  //totes les pantales creades amb la seva funció assignada.
  if (nombrePantalla == 1) inici(); 
  if (nombrePantalla == 4) historia(); 
  if (nombrePantalla == 5) seleccio();
  if (nombrePantalla == 40) credits();
  if (nombrePantalla == 6) nivell1();
  if (nombrePantalla == 7) joc(joc1);
  if (nombrePantalla == 8) nivell2();
  if (nombrePantalla == 9) joc(joc2);
  if (nombrePantalla == 10) nivell3();
  if (nombrePantalla == 11) joc(joc3);
  if (nombrePantalla == 12) nivell4();
  if (nombrePantalla == 13) joc(joc4);
  if (nombrePantalla == 14) nivell5();
  if (nombrePantalla == 15) joc(joc5);
  if (nombrePantalla == 200) ajuda();
  if (nombrePantalla == 202) guanyat(); 
  if (nombrePantalla == 310) perdut();
  if (nombrePantalla == 500) formula();
 
  //condició booleana que activa la funció de la pantalla de "has perdu" quan s'acaben els intents.
  if (findejuego==true){
    perdut();
  }
  
  //condició booleana que activa la funció de la pantalla de error quan es fa ENTER a l'espai buit.
  if (falloenter==true){
    pantallaerror(); 
  }

  //mostra el signe de so activat (menys a la pantalla de selecció de personatge, enllà no es pot desactivar el so).
  if (on == true && nombrePantalla != 5){
    image (nota, 775, 580);
    fill(#030000);
    textFont(font,10);
    text ("OFF = S", 730, 595);
  }
  
  if (on == false && nombrePantalla != 5){
    image (notano, 775, 580);
    fill(#030000);
    textFont(font,10);
    text ("ON = V", 730, 595);
  }
}


//-------FUNCIÓ PER COMPROVAR ELS RESULTATS INTRODUÏTS PEL USUARI-------

//algorisme del primer nivell
void comprovarnivel1(){
  
  if (numX * numY == Integer.parseInt(resultat)){
    aciertopulpo = true;
    //sonidoAcierto();

  }else if (numX * numY > Integer.parseInt(resultat)&& k>0){
     k--;
     falloarriba=true;
     muestravidamenos=true; 
     //sonidoFallo();
      
    }else if(numX * numY < Integer.parseInt(resultat) && k>0){
      k--;
      falloabajo = true; 
      muestravidamenos=true; 
     // sonidoFallo();
    }
    
     if (k==0){
     findejuego=true; 
    }
}

//algorisme del segon nivell 
void comprovarnivel2(){
 int resultattriangle2 = numX*numY/2;
  
  if (resultattriangle2 == Integer.parseInt(resultat)){
    aciertopulpo = true;
    //sonidoAcierto();
    
   }else if (resultattriangle2 > Integer.parseInt(resultat) && k>0){
     k--;
     falloarriba=true;
     muestravidamenos=true; 
     //sonidoFallo();
     
    }else if(resultattriangle2 < Integer.parseInt(resultat) && k>0){
      k--;
      falloabajo = true; 
      muestravidamenos=true; 
     // sonidoFallo();
     
  }
  if (k==0){
     findejuego=true; 
  }
}

//algorisme del tercer nivell 
void comprovarnivel3(){
  int resultattriangle3 = numX*numY/2;
  
  if (resultattriangle3 == Integer.parseInt(resultat)){
    aciertopulpo = true;
   // sonidoAcierto();

  }else if (resultattriangle3 > Integer.parseInt(resultat)&&k>0){
     k--;
     falloarriba=true;
     muestravidamenos=true; 
     //sonidoFallo();

      
    }else if(resultattriangle3 < Integer.parseInt(resultat)&&k>0){
      k--;
      falloabajo = true; 
      muestravidamenos=true; 
     // sonidoFallo();
     
  }
  if (k==0){
     findejuego=true; 
  }
}

//algorisme del quart nivell
void comprovarnivel4(){
  int resultatpentagon = (5*numX)*numY/2;
  
  if (resultatpentagon == Integer.parseInt(resultat)){
    aciertopulpo = true;
   // sonidoAcierto();

  }else if (resultatpentagon > Integer.parseInt(resultat)&&k>0){
     k--;
     falloarriba=true;
     muestravidamenos=true;
    // sonidoFallo();

    }else if(resultatpentagon < Integer.parseInt(resultat)&&k>0){
      k--;
      falloabajo = true; 
      muestravidamenos=true; 
      //sonidoFallo();

  }
  if (k==0){
     findejuego=true; 
  }
}

//algorisme del cinquè nivell
void comprovarnivel5 (){
  int resultatquad = numX*numX;
  int resultattria = numX*numY/2;
  int resultatgen = resultatquad + resultattria;

  if (resultatgen==Integer.parseInt(resultat)){
     aciertopulpo=true;
    // sonidoAcierto();
    }else if (resultatgen < Integer.parseInt(resultat)&&k>0){
      k--;
      falloabajo=true;
      muestravidamenos=true;
     // sonidoFallo();
    }else if(resultatgen > Integer.parseInt(resultat)&&k>0){
      k--;
      falloarriba=true;
      muestravidamenos=true;
     // sonidoFallo();
    }
     if (k==0){
     findejuego=true; 
     }
}

//void que ha que surti un missatge per pantalla (en aquest cas, quan es fa ENTER sense haver escrit ninguna resposta.
void pantallaerror (){
  fill(255,0,0);
  if (nombrePantalla == 7 || nombrePantalla == 9 || nombrePantalla == 11 || nombrePantalla == 13 || nombrePantalla == 15) {
    textFont (font, 12);
    text("INTRODUEIX UN NÚMERO",665, 220, 500, 100);
  }else{
    //no todo es perfecto en esta vida
    fill (0);
    textFont (font, 12);
    text("INTRODUEIX UN NÚMERO",665, 220, 500, 100);
  }
}




//------TOT EL REFERENT A LA JUGABILITAT DEL PROGRAMA-------


Ardanada Bala;
//gravedad de caida de bola a la hora de dibujar
float i=20;
//tope para pasar de nivel 
int next = 0; 
//variable boolean de animación de disparo
boolean aciertopulpo; 
boolean falloabajo; 
boolean falloarriba; 
boolean falloenter = false;  

//variable boolean de frases
boolean sabiasquefrase;

//variable boolean d'activació de sons
boolean on = true; 

//variable boolean de mala generació de random
PFont font;
String resultat ="";

//variables de generació de nombres
int numX;
int numY;
int numYaux;
int numerosX; 
int numerosY;

int tope=10;
int topeY=10;

//aqui crearem els randoms i els assignarem a una variable previament creada
void creaciorandom (){
   numYaux= int (random(30))+5;
   numX= (tope+int(random(35))+5)*2;
   numY= int(random(numYaux+topeY))+5;
}

//aqui la funcion de mostrar numeros aleatorios en la pantalla !!SE MODIFICA POR CADA NIVEL!! 
void mostrarnombre(){
  fill(#030000);
  textFont(font,60);
  text(typedText+(frameCount/10 % 2== 0 ? "_" : ""), 190, 200);  
}

void mostrarnumeros(){
 fill(10);
 textFont (font,14);
 text (numX+ " metres",posicionMetros[0][nivell],posicionMetros[1][nivell]);
 text (numY+ " metres",posicionMetros[2][nivell],posicionMetros[3][nivell]);
}
   
void joc(PImage fons){
  image (fons, 0, 0); 
  chico();
  chica();
  mostrarnumeros();
  vidas(); 
   
  //resultat
  fill(0);
  textFont(font,24);
  text(resultat+(frameCount/30 % 2 == 0 ? "_" : ""), 445, 150);
  
  //funcio dibuixar
  Bala.dibuixa();
  
  //dins d'aquest blocs d' IF, contenen la condició per tal de executar o dibuixar Bala.mouX ();
  //la condició es booleana, que és true. En cas de que més endevant el boolean sigui true, s'executarà.
   if (aciertopulpo == true){
   Bala.mou1();
   }
    
   if (falloarriba == true){
   Bala.mou2();
   }
  
   if (falloabajo == true){
   Bala.mou3();
   }

   //ESTO FUNCIONA Y TIENE SENTIDO
   if (Bala.x < next && aciertopulpo == true && nivell == 0){
     nombrePantalla=8;
     aciertopulpo = false; 
     falloabajo = false;
     falloarriba = false; 
   }
   if (Bala.x < next && aciertopulpo == true && nivell == 1){
     nombrePantalla=10;
     aciertopulpo = false; 
     falloabajo = false;
     falloarriba = false; 
   }
   if (Bala.x < next && aciertopulpo == true && nivell == 2){
     nombrePantalla=12;
     aciertopulpo = false; 
     falloabajo = false;
     falloarriba = false; 
   }
   if (Bala.x < next && aciertopulpo == true && nivell == 3){
     nombrePantalla=14;
     aciertopulpo = false; 
     falloabajo = false;
     falloarriba = false; 
   }
   if (Bala.x < next && aciertopulpo == true && nivell == 4){
     nombrePantalla=202;
     aciertopulpo = false; 
     falloabajo = false;
     falloarriba = false; 
   }

   //condició de repetició quan falles una vida
  if (Bala.x < next){
  aciertopulpo = false; 
  falloabajo = false;
  falloarriba = false; 
  Bala.x = 540;
  Bala.y = 458; 
  i = 20.0;
  
  }
}
 
class Ardanada{
  int x;
  int y; 
  int velocitat;
  int colors; 
  int transparencia;
  int mida; 
  int gravedad;
  
  void dibuixa(){
  rectMode (CENTER);
  fill (colors, transparencia);
  ellipse (x, y, mida,mida);
  }
  
 void mou1 (){
    //aqui cuando acierta
        x=x-velocitat;
        y=y-(int)i;
        i =i-gravedadAcierto[nivell];

  }
  
  void mou2(){
  //aqui cuando hacia abajo
        x=x-velocitat;
        y=y-(int)i;
        i =i-gravedadFalloAb[nivell];
      
 }
  
  void mou3(){
  //aqui cuando falla hacia arriba
        x=x-velocitat;
        y=y-(int)i;
        i =i-gravedadFalloAr[nivell];
  }
  
  
  Ardanada (){
    x=540;
    y=458;
    velocitat=10; 
    colors=#000000;
    transparencia=250;
    mida=25;
  }
  Ardanada(int xPos, int yPos, int vel, int col, int trans, int m){
    x=xPos;
    y=yPos;
    velocitat=vel;
    colors=col; 
    transparencia=trans; 
    mida=m; 
  }
}

//aquest void conté tot el codi que serveix per introduir les respostes de l'usuari.
void keyReleased() {
  if (key == ENTER || key == BACKSPACE || key=='0' || key =='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9') {
    switch(key) {
      
    case BACKSPACE:
      resultat = resultat.substring(0,max(0,resultat.length()-1));
      break;

    case ENTER:
      generarfrases();
      if(resultat != null && resultat.equals("") &&  (j == 1 || nivell == 1 || nivell == 2 || nivell == 3 || nivell == 4)){
        falloenter = true; 
      }
      
      else if (j == 1){
      comprovarnivel1();
      falloenter = false; 
      }
      else if (nivell == 1){
      comprovarnivel2();
      falloenter = false; 
      }
      else if (nivell == 2){
      comprovarnivel3();
      falloenter = false; 
      }
      else if (nivell == 3){
      comprovarnivel4();
      falloenter = false; 
      }
      else if (nivell == 4){
      falloenter = false; 
      comprovarnivel5();
      }
      
     
      break;
      default:
    
    if(resultat.length()<8){
      resultat += key;
    }
    }
  }
   if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0,max(0,typedText.length()-1));
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
      break;
    case ESC:
    case DELETE:
      break;
    default:
      if (typedText.length() < 10){
        typedText += key;
      }
    }
  }
  
}

//PRESENTACIÓ I JOC DEL PERSONATGE + GUANYAR O PERDRE
int j = 0; 
int a; 
//variable restar vidas
boolean muestravidamenos;
boolean findejuego; 
//vidas iniciales
int k = 3; 
 

//sabias que? 
void generarfrases(){
  a = int(random(16));
}

void sabias(){
    fill (255);
    textFont (font, 16);
    text ("Sabies que...", 50, 450);   
    text (sabiasque[a], 50, 480);
}
//----------------------------------------------NIVELLS---------------------------------------
//presentació nivell1
void nivell1(){
  background (255,255,255);
  image (nivell1,0,0);   
  j = 1; 
  sabias();
  
  //Començar a jugar
  if (mouseX > 666 && mouseX < 777 && mouseY > 528 && mouseY < 585){
     cursor(ARROW);
     if (mousePressed) {
     cursor(HAND);
     //clic();
     nombrePantalla = 7;
      }
  }
}

//nivell1
void joc1(){
  background (255,255,255);
  image (joc1,0,0);
   

}

//presentació del nivell 2
void nivell2(){
  background (255,255,255);
  image (nivell2,0,0); 
  nivell=1;
  j=0;
  creaciorandom();
  resultat="";
  sabias();
 
  //Començar a jugar
  if (mouseX > 666 && mouseX < 777 && mouseY > 528 && mouseY < 585){
     cursor(ARROW);
     if (mousePressed) {
     cursor(HAND);
     nombrePantalla = 9;
     //clic();
     }
  }
}
//nivell 2
void joc2(){
  background (255,255,255);
  image (joc2,0,0); 
} 

//presentació del nivell3
void nivell3(){
  background (255,255,255);
  image (nivell3,0,0); 
  nivell=2;
  creaciorandom();
  resultat="";
  sabias();
  //Començar a jugar
  if (mouseX > 666 && mouseX < 777 && mouseY > 528 && mouseY < 585){
     cursor(ARROW);
     if (mousePressed) {
     cursor(HAND);
     nombrePantalla = 11;
     //clic();
     }
  }
}
//nivell 3
void joc3(){
  background (255,255,255);
  image (joc3,0,0); 
} 

//presentació del nivell4
void nivell4(){
  background (255,255,255);
  image (nivell4,0,0);
  nivell=3;
  creaciorandom();
  resultat=""; 
  sabias();
  //Començar a jugar
  if (mouseX > 666 && mouseX < 777 && mouseY > 528 && mouseY < 585){
     cursor(ARROW);
     if (mousePressed) {
     cursor(HAND);
     nombrePantalla = 13;
     //clic();
     }
  }
}
//nivell 4
void joc4(){
  background (255,255,255);
  image (joc4,0,0); 
} 

//presentació del nivell5
void nivell5(){
  background (255,255,255);
  image (nivell5,0,0); 
  nivell=4;
  creaciorandom();
  resultat="";
  sabias();
  //Començar a jugar
  if (mouseX > 666 && mouseX < 777 && mouseY > 528 && mouseY < 585){
     cursor(ARROW);
     if (mousePressed) {
     cursor(HAND);
     nombrePantalla = 15;
     //clic();
     }
  }
}
//nivell 5
void joc5(){
  background (255,255,255);
  image (joc5,0,0); 
} 


 //-------------------------------------------------FUNCIONALITAT DE VIDES------------------------------------------------------
 //VIDAS
 void vidas (){  
   for (int i = 0; i<k; i++){
      image (bomba, 670 +i*40, 2);
   }
 }
 
 void guanyat (){
  background (255,255,255);
  image (guanyat,0,0);
  nivell = 4; 
  mostrarrecompensa();
  if (mouseX > 570 && mouseX < 796 && mouseY > 20 && mouseY < 61){
   cursor(ARROW);
   if (mousePressed) {
   cursor(HAND);
   //clic();
   nombrePantalla = 40;
   j=0;
   nivell=0;
   findejuego = false;
   k = 3;
   aguabravaelegido = false;
   robamonedaselegida = false;
   typedText="Nom";
   creaciorandom();
   resultat="";
   }
  }
 }

void perdut (){
  background (255,255,255);
  image (perdut,0,0);
  mostrarrecompensa();
  
  //ir a menú principal
  if (mouseX > 577 && mouseX < 786 && mouseY > 5 && mouseY < 52){
   cursor(ARROW);
   if (mousePressed) {
   cursor(HAND);
   //clic();
   findejuego = false;
   j= 0; 
   nivell=0;
   k = 3;
   aguabravaelegido = false;
   robamonedaselegida = false;
   nombrePantalla = 1;
   typedText="Nom";
   creaciorandom();
   resultat="";
   }
  }
}

void mostrarrecompensa(){ 
  if (findejuego == true){
   for (i = 0; i<=nivell-1; i++){
    image (recompensa, 80 +i*140, 500);
    }
  }
  if (nivell == 4 && findejuego == false){
    for (i = 0; i<=nivell; i++){
    image (recompensa, 80 +i*140, 500);
    }
  }
  
}



//------PANTALLA CON TODAS LAS POSICIONES ARRAY------

void posicions(){
  //num1  
  
  posicionMetros[0][0] = 150;//x1
  posicionMetros[0][1] = 413;//x2
  posicionMetros[0][2] = 420;//x3
  posicionMetros[0][3] = 555;//x4
  posicionMetros[0][4] = 90;//x5
  
  posicionMetros[1][0] = 590;//y1
  posicionMetros[1][1] = 352;//y2
  posicionMetros[1][2] = 280;//y3
  posicionMetros[1][3] = 335;//y4
  posicionMetros[1][4] = 390;//y5
  
  //num2   
  
  posicionMetros[2][0] = 353;//x1
  posicionMetros[2][1] = 325;//x2
  posicionMetros[2][2] = 370;//x3
  posicionMetros[2][3] = 335;//x4
  posicionMetros[2][4] = 140;//x5
  
  posicionMetros[3][0] = 440;//y1
  posicionMetros[3][1] = 580;//y2
  posicionMetros[3][2] = 490;//y3
  posicionMetros[3][3] = 430;//y4
  posicionMetros[3][4] = 315;//y5
  
  gravedadAcierto[0] = 0.7;//x1
  gravedadAcierto[1] = 0.8;//x2
  gravedadAcierto[2] = 1.0;//x3
  gravedadAcierto[3] = 1.1;//x4
  gravedadAcierto[4] = 1.2;//x5
  
  gravedadFalloAr[0] = 0.50;
  gravedadFalloAr[1] = 0.50;
  gravedadFalloAr[2] = 0.80; 
  gravedadFalloAr[3] = 0.80;
  gravedadFalloAr[4] = 0.80;
  
  gravedadFalloAb[0] = 1.5;
  gravedadFalloAb[1] = 1.5;
  gravedadFalloAb[2] = 1.5;
  gravedadFalloAb[3] = 1.5;
  gravedadFalloAb[4] = 1.8;
  
  
  posicionPirata[0][0] = 670;//x1
  posicionPirata[0][1] = 670;//x2
  posicionPirata[0][2] = 650;//x3
  posicionPirata[0][3] = 670;//x4
  posicionPirata[0][4] = 670;//x5
  
  posicionPirata[1][0] = 340;//y1
  posicionPirata[1][1] = 340;//y2
  posicionPirata[1][2] = 355;//y3
  posicionPirata[1][3] = 340;//y4
  posicionPirata[1][4] = 340;//y5
  
  sabiasque[0] = "El millor tresor que Fausticius pot aconseguir, és l'arracada de Robamonedas";
  sabiasque[1] = "Robamonedas i Aguabrava estan inspirats en personatges de League of Legends";
  sabiasque[2] = "En alguns nivells has de tenir molt en compte el que et diuen els pirates"; 
  sabiasque[3] = "Aguabrava va perdre la mà en una partida de poker, anava de farol"; 
  sabiasque[4] = "El director de Piratas de Caribe s'ha inspirat en aquest joc per la 5ta entrega de la saga"; 
  sabiasque[5] = "Quan Fausticius era petit li van obligar a menjar Pop a la gallega. Té molt malsons"; 
  sabiasque[6] = "El nombre pi és un nombre infinit";
  sabiasque[7] = "1+1 no és 7, és 2"; 
  sabiasque[8] = "Fausticus té 10 mans, és a dir, té TENtacles";
  sabiasque[9] = "Aguabrava va escriure una carta d'amor a Robamonedas amb la tinta que Fausticius va perdre";
  sabiasque[10] = "Fausticius és bon ciutadà, paga a Hicenda reglamentàriament"; 
  sabiasque[11] = "Parts d'un vaixell: Proa=Endavant, Popa=Darrera, Estribor=Part Dreta, Babor=Part Esquerra";
  sabiasque[12] = "Els dibuix d'aquest joc són totalment originals";
  sabiasque[13] = "Amb un tresor de diamants i perles dels pirates, pots pagar la meitad d'una T-10";
  sabiasque[14] = "Badwater i Steelcoins eren els nombres originals. En castellà és més 'guay'";
  sabiasque[15] = "Un día, Robamonedas va pescar un peix molt lleig. Es deia Nemo i s'havia perdut"; 

}


//---------------------------------------PANTALLES -------------------------
//PRINCIPAL
void inici(){
  background(255,255,255);
  image (inici, 0, 0);
  //mostra el signe de so activat  
   // Anar a la pantalla Historia
    if (mouseX > 280 && mouseX < 510 && mouseY > 300 && mouseY < 375){
     cursor(ARROW);
      if (mousePressed) {
        cursor(HAND);
        nombrePantalla=4;
        //clic();
      }
   }
    // Anar a la pantalla de credits
    if (mouseX > 274 && mouseX < 512 && mouseY > 485 && mouseY < 558){
     cursor(ARROW);
      if (mousePressed) {
        cursor(HAND);
        nombrePantalla=40;
        //clic();
      }
   }
   // Anar opcions
    if (mouseX > 274 && mouseX < 515 && mouseY > 393 && mouseY < 466){
     cursor(ARROW);
      if (mousePressed) {
        cursor(HAND);
        nombrePantalla=200;
        //clic();
      }
   }
}

//AJUDA
void ajuda(){
 background(255,255,255);
 image (ajuda,0,0); 
 //Tornar a pantalla principal
 if (mouseX > 105 && mouseX < 272 && mouseY > 527 && mouseY < 587){
     cursor(ARROW);
      if (mousePressed) {
        cursor(HAND);
        nombrePantalla=1;
        //clic();
      }
 } 
 
 //Anar a la pantalla de formules 
 if (mouseX > 288 && mouseX < 456 && mouseY > 527 && mouseY < 587){
     cursor(ARROW);
      if (mousePressed) {
        cursor(HAND);
        nombrePantalla=500;
        //clic();
      }
 } 
 
}
//FORMULA
void formula (){
  background (255,255,255);
  image (formula,0,0);
 //Tornar a pantalla principal
 if (mouseX > 561 && mouseX < 766 && mouseY > 485 && mouseY < 563){
     cursor(ARROW);
      if (mousePressed) {
        cursor(HAND);
        nombrePantalla=1;
        //clic();
      }
 } 
}
//---------------------------------------PANTALLA CREDITS--------------------------------------
void credits(){
    background (255,255,255);
    image (credits,0,0);       
    //Tornar a la pantalla principal
    if (mouseX > 68 && mouseX < 325 && mouseY > 460 && mouseY < 560){
     cursor(ARROW);
      if (mousePressed) {
        cursor(HAND);
        //clic();
        nombrePantalla=1;
      }
   }   
}

//HISTORIA
void historia(){
  background (255,255,255);
  image (historia,0,0);  
  //Anar a la següent pantalla, selecció
    if (mouseX > 538 && mouseX < 697 && mouseY > 93 && mouseY < 150){
     cursor(ARROW);
      if (mousePressed) {
        cursor(HAND);
        nombrePantalla = 5;
        //clic();
      }
   } 
}

//------------------------------------------------SO--------------------------------------------
//parar música.
//void silenci(){
// player.pause();
//}

//reanudar música.
//void reproduir(){
// player.play();
// player.loop();
//}

//void amb condició de pulsar tecles per posar la música o parar-la.
/*void keyPressed(){
  if (key=='s' && nombrePantalla != 5){
    player.pause();
    on = false;
  }
  if (key=='v' && nombrePantalla != 5){
    player.play();
    on = true;
    //player.loop();
  }
}

//declaració de reproducció de so de la resposta correcta
AudioPlayer playerCorrecte;
Minim minimCorrecte;


void sonidoAcierto(){  
  //so utilitzat quan encerta la resposta
  minimCorrecte = new Minim(this);
  playerCorrecte = minimCorrecte.loadFile("cano.mp3");
  playerCorrecte.play();
    
}

//declaració de reproducció de so de la resposta no correcta
  AudioPlayer playerFallat;
  Minim minimFallat;
  
void sonidoFallo(){
   //so utilitzat quan falla
  minimFallat = new Minim(this);
  playerFallat = minimFallat.loadFile("fallo.mp3");
  playerFallat.play(); 
}

//declaració de reproducció de clic
  AudioPlayer playerClic;
  Minim minimClic;
  
void //clic(){
   //so utilitzat quan falla
  minimClic = new Minim(this);
  playerClic = minimClic.loadFile("clic.mp3");
  playerClic.play(); 
}
*/
//-------PANTALLA SELECCIO DE PERSONATGE-------

//variables declaradas para la selección de personaje
PImage robamonedas, aguabrava;
boolean robamonedaselegida; 
boolean aguabravaelegido;

void seleccio(){
  background (255,255,255);
  image (seleccio,0,0);
  mostrarnombre();
      
  //Escollir personatge Robamonedas
  if (mouseX > 193 && mouseX < 333 && mouseY > 274 && mouseY < 548){
     cursor(ARROW);
      if (mousePressed) {
        cursor(HAND);
        nombrePantalla = 6;
        robamonedaselegida = true; 
        generarfrases();
        //clic();
      }
  //Escollir al chico
  
   }  if (mouseX > 460 && mouseX < 604 && mouseY > 274 && mouseY < 548){
     cursor(ARROW);
      if (mousePressed) {
        cursor(HAND);
        nombrePantalla = 6;
        aguabravaelegido = true; 
        generarfrases();
        //clic();
      }
   } 
}

 //elección de personaje 
void chica (){
 if (robamonedaselegida == true){
    robamonedas = loadImage ("robamonedas.png");
    image (robamonedas, 690,340);
  }    
}
void chico(){
 if (aguabravaelegido == true){
    aguabrava = loadImage ("aguabrava.png");
    image (aguabrava, posicionPirata[0][nivell],posicionPirata[1][nivell]);
    
  }
}
  
  






