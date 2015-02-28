
/* @pjs preload="difcil.PNG, Dificultad.PNG,empezar.PNG,fcil.PNG,final.jpg,Historia.PNG,huesos1.png,juego.jpg,loro.png,principal1.jpg,Reglas.PNG"; 
 */


/*******************************************************************************************************
 *Juego creado por:
 *
 *Óscar Martínez Ramos
 *Antonio Cogolludo Abia
 *Christian Muñoz Chaparro
 *
 *Juego diseñado para estudiantes de primero de la ESO, para que sprendas
 matemáticas de una forma divertida.
 *
 *version 2.0 (nuevos creditos, funcion tiempo(maximo 10 minutos).
 *
 ******************************************************************************************************
 */



int f=0;
int dif=1;
int resuelto=1;
PImage loro;
PImage empezar;
PImage dificultad;    //cargar imagenes
PImage fcil;
PImage dificil;
PImage Historia;
PImage Reglas;
PImage huesos;

PImage juego;
PImage principal;
PImage ultima;

int cruces=283; // marcador de dificultad

PFont font;
 
//import ddf.minim.*; //musica

void setup(){
 /* 
  //musica con repetición
  AudioPlayer player;
  Minim minim;
  minim = new Minim(this);
  player = minim.loadFile("pirateMusic.mp3", 2048);
  player.play();
  player.loop();*/
  
  size(600,650);
  
  ultima=loadImage("final.jpg");
  principal=loadImage("principal1.jpg");
  loro =loadImage("loro.png");
  juego=loadImage("juego.jpg");
  empezar =loadImage("empezar.PNG");
  dificultad =loadImage("Dificultad.PNG");
  fcil =loadImage("fcil.PNG");                    //imagenes del juego
  dificil =loadImage("difcil.PNG");
  Historia= loadImage("Historia.PNG");
  Reglas=loadImage("Reglas.PNG");
  huesos=loadImage("huesos1.png");
 
  cronometre = new Temps();
    
  c1 = new Coco(#6C4B18,372); //inicialización de Coco
  
}

void draw(){
  //println(respuesta);
  if(f==0)principal1();
  if(f==1)juego1();
  if(f==3)ultima1();            //pantallas del juego
  if(f==4)historia1();
  if(f==5)reglas1();
  if(f==6)problema1();
  if(f==7)creditos1();
  if(f==8){
    background(0);
    fill(#FF0000);
    textSize(60);
    text("HAS PERDIDO",width/2-200,height/2);
    textSize(40);
    text("Salir",width-200,height-100);
    if(mousePressed && mouseX >=390 && mouseX <=490 && mouseY >=510 && mouseY <= 560 && f==8){
      exit();
    }
  }
}

int a=650; // variable que controla la subida de las rejas

void carcel(){
 
  if(a>=0){
    for(int i=0;i<1000;i+=20){
      strokeWeight(10);
      stroke(#A29C9C);            //crea las rejas y hacen que suban
      line(i,0,i,a);
    }
    a-=3;
  }
 
  if(a<=0){

    if(millis()/1000%2==0){
          fill(0,120);
     rect(132,11,365,87);
     String s="¡¡FELICIDADES!!";
  fill(#BAED16);
  stroke(0);
  textSize(40);
  text(s, 160,50);
  textSize(35);
  text("PIRATA LIBERADO",170,85);
    }
    noStroke();
    fill(0,120);
    rect(38,577,214,30);//volver
    rect(374,577,185,30); //salir
    String x="VOLVER A EMPEZAR";
    fill(#16CBED);
    
    textSize(20);
    text(x,50,600);
   
    text("SALIR DEL JUEGO",384,600);
     if(mousePressed&&mouseX>53&&mouseX<241 && mouseY>584&&mouseY<598){ f=0;strokeWeight(1);imageMode(CORNER);a=650;}
    if(mousePressed&&mouseX>384&&mouseX<592 && mouseY>584&&mouseY<598){ exit();} //acabar el juego
  }
}


int segundo = -1;
int y = 160;
//int coco = 0; //cocos normales
int cocodorado=0; //cocos dorados 
Coco c1;
void cocos (){
    c1.dibujar();
    c1.mover();
    segundo = millis()/1000;
}
class Coco{
  int colors;
  int x;
  int speed;
  void dibujar(){
    fill(colors);
    stroke(0);
    ellipse(x,y+40,30,40);
    fill(0);
    ellipse(x+5,y+35,3,3);
    ellipse(x-5,y+38,3,3);
    ellipse(x-2,y+31,3,3);
  }
  void mover(){
    y = ((y+4+dif)%573);
    if (y > 420){
      if(c1.x>lx-60&&c1.x<lx-17) {          //suma de los cocos cogidos
        if(c1.colors==#C6C602){          
          cocodorado+=1;
        }else{cogidos++;}
      }  
      y = 160;
      //coco += 1;
      x = (int)random(60, 520);
      if (dorado){
        colors = #C6C602;
        dorado=false;
      }
      else { colors =#6C4B18;}
    }
  }   
  Coco(){
    colors=255;
  }
  Coco (int col,int newX){
    x= newX;
    speed =(y+10)%573;
    colors=col;
  }
}

float t1=40, t2=38;
float letrasy=0;
void creditos1(){
  background(0);
    fill(255);
  String s="CRÉDITOS";
  fill(255,0,0);
  textSize(40);
  text(s, 198,55);
  String c="CERRAR";
  textSize(25);
  fill(255,0,0);
  text(c, 442,605);
  fill(#11CE0F);
  textSize(t1);
  text("JEFE DE PROYECTO",132,letrasy+600);
  textSize(t1);
  text("JEFE DE PROGRAMACIÓN",90,letrasy+712);
  textSize(t1);
  text("JEFE DE DISEÑO",155,letrasy+819);
  textSize(t2);
  fill(#0C11E8);
  text("Óscar Martínez Ramos",105,letrasy+648);
  textSize(t2);
  text("Antonio Cogolludo Abia",95,letrasy+761);
  textSize(t2);
  text("Christian Muñoz Chaparro",80,letrasy+873);
  if(letrasy>-400)letrasy-=.6;
  if(mousePressed&&mouseX>443&&mouseX<534 && mouseY>587&&mouseY<604) {f=0;letrasy=0;}
  //println(mouseX+" x");
  //println(mouseY+" y");
  //println(letrasy+" ly");
}

void historia1(){
  fill(255);
  rect(80,80,400,500);
  String s="HISTORIA";
  textSize(32);
  fill(255,0,0);
  text(s, 190,120);
  String c="CERRAR";
  textSize(25);
  fill(255,0,0);
  text(c, 350,530);
  fill(#11CE0F);
  textSize(15);
  //println(mouseX+"x");
  //println(mouseY+"y");
  text("Ha llegado a las manos del Capitán 'McÁngulo' el \n el tesoro más grande que se haya imaginado \n nunca. Como el bravo bucanero que es, decide \n partir con su fiel tripulación rumbo a la isla \n marcada por el mapa. Tiene que salir solo a por \n el tesoro porque su tripulación ha quedado K.O. \n por el ron.Al llegar al lugar marcado, el Capitán \n queda encerrado porque no llevaba con los cocos \n dorados que proporcionaba el cocotero doradaro. \n\n Polly, el loro del capitán, le ayudará a encontrar \n estos cocos.",117,173);
  if(mousePressed&&mouseX>351&&mouseX<444 && mouseY>513&&mouseY<530) f=0;
} 
float lx=200;//posicion x loro
float ly=560;//posicion y loro
int cogidos=0; //numero de cocos cogidos
int cual; //variable del numero de problema
Temps cronometre;
void juego1(){
  
  //background(juego);
   background(#000000);
   imageMode(CORNER);  
   image (juego, 0, 0);
  cocos();
  temps1(f);
  fill(0,180);  
  rect(25,19,163,35); //rectangulo cocos normales
  rect(330,19,246,35); //rectangulo cocos dorados
  fill(255,0,0);
  textSize(20);
  text("Tienes "+cogidos+" cocos",36,45); //contador muestra cocos normales
  text("Tienes "+cocodorado+" cocos dorados",340,45); //contador muestra cocos dorados
  imageMode(CENTER);
  image(loro,lx,ly); // imagen loro
  if(keyPressed&&keyCode==LEFT) lx-=6;  //movimiento loro
  if(keyPressed&&keyCode==RIGHT) lx+=6;
  if(lx<=60) lx=60;
  if(lx>=width-64) lx=width-64;
  fill(255,0,0);
  textSize(20);                                                    //eliminar
  //text("Pulsa la tecla 'c' para ver la última pantalla", 100,340);
  if(cocodorado==6) f=3;
  //if(keyPressed&&key=='c'){f=3;}
  if(cogidos==5){ f=6;;cogidos=0;cual=int(random(1,27));}
                                      //aleatorio para elegir problema
}

void principal1(){
  
background(principal);
  if(mousePressed&&mouseX>71&&mouseX<263 && mouseY>201&&mouseY<238) {f=1;cocodorado=0;
   // iniciem el cronometre
   cronometre.reinicia();
  // Iniciem el compte enrera
  cronometre.comptaEnrera();
  }
  if(mousePressed&&mouseX>71&&mouseX<263 && mouseY>400&&mouseY<438){ f=4;}
  if(mousePressed&&mouseX>71&&mouseX<263 && mouseY>500&&mouseY<537){ f=5;}
  if(mousePressed&&mouseX>270&&mouseX<370 && mouseY>302&&mouseY<338){ dif=1; cruces=283;}
  if(mousePressed&&mouseX>372&&mouseX<473 && mouseY>302&&mouseY<338){ dif=3; cruces=383;}
  if(mousePressed&&mouseX>440&&mouseX<524 && mouseY>542&&mouseY<556){ f=7;} //creditos
  
  image(huesos,cruces,350); //marcador de dificultad 
  image(empezar,71,201); 
  image(dificultad, 71,300);
  image(fcil,270,302);
  image(dificil,372,302);
  image(Historia,71,400);
  image(Reglas,71,500);
  fill(#156FE3);
  textSize(18);
  text("CRÉDITOS",439,555); //creditos
   
}
boolean dorado=false;
String respuesta="";

void problema1(){
  //println(cual);
 
  smooth();
  fill(255);
  //println(mouseX+"x");
  //println(mouseY+"y");
  //PFont font;
  
    background(#1D7426);
  textSize(32);
    fill(#FF0000);
    text(cronometre.minutsEnrera()+":"+cronometre.segonsEnrera(),220 , 552);
  stroke(#F3F716);
  font = createFont("Helvetica", 18);
  textSize(18);
if(cual==1){ //*************************************PROBLEMA 1***********************************
  
  String typedText = "Un triangulo rectangulo, los catetos hacen"+"\n"+ "25cm y 60cm calcula la hipotenusa" ;

  noFill();
  triangle(114,120,114,220,211,220);
  fill(255);
  text("25cm",60,190);
  text("60cm",132,250);
  textFont(font,18);
    text("saltar la pregunta",400,552);
    
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;} 
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("65")!=true){text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350); }
  if(respuesta.equals("65")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

}//fin problema 1


if (cual==2){ //*************************************PROBLEMA 2***********************************

  String typedText = "¿Cuantas diagonales tiene el siguiente \n polígono?" ;

  //creación de la figura
  line(221,115,275,137);
  line(275,137,274,190);
  line(274,190,232,216);
  line(232,216,165,216);
  line(221,115,162,115);
  line(162,115,113,163);
  line(113,163,165,216);
  fill(255);
  textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("14")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("14")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 2

if(cual==3){ //*************************************PROBLEMA 3***********************************

  String typedText = "¿Cuantos lados tiene la siguiente \n figura?" ;

  
  //creación de la figura
  line(173,111,108,153);
  line(108,153,108,211);
  line(108,211,252,211);
  line(252,211,252,153);
  line(252,153,173,111);
  fill(255);
  textFont(font,18);
  text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("5")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("5")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 3

if(cual==4){  //*************************************PROBLEMA 4***********************************

  String typedText = "¿Como se llama la siguiente figura?" ;
  
  //creación de la figura
  line(167,98,108,155);
  line(108,155,167,213);
  line(167,213,224,155);
  line(224,155,167,98);
  fill(255);
  textFont(font,18);
   text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("rombo")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("rombo")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema4

if(cual==5){ //*************************************PROBLEMA 5***********************************
 
  String typedText = "Calcula el lado de un cuadrado si \n si su diagonal hace 14,14 cm" ;

  //creación de la figura
  noFill();
  rect(124,127,100,100);
  line(123,228,223,128);
  fill(255);
  textFont(font,12);
  text("14,14 cm",128,168);
  textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text("X",165,248);
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("10")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("10")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 5

if(cual==6){ //*************************************PROBLEMA 6**********************************
  String typedText = "¿Que mide un el lado de un rombo, \n si sus diagonales miden 16 y 30 cm?" ;
 
  //creación de la figura
  line(167,98,108,155);
  line(108,155,167,213);
  line(167,213,224,155);
  line(224,155,167,98);
  stroke(#B3E807);
  line(167,98,167,213);
  line(108,155,224,155);
  fill(255);
  textFont(font,12);
  text("16cm",148,137);
  text("30cm",177,160);
  textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text("X",117,194);
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("4,7")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("4,7")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 6

if(cual==7){ //*************************************PROBLEMA 7***********************************

  String typedText = "¿Cuanto suman los angulos internos de \n un dodecágono?" ;
  //creación de la figura
  fill(255);
  textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text("a) 2160º",113,130);
  text("b) 1800º",113,160);
  text("c) 180º",113,190);
  text("d) 215º",113,220);
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("1800")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("1800")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 7

if(cual==8){ //*************************************PROBLEMA 8***********************************

  String typedText = "¿Cuantos lados tiene un polígono si la suma \n de sus angulos es 1.980º?" ;
  
  
  //creación de la figura
  fill(255);
  textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text("a) 10",113,130);
  text("b) 6",113,160);
  text("c) 15",113,190);
  text("d) 13",113,220);
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("13")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("13")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 8

 if(cual==9){ //problema 9

    String typedText = "¿Qué tipos de circunferencias son?" ;

    noFill();
    ellipse(147,160,150,150);
    ellipse(147,185,100,100);
    fill(255);
    textFont(font,18);
        text("saltar la pregunta",400,552);
    if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
    text(typedText, 35, 45);
    text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
    if(respuesta.equals("tangentes interiores")!=true){text("INCORRECTO",100,350);}
    else{fill(0,255,0); text("CORRECTO",100,350); }
    if(respuesta.equals("tangentes interiores")==true&&int(millis()/1000%2)==1){respuesta="";dorado = true;f=1;noSmooth();}
    text("saltar la pregunta",400,552);
    if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}

  
  } //fin problema 9
  
    if(cual==10){//problema 10
    
    String typedText = "¿Que distancia hay del centro de la " +"\n"+" circunferencia A al centro de la circunferencia B?" ;
 
    noFill();
    ellipse(147,180,150,150);
    ellipse(247,180,50,50);
    fill(255);
    textFont(font,18);
        text("saltar la pregunta",400,552);
    if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
    text(typedText, 35, 45);
    text("A",142,185);
    text("B",242,185);
    text("Diametro A = 10 cm",350,160);
    text("Radio B = 2 cm",350,190);
    text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
    if(respuesta.equals("7")!=true){text("INCORRECTO",100,350);}
    else{fill(0,255,0); text("CORRECTO",100,350); }
    if(respuesta.equals("7")==true&&int(millis()/1000%2)==1){respuesta="";dorado = true;f=1;noSmooth();}

    
  } //fin problema 10
  
    if(cual==11){//problema 11
   
    String typedText = "¿Qué tipo de recta es respecto a la circunferencia?" ;
 
    noFill();
    line(50,115,250,115);
    ellipse(147,190,150,150);
    fill(255);
    textFont(font,18);
        text("saltar la pregunta",400,552);
    if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
    text(typedText, 35, 45);
    text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
    if(respuesta.equals("tangente")!=true){text("INCORRECTO",100,350);}
    else{fill(0,255,0); text("CORRECTO",100,350); }
    if(respuesta.equals("tangente")==true&&int(millis()/1000%2)==1){respuesta="";dorado = true;f=1;noSmooth();}

    
  }//fin problema 11
  
    if(cual==12){// problema 12
   
    String typedText = "¿Qué tipo de recta es respecto a la circunferencia?" ;
   
    noFill();
    line(50,115,250,200);
    ellipse(147,190,150,150);
    fill(255);
    textFont(font,18);
        text("saltar la pregunta",400,552);
    if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
    text(typedText, 35, 45);
    text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
    if(respuesta.equals("secante")!=true){text("INCORRECTO",100,350);}
    else{fill(0,255,0); text("CORRECTO",100,350); }
    if(respuesta.equals("secante")==true&&int(millis()/1000%2)==1){respuesta="";dorado = true;f=1;noSmooth();}

    
  } //fin problema 12
  
    if(cual==13){//problema 13
   
    String typedText = "El diametro es….. (Debes  responder poniendo "+"\n"+" la letra de la que creas correcta)" ;
 
    noFill();
    fill(255);
    textFont(font,18);
        text("saltar la pregunta",400,552);
    if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
    text(typedText, 35, 45);
    text("a) Una recta que pasa por el centro de la circunferencia.",35,130);
    text("b) La parte de la circunferencia comprendida entre dos"+"\n"+" de sus puntos.",35,160);
    text("c) Un segmento que une dos puntos de la circunferencia.",35,220);
    text("d) Un segmento que une el centro con un punto "+"\n"+" cualquiera de la circunferencia.",35,250);
    text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 350);
    if(respuesta.equals("a")!=true){text("INCORRECTO",100,400);}
    else{fill(0,255,0); text("CORRECTO",100,400); }
    if(respuesta.equals("a")==true&&int(millis()/1000%2)==1){respuesta="";dorado = true;f=1;noSmooth();}

    
  }//fin problema 13
  
    if(cual==14){//problema 14
    
    String typedText = "Una cuerda es...(Debes  responder poniendo "+"\n"+" la letra de la que creas correcta)" ;

    noFill();
    fill(255);
    textFont(font,18);
        text("saltar la pregunta",400,552);
    if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
    text(typedText, 35, 45);
    text("a) Una recta que pasa por el centro de la circunferencia.",35,130);
    text("b) La parte de la circunferencia comprendida entre dos"+"\n"+" de sus puntos.",35,160);
    text("c) Un segmento que une dos puntos de la circunferencia.",35,220);
    text("d) Un segmento que une el centro con un punto "+"\n"+" cualquiera de la circunferencia.",35,250);
    text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 350);
    if(respuesta.equals("c")!=true){text("INCORRECTO",100,400);}
    else{fill(0,255,0); text("CORRECTO",100,400); }
    if(respuesta.equals("c")==true&&int(millis()/1000%2)==1){respuesta="";dorado = true;f=1;noSmooth();}

    
  } //fin problema 14
  
    if(cual==15){//problema 15
    
    String typedText = "¿Qué nombre recibe este elemento de la circunferencia?" ;
    
    noFill();
    line(96,135,222,188);
    ellipse(147,190,150,150);
    fill(255);

    textFont(font,18);
            text("saltar la pregunta",400,552);
    if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
    text(typedText, 35, 45);
    text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
    if(respuesta.equals("cuerda")!=true){text("INCORRECTO",100,350);}
    else{fill(0,255,0); text("CORRECTO",100,350); }
    if(respuesta.equals("cuerda")==true&&int(millis()/1000%2)==1){respuesta="";dorado = true;f=1;noSmooth();}

    
  }//fin problema 15
  
    if(cual==16){//problema 16
   
    String typedText = "¿Tenemos 2 circunferencias de radio 3 y radio 4. La distancia"+"\n"+" de los centros es de 4 cm. Son tangentes exteriores?" ;

    noFill();
    fill(255);

    textFont(font,18);
            text("saltar la pregunta",400,552);
    if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
    text(typedText, 35, 45);
    text("a)Si",65,160);
    text("b)No",65,220);
    text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 350);
    if(respuesta.equals("no")!=true){text("INCORRECTO",100,400);}
    else{fill(0,255,0); text("CORRECTO",100,400); }
    if(respuesta.equals("no")==true&&int(millis()/1000%2)==1){respuesta="";dorado = true;f=1;noSmooth();}

    
  }//fin problema 16
  
  if(cual==17){ //*************************************PROBLEMA 17***********************************

  String typedText = " A que distancia de un segmento de 10 m tenemos que trazar otro de \n 14 m, que sea paralelo, de manera, que cuando cerremos la figura \n obtendremos un área de 84 m2." ;

  noFill();
  line(100,160,100,250);
  line(100,160,225,160);
  line(100,250,295,250);
  line(225,160,295,250);
  //altura
  line(165,160,165,170);
  line(165,180,165,190);
  line(165,200,165,210);
  line(165,220,165,230);
  line(165,240,165,250);
  fill(255);

  text("10",150,155);
  text("h",175,210);
  text("14",130,270);
  textFont(font,18);
      text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("7")!=true){text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350); }
  if(respuesta.equals("7")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 17

if (cual==18){ //*************************************PROBLEMA 18***********************************

  String typedText = " Busca el tercer ángulo de un triángulo, si sabes que los otros dos \n miden 47º i 81º" ;

  noFill();
  
  //creación de la figura
  triangle(355,129,349,239,200,171);
  fill(255);
    textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}

  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("52")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("52")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 18

if (cual==19){ //*************************************PROBLEMA 19***********************************

  String typedText = " Calcula el valor de los tres ángulos de un triángulo equilátero." ;

  noFill();
  
  //creación de la figura
  triangle(275,109,198,203,365,203);
  fill(255);
   textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
 
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("60")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("60")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 19

if(cual==20){ //*************************************PROBLEMA 20***********************************

  String typedText = " Calcular el área del siguiente triángulo:" ;

  noFill();
  triangle(100,200,135,110,295,200);
  //stroke mismo color que respuesta correcta; esto es la altura
  line(135,110,135,200);
  fill(255);
  textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text("7",140,170);
  text("12",170,220);
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("42")!=true){text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350); }
  if(respuesta.equals("42")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 20

if(cual==21){ //*************************************PROBLEMA 21***********************************

  String typedText = " Calcular el área del siguiente triángulo:" ;
 
  noFill();
  triangle(100,200,165,110,145,200);
  //stroke mismo color que respuesta correcta; esto es la altura
  line(165,110,165,200);
  fill(255);
  textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text("9",170,170);
  text("4",120,225);
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("18")!=true){text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350); }
  if(respuesta.equals("18")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 21

if(cual==22){ //*************************************PROBLEMA 22***********************************

  String typedText = " Una vela triangular de una barca se ha estropeado y hay que \n sustituirla por otra. Para confeccionar la nueva vela nos cobran \n 21 euros por m2. ¿Cuánto costará esa nueva vela si debe tener \n 8 m de alto y 4 m de base?" ;

  //creación de la figura
  fill(255);
    textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}

  text("a) 532 €",113,170);
  text("b) 215 €",113,200);
  text("c) 336 €",113,230);
  text("d) 330 €",113,260);
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("336")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("336")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}


}//fin problema 22

if(cual==23){ //*************************************PROBLEMA 23***********************************
  
  String typedText = " Calcula la altura del triángulo sabiendo que la base mide 4 m, los \n lados iguales miden 6,3 m y el área es de 12 m2." ;

  noFill();
  triangle(100,240,135,120,165,240);
  fill(255);
   textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("6,6")!=true){text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350); }
  if(respuesta.equals("6,6")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}

  
}//fin problema 23

if(cual==24){ //*************************************PROBLEMA 24***********************************

  String typedText = " Que nombre recibe el punto donde se cortan las mediatrices de \n los lados de un triángulo." ;
  
  //creación de la figura
  fill(255);
  textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text("a) mediana",113,150);
  text("b) circuncentro",113,180);
  text("c) bisectriz",113,210);
  text("d) incentro",113,240);
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("circuncentro")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("circuncentro")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}


}//fin problema 24

if(cual==25){ //*************************************PROBLEMA 25***********************************

  String typedText = " Cuantas bisectrices tiene un triangulo" ;
  
  //creación de la figura
  fill(255);
   textFont(font,18);
    text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text("a) una",113,150);
  text("b) cinco",113,180);
  text("c) ninguna",113,210);
  text("d) tres",113,240);
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("tres")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("tres")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}


}//fin problema 25

if(cual==26){ //*************************************PROBLEMA 26***********************************

  String typedText = " Es cierto que las dos alturas de un triangulo se cortan en un \n único punto" ;

  //creación de la figura
  fill(255);
  textFont(font,18);
      text("saltar la pregunta",400,552);
  if(mousePressed&&mouseX>400&&mouseX<538 && mouseY>338&&mouseY<551){ f=1;}
  text("a) verdadero",113,180);
  text("b) falso",113,210);
  text(typedText, 35, 45);
  text(respuesta+(frameCount/10 % 2 == 0 ? "_" : ""), 100, 300);
  if(respuesta.equals("falso")!=true){
    text("INCORRECTO",100,350);
  }else{fill(0,255,0); text("CORRECTO",100,350);}
  if(respuesta.equals("falso")==true&&int(millis()/1000%2)==1){f=1;respuesta="";dorado=true;noSmooth();}


}//fin problema 26

} //fin void problema
 /*
void keyReleased() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      respuesta = respuesta.substring(0,max(0,respuesta.length()-1));
      break;
    case ENTER:
    case RETURN:
      respuesta += "\n";
      break;
    case ESC:
    case DELETE:
      break;
    default:
      respuesta += key;
    }
  }  
}
*/
void keyReleased() {
  if (keyCode == BACKSPACE || keyCode == DELETE){
      respuesta = respuesta.substring(0,max(0,respuesta.length()-1));
  } 
  else if (key != CODED){
        respuesta = respuesta.concat (new String(key));
  }
}


void reglas1(){
  fill(255);
  rect(80,80,400,500);
  String s="REGLAS";
  textSize(32);
  fill(255,0,0);
  text(s, 190,120);
   
  String c="CERRAR";
  textSize(25);
  fill(255,0,0);
  text(c, 350,530);
  textSize(15);
  fill(#11CE0F);
  text("-El loro se mueve de izquierda a derecha utilizando \n las flechas.",96,180);
  text("-Hay dos tipos de cocos, normales y dorados, los \n normales los necesitas para realizar los problemas \n y si respondes bien a la pregunta aparecerá un coco \n dorado.",96,231);
  text("-Escribe las respuestas siempre en minúscula.",96,326);
  text("-Liberarás al pirata cuando consigas 6 cocos dorados",96,350);  
  if(mousePressed&&mouseX>351&&mouseX<444 && mouseY>513&&mouseY<530) f=0;
}
int atras = 600;



void temps1(int numero){
  textSize(32);
  fill(#FF0000);
  int segatr=cronometre.segonsEnrera();
        int minatr=cronometre.minutsEnrera();
  if (f == 1 || f == 3){
     text(minatr+":"+segatr,220 , 45);
  }
}


class Temps {
  int principi;
  int enrera;
  Temps(){
    principi = millis();
  }
  void reinicia(){
    principi = millis();
  }  
  int mostraTotalSegons(){
    return int(millis()-principi);
  }
  int segons(){
    return int((millis()-principi)/1000%60);
  }
  int minuts(){
    return int((millis()-principi)/60000);
  }
  void comptaEnrera(){
    enrera = atras * 1000 + millis();
    if(enrera == 0)enrera= atras*1000+millis();
  }
  int minutsEnrera(){
    if (enrera-millis()< 0)return 0;
    else return int((enrera-millis())/60000);

  }
  int segonsEnrera(){
    if (enrera-millis()< 0){
      f=8;
      strokeWeight(1);imageMode(CORNER);
      return 0;
    }
    else return int((enrera-millis())/1000%60);
  }
}
void ultima1(){
  smooth();
  background(ultima);
  noStroke();
  fill(#091448);
  ellipse(310,500,220,350);//cuerpo
  fill(#890707);
  rect(187,369,70,285);//**************************
  triangle(187,369,128,578,210,620);//*************
  rect(355,369,70,285);//chaqueta
  triangle(425,369,390,620,480,578);
  fill(#FFEE27);
  rect(165,345,100,30);//ombreras
  rect(348,345,100,30);//ombreras
  fill(#462505);
  rect(238,304,140,60);//**************************
  triangle(200,343,239,307,258,363);//*************
  triangle(223,380,246,331,281,376);//*************
  triangle(252,396,251,339,286,365);//*************
  triangle(296,409,260,353,329,348);//barba
  triangle(357,394,295,376,357,315);//*************
  triangle(403,370,340,363,364,310);//*************
  triangle(403,370,340,363,375,292);//*************
  fill(#FFB76F);
  ellipse(310,275,165,120);//cara del pirata
  fill (0);
  ellipse(310,220,220,40);//sombrero
  ellipse(310,180,100,90);//sombrero
  triangle(173,168,200,220,275,200);
  triangle(433,168,420,220,345,200);
  triangle(312,110,265,160,355,160);
  fill(255);
  ellipse(310,180,50,40);//calavera
  rect(295,194,30,7);//calavera  
  ellipse(280,160,10,10);//***********
  ellipse(285,155,10,10);//***********
  ellipse(340,160,10,10);//***********
  ellipse(335,155,10,10);//***********
  ellipse(283,203,10,10);//huesos
  ellipse(278,198,10,10);//***********
  ellipse(337,203,10,10);//***********
  ellipse(343,197,10,10);//***********
  stroke(255);
  strokeWeight(8);
  line(282,157,337,197);//************
  line(337,157,282,197);//************
  noStroke();
  fill(0);
  ellipse(299,180,15,15);
  ellipse(321,180,15,15);
  triangle(310,182,303,196,317,196);
  fill(255);
  arc(300,345,60,60,0,PI);//boca parte inferior
  fill(#462505);
  arc(300,345,60,30,0,PI);//boca parte superior
  fill(#FFB76F);
  ellipse(300,327,40,40);//nariz
  fill(0);
  ellipse(270,279,50,50);//parche
  stroke(0);
  strokeWeight(5);
  line(366,233,235,297);//tira del parche
  fill(255);
  noStroke();
  ellipse(339,276,30,15);//ojo
  fill(0);
  ellipse(339,276,8,5);//ojo, parte interna
  noSmooth();
  float rejas=height; //longitud inicial rejas

  carcel(); //rejas

}




