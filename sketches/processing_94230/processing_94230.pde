

// LA SOMBRA DA VUELTAS
//       Las horas son cortas 
//           la sombra da vueltas 
//                alrededor de una aguja 
//              en el cielo 
//   ella me tomo la mano.

int angulo;
PFont miFuente;



void setup(){
  background (222);
  size (800, 800);
  smooth();
miFuente = loadFont("LetterGothicStd-48.vlw"); 
  
}

void draw(){
 girar();

textFont(miFuente, 23);
fill(85, 32, 131, 80);

if(angulo%4 == 0){
text( " pienso_en ti, busco el_silencio;", random(angulo-5), 0);
}

// Ser la tristeza en el anhelo

if(angulo%4 == 0){
text ( "//"+ random (0, 1)+"todo (nada)", random(angulo+5), 0);
}

if (angulo%1200 == 0){
  angulo = 1;
}
 else{ 
  angulo++;
}
}

void girar(){
  translate (width/2, height/2);
  rotate(radians(millis()*0.091));
   
}

void mousePressed() {setup();}

