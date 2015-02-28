
//Mostrar la primera pantalla
void pantalla1(){
  background(fondo);
  image (boton,200,100);
  image (boton2,200,200);
  image (boton3,200,300);
  image (boton4,200,400);
  image (logo,600,30);
  textFont(letra,27);
  text("Presiona Q para jugar, W para ver las fórmulas y R para ver los créditos. \nPulsa X para salir",25,35);
  
  /********Anar a a la pantalla del joc***********/
  //amb el ratoli
  if(mouseX >210 && mouseX <338 && mouseY >106 && mouseY <162){
    cursor(HAND);
    if(mousePressed){
      cursor(ARROW);
    }
  }else{
    cursor(ARROW);
  }

  
  /*******Anar a la pantalla de les fòrmules***********/
  //amb ratolí
  if(mouseX >210 && mouseX <338 && mouseY >206 && mouseY <262){
    cursor(HAND);
    if(mousePressed){
      cursor(ARROW);
    }
  }else{
    cursor(ARROW);
  }  


  
  /********Anar a la pantalla dels crèdits************/
  //amb el ratoli
  if(mouseX >210 && mouseX <338 && mouseY >306 && mouseY <362){
    cursor(HAND);
    if(mousePressed){
      cursor(ARROW);
    }
  }else{
    cursor(ARROW);
  }


   
  /***************Sortir del joc*****************/ 
  //ratoli
  if(mouseX > 210 && mouseX < 338 & mouseY > 406 && mouseY < 462){
    cursor(HAND);
    if(mousePressed){
      cursor(ARROW);
    }
   }//cierra ifs

}//cierra void menu

/****** MODEL DE PROBLEMA DE MATES *******/

void pantalla5(){
  //valors fixes de la pantalla
  background(loadImage("pizarra.jpeg"));
  fill(255,54,85);
  text("Has sacado un "+resultatDau+"."+" Te encuentras en la casilla "+jugador1.posicioTauler,100,60);
  fill(0,255,255);
  textFont(letra,18);
  text(enunciat2, 100, 200);
  text(correcte,100,350);
  text("(Escribe aqui tu respuesta)",100,280);
  text(resposta+(frameCount/10 % 2 == 0 ? "_" : ""),100,250);
  
  
  /*no escriure la d quan tirem el dau*/
  if(key == 'd' || key == 'D'){
    resposta = "";
  }//cierra if
  
  /**************************************EXERCICI 1***************************************/
  if(resultatProblema == 1){
    
    text("Calcula el área de un rectángulo de 6m de base y 4m de altura", 100, 100);
    if(resposta.equals("24") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }  
    if(resposta.equals("24") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
    /*dibuix d'ajuda*
    stroke(100);
      fill(255,255,0);
    rect(600,300,200,350);
    fill(0,0,255);
    //text("4 m",390,95);
    //text("6 m",295,215);*/
  }//***********************************************************************************fi p1
  
  /***************************************EXERCICI 2****************************************/
  if(resultatProblema == 2){
    text("Calcula el área de un triángulo de 4m de base i 7m de altura",100,100);
    if(resposta.equals("14") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("14") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p2***********************************************************************************
  
  /***************************************EXERCICI 3****************************************/
  if(resultatProblema == 3){
    text("Calcula el área de un cuadrado de lado igual a raíz de 2",100,100);
    if(resposta.equals("2") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("2") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p3********************************************************************************
  
  /***************************************EXERCICI 4****************************************/
  if(resultatProblema == 4){
    text("Calcula el área de un cuadrado con un perímetro de 24cm",100,100);
    if(resposta.equals("36") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("36") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p4********************************************************************************
  
    /***************************************EXERCICI 5****************************************/
  if(resultatProblema == 5){
    text("Las diagonales de un rombo valen 18 i 12 cm. Calcula su área",100,100);
    if(resposta.equals("108") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("108") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p5********************************************************************************
  
    /***************************************EXERCICI 6****************************************/
  if(resultatProblema == 6){
    text("Calcula el área de un hexágono regular si uno de sus lados vale 15 cm \n y su apotema vale 13 cm",100,100);
    if(resposta.equals("585") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("585") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p6********************************************************************************
  
    /***************************************EXERCICI 7****************************************/
  if(resultatProblema == 7){
    text("Calcula el área de un trapecio cuyas bases valen 22 i 13 cm. \n Su altura vale 4 cm.",100,100);
    if(resposta.equals("70") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("70") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p7********************************************************************************
  
    /***************************************EXERCICI 8****************************************/
  if(resultatProblema == 8){
    text("Calcula el área de un enneágono cuyo perímetro vale 81cm y su apotema 12cm",100,100);
    if(resposta.equals("486") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("486") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p8********************************************************************************
  
    /***************************************EXERCICI 9****************************************/
  if(resultatProblema == 9){
    text("Calcula el área de un triángulo de base 12cm y una altura 4 veces menor que su base",100,100);
    if(resposta.equals("18") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("18") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p9********************************************************************************
  
    /***************************************EXERCICI 10****************************************/
  if(resultatProblema == 10){
    text("¿Cuál es el perímetro de un decágono de 5,7 cm de lado?",100,100);
    if(resposta.equals("57") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("57") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p10********************************************************************************
  
     /***************************************EXERCICI 11****************************************/
  if(resultatProblema == 11){
    text("Calcula el área de un rombo cuyas diagonales valen 50 y 25 cm.",100,100);
    if(resposta.equals("625") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("625") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p11********************************************************************************
  
     /***************************************EXERCICI 12****************************************/
  if(resultatProblema == 12){
    text("Si una portería mide 7.4 de ancho por 2.5 m de alto,\n ¿qué área defenderá el portero?",100,100);
    if(resposta.equals("18.5") == true || resposta.equals("18,5") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("18.5") == false  || resposta.equals("18,5") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p12********************************************************************************
  
     /***************************************EXERCICI 13****************************************/
  if(resultatProblema == 13){
    text("Calcula el perímetro de un dodecaedro de 12cm de lado",100,100);
    if(resposta.equals("144") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("144") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p13********************************************************************************
  
     /***************************************EXERCICI 14****************************************/
  if(resultatProblema == 14){
    text("¿Qué área tendrá un triángulo de base 46 cm cuya altura equivale \n a la mitad de su base?",100,100);
    if(resposta.equals("529") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("529") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p14********************************************************************************
  
     /***************************************EXERCICI 15****************************************/
  if(resultatProblema == 15){
    text("Calcula el área total de una valla de jardín que esta formada por 120 cuadrados de lado 14 cm",100,100);
    if(resposta.equals("23520") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("23520") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p15********************************************************************************
  
     /***************************************EXERCICI 16****************************************/
  if(resultatProblema == 16){
    text("¿Qué perímetro tendrá un rectángulo de cuyos lados miden 5 i 7 cm?",100,100);
    if(resposta.equals("24") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("24") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p16********************************************************************************
  
     /***************************************EXERCICI 17****************************************/
  if(resultatProblema == 17){
    text("¿Cuánto mide el lado de un cuadrado cuya área vale 225 cm cuadrados?",100,100);
    if(resposta.equals("15") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("15") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p17********************************************************************************
  
 //amb teclat
  if( key == 'q' || key == 'Q'){
    
      //assignem clicant la lletra R la pantalla del joc.
      nombrePantalla = 2;
   
  }//cierra if

}//cierra la pantalla5

void pantalla4(){
  background(fondoCreditos);
  /******Tornar al menú principal********/
  image(volver,20,580);
  textFont(letra,20);
  fill(255);
  text("Pulsa T para volver al menú principal",250,620);
  //amb ratoli
  if (mouseX >65 && mouseX <210 && mouseY >566 && mouseY <619){
    cursor(HAND);
    if(mousePressed){
      cursor(ARROW);
    }
  }else{
    cursor(ARROW);
  }

}

void pantalla3(){
  background(fondoFormulas);
  //Tornar al menú principal
  image(volver,20,580);
  textFont(letra,20);
  fill(255);
  text("Pulsa T para volver al menú principal",250,620);
  //amb el ratoli
  if (mouseX >65 && mouseX <210 && mouseY >566 && mouseY <619){
    cursor(HAND);
    if(mousePressed){
      cursor(ARROW);
    }
  }else{
    cursor(ARROW);
  }

}//cierra pantalla3

void pantalla6(){
  background(ganador);
  fill(0,0,0);
  textFont(letra,120);
  textFont(letra,30);
  text("Pulsa X para salir del juego, ó Q para volver a jugar",100,60);
  
  //tornar al menu i parar la musica de CHAMPIONS
  if( key == 'q' || key == 'Q'){
      player.pause();
      nombrePantalla = 2;
  }//cierra if
}//cierra pantalla6

void pantalla2(){
  background (fondoJuego);
  jugador1.dibujar();
  
  //mostrar i canviar dau
   if( key == 'd' || key == 'D'){
    if(keyPressed){
      //assignem clicant la lletra d un nou valor del random
      resultatDau = int(random(3));
      resultatDau++;
      //assignem la posicio de la fitxa al resultat del dau.
      jugador1.posicioTauler = jugador1.posicioTauler + resultatDau;
      
      /*CASELLA DE LA MORT*/
      if(jugador1.posicioTauler == 13){
        jugador1.posicioTauler = 0;
      }//cierra if
      
      /*passa de la 6 a la 14*/
      if(jugador1.posicioTauler == 7){
        jugador1.posicioTauler = 14;
      }//cierra if
      
      /*assignar un problema diferent cada cop que tirem*/
      if(key == 'd' || key == 'D'){
          nombrePantalla = 5;
          resposta = "";
          resultatProblema = int(random(17));
          resultatProblema++;
        }//cierra if

    }//cierra if 
  }//cierra if
 
   //imprimir per pantalla el dau
   fill(0,0,255);
   textFont(letra,125);
   text(resultatDau,35,105);
   
   //imprimim  instruccions
   fill(255);
   textFont(letra,20);
   text("Pulsa T para volver al menú principal",270,30);
   text("Pulsa D para mover ficha. Si caes en la casilla 13, vuelves a empezar.\nSi caes en la casilla 7 pasas directo a la 14.",270,610);
   
   //Tornar al menú principal
  image(volver,20,580);
  //amb ratoli
  if (mouseX >65 && mouseX <210 && mouseY >566 && mouseY <619){
    cursor(HAND);
    if(mousePressed){
      cursor(ARROW);
    }
  }else{
    cursor(ARROW);
  }

   

}

//Indiquem la pantalla actual
int nombrePantalla = 1;
//Declarem les imatges
PImage fondo,logo,boton,boton2,boton3,boton4,fondoJuego,fondoCreditos,fondoFormulas,volver,ganador;
//declarem l'array del tauler
Posicio[] tauler = new Posicio[22];
//el nostre jugador
Fitxa jugador1;
//declarem una font per a la lletra
PFont letra;
//declaracio de la variable que guarda el resultat del dau
int resultatDau=1;
//declaracio del random que escollira els problemes
int resultatProblema=1;

/***declaracio de la musica****/
import ddf.minim.*;
Minim minim;
AudioPlayer player;

//EXERCICIS
//enunciats fixes

String enunciat2 = "¿Cuál es tu respuesta al problema? ";
String resposta = "";
String correcte = "¿Es correcta tu respuesta?";
boolean mostrar = false; 


void setup(){
  
  size (950,650);
  smooth();
  //Carreguem les imatges que utilitzarem
  fondo = loadImage("fondo.jpg");
  fondoJuego = loadImage("tablero.jpg");
  fondoFormulas = loadImage("formulas.jpg");
  fondoCreditos = loadImage("creditos.png");
  boton = loadImage("boton.gif");
  boton2 = loadImage("formulas.gif");
  boton3 = loadImage("creditos.gif");
  boton4 = loadImage("salir.gif");
  logo = loadImage("logo.gif");
  volver = loadImage("volver.png");
  ganador = loadImage("ganador.jpg");
  
  //cargamos la letra y la posicion del tablero
  letra = createFont("Comic Sans MS",95);
 
  
  //inicialitzem el tauler
  Posicio aux = new Posicio();
  aux.x = 56;
  aux.y = 45;
  
  //bucle que omplira les posicions del tauler
  for (int i = 0;i<tauler.length;i++){
    tauler[i] = new Posicio();
  }//cierra for
  
  //declaracio de la poscio exacta en la imatge de cada posicio
  tauler[0].x = 230;
  tauler[0].y = 550;
  tauler[1].x = 323;
  tauler[1].y = 544;
  tauler[2].x = 449;
  tauler[2].y = 544;
  tauler[3].x = 570;
  tauler[3].y = 544;
  tauler[4].x = 684;
  tauler[4].y = 544;
  tauler[5].x = 810;
  tauler[5].y = 494;
  tauler[6].x = 824;
  tauler[6].y = 336;
  tauler[7].x = 824;
  tauler[7].y = 201;
  tauler[8].x = 693;
  tauler[8].y = 104;
  tauler[9].x = 500;
  tauler[9].y = 104;
  tauler[10].x = 340;
  tauler[10].y = 104;
  tauler[11].x = 160;
  tauler[11].y = 120;
  tauler[12].x = 120;
  tauler[12].y = 266;
  tauler[13].x = 150;
  tauler[13].y = 430;
  tauler[14].x = 330;
  tauler[14].y = 450;
  tauler[15].x = 475;
  tauler[15].y = 450;
  tauler[16].x = 636;
  tauler[16].y = 450;
  tauler[17].x = 730;
  tauler[17].y = 340;
  tauler[18].x = 650;
  tauler[18].y = 207;
  tauler[19].x = 450;
  tauler[19].y = 200;
  tauler[20].x = 255;
  tauler[20].y = 210;
  tauler[21].x = 230;
  tauler[21].y = 337;
     
  //inicialitzem el jugador1
  jugador1 = new Fitxa();
  
  //icialitxem nova musica
  minim = new Minim (this);
  
}//cierra setup

void draw(){
  //anar a les diferents pantalles segons el valor de nombrePantalla
  if (nombrePantalla == 1) pantalla1();
  if (nombrePantalla == 2) pantalla2();
  if (nombrePantalla == 3) pantalla3();
  if (nombrePantalla == 4) pantalla4();
  if (nombrePantalla == 5) pantalla5();
  if (nombrePantalla == 6) pantalla6();
  
  /*Imprimim per pantalla la posicio cada instant*/
  /*print(mouseX);
  print(",");
  println(mouseY);*/
 //print(jugador1.posicioTauler);
  
  //para joc si la posicio es 21 i surt la pantalla de campio amb musica
  if(jugador1.posicioTauler >= 21){
    jugador1.posicioTauler = 0;    
    nombrePantalla = 6;
    //posar musica
    player = minim.loadFile("champions.mp3");
    //play
    player.play ();
   
  }//cierra if
  
}//cierra draw

/******************* SCANNER ******************************/  
void keyReleased (){
  
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      resposta = resposta.substring(0,max(0,resposta.length()-1));
      break;
    case TAB:
      resposta += "    ";
      break;
    case ENTER:
        break;
    case RETURN:
      // comment out the following two lines to disable line-breaks
      resposta += "\n";
      break;
    case ESC:
    case DELETE:
      break;
    default:
      resposta += key;
    }
  }
}
/******************** FI SCANNER*****************************/

void keyPressed(){
  //anar i tornar de les diferents pantalles amb teclat
  if((key == 'q' || key == 'Q') && nombrePantalla == 1){
    nombrePantalla = 2;
  }else if((key == 'r' || key == 'R') && nombrePantalla == 1){
    nombrePantalla = 4;
  }else if((key == 'w' || key == 'W') && nombrePantalla == 1){
    nombrePantalla = 3;
  }else if((key == 'x' || key == 'X') && (nombrePantalla == 1 || nombrePantalla == 6)){
    exit();
  }else if((key == 't' || key == 'T') && (nombrePantalla == 2 || nombrePantalla == 3 || nombrePantalla == 4)){
    nombrePantalla = 1;
  }
}//cierra keyPressed

void mousePressed(){
  cursor(ARROW);
  //ir y volver de la pantalla menu a las otras
  if(nombrePantalla == 1 && mouseX >210 && mouseX <338 && mouseY >106 && mouseY <162){
    nombrePantalla = 2;
  }else if(nombrePantalla == 1 && mouseX >210 && mouseX <338 && mouseY >206 && mouseY <262){
    nombrePantalla = 3;
  }else if(nombrePantalla == 1 && mouseX >210 && mouseX <338 && mouseY >306 && mouseY <362){
    nombrePantalla = 4;
  }else if(nombrePantalla == 1 && mouseX > 210 && mouseX < 338 & mouseY > 406 && mouseY < 462){
    exit();
  }else if(nombrePantalla == 2 && mouseX >65 && mouseX <210 && mouseY >566 && mouseY <619){
    nombrePantalla = 1;
  }else if(nombrePantalla == 3 && mouseX >65 && mouseX <210 && mouseY >566 && mouseY <619){
    nombrePantalla = 1;
  }else if(nombrePantalla == 4 && mouseX >65 && mouseX <210 && mouseY >566 && mouseY <619){
    nombrePantalla = 1;
  }
}//cierra mousePressed

//definicio de la classe posicio, que definira la posicio de cada casella en el tauler
class Posicio{
  
  //posicio x del tauler
  int x;
  //posicio y del tauler
  int y;
 
}//cierra class Tauler

//definicio de la classe fitxa
class Fitxa{
  
  int posicioTauler;
  int colores;
  int velocidad;
  
  
  void dibujar(){
    rectMode(CENTER);
    fill(colores);
    ellipse(tauler[posicioTauler].x,tauler[posicioTauler].y,55,55);
    frameRate(800);
   
  }//cierra void dibujar
  
  
  //valores de la ficha por defecto
  Fitxa(){
      posicioTauler = 0;
      colores = #ff0000;
      velocidad = 30;
    }//cierra defectos fitxa
  
  
}//cierra class Fitxa
  



