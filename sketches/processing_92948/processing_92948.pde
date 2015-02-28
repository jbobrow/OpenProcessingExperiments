
/*************************************************
 *  Autors: Adrián Núñez, Adrià Sánchez, Arantxa Pavia
**************************************************/
boolean[] ha_encertat = new boolean[8];
// Aquesta variable indica la pantalla en qué estem en aquell moment. 
int nombrePantalla = 1;
// Declarem 5 imatges.
PImage fondo1, fondo2, fondo3, fondo4, fondo5;
// Utilitzem una font 
PFont f;
String[] preguntas = new String [8];
String[] respuestas = new String [8];
int pregunta;
boolean dispararAgua = false;
String typedText = " ";

  void setup(){
    
  f = loadFont("font.vlw");
  size (600, 500);
  smooth();
  cronometre.comptaEnrera(481);
  // Carreguem les 5 imatges que utilitzarem al principi
  fondo1 = loadImage("Fondo1.jpg");
  fondo2 = loadImage("Fondo2.jpg");
  fondo3 = loadImage("Fondo3.jpg");
  fondo4 = loadImage("Fondo4.jpg");
  fondo5 = loadImage("Fondo5.jpg");
  // La font que utilitzarem
  f = createFont("Helvetica", 18);  
  		//preguntas
		preguntas [0]="Resol el següent exercici: 1/5 + 3/5";
		preguntas [1]="Resol el següent exercici: 8/4 - 6/4";
		preguntas [2]="Resol el següent exercici: 2/5 x 6/4";
		preguntas [3]="Resol el següent exercici: 2/3 % 1/4";
		preguntas [4]="Resol el següent exercici: 2/2 + 2/2";
		preguntas [5]="Resol el següent exercici: 6/6 - 4/6";
		preguntas [6]="Resol el següent exercici: 4/5 x 3/4";
		preguntas [7]="Resol el següent exercici: 2/8 % 4/6";
  //resposta
  //println(pregunta);
  }
  // Podem canviar de pantalla apretant una tecla, com fan alguns jocs. 
  void keyPressed(){
    if (key == 'a'){
      nombrePantalla = 1;
    } 
    if (key == 's'){
      nombrePantalla = 2;
    }
    if (key == 'd'){
      nombrePantalla = 3;
    }
    if (key == 'f'){
      nombrePantalla = 4;
    }
    if (key == 'g'){
      nombrePantalla = 5;
    }
}
Temps cronometre = new Temps();
int x = 40;
int y = 150;
color gris = color (121,114,114);
color rojo = color (255, 0,0);
color negro = color (0,0,0);

  void draw(){
    textFont(f,18);
    background(0,170,228);
    
    // Depenen del que valgui la variable nombrePantalla, canviarem de pantalla
    // Les pantalles estan definides en l'altre fitxer pantalles.pde
    if (nombrePantalla == 1) pantalla1();
    if (nombrePantalla == 2) pantalla2();
    if (nombrePantalla == 3) pantalla3();
    if (nombrePantalla == 4) bombero();
    if (nombrePantalla == 5) pantalla5();
    
    
  }
    void validar(){
      
      int i=0;
      //respuestas
      respuestas [0]=" 4/5";
      respuestas [1]=" 2/4";
      respuestas [2]=" 12/20";
      respuestas [3]=" 8/3";
      respuestas [4]=" 4/2";
      respuestas [5]=" 2/6";
      respuestas [6]=" 12/20";
      respuestas [7]=" 12/32";

      //validacion
      println(":"+typedText+": ");
      println(":"+respuestas[pregunta]+":");
      if(typedText.equals(respuestas[pregunta])){
          System.out.print("Has acertado");
          pregunta = (int)random(8);
          dispararAgua =true;
      }else{
        // HAS FALLADO!!!!!
        for (int j =0; j<ha_encertat.length;j++){
          ha_encertat[j] = false;
      }
        System.out.print("has fallado");                
  }
}

void bombero(){
  fill(250);
    text (preguntas[pregunta], 150, 20);
    text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), 250, 380);
    //suelo
  fill(74,74,74);
  rect(0,400,600,200);
  //edificio
  stroke(0);
  fill(158,40,28);
  rect(450,50,200,350);
  //puerta
   fill(255,255,0);
  rect(505,350,40,50);
  //ventana puerta
  fill(41,115,184);
  rect(510,355,30,20);
  //pomo puerta
  fill(0);
  rect(536,385,2,2);
   //ventanas
  Ventana1();
  Ventana2();
  Ventana3();
  Ventana4();
  Ventana5();
  Ventana6();
  Ventana7();
  Ventana8();
  //BOMBER
  //cara
  noStroke();
  fill(255,255,0);
  rect(40,40,15,15);
  rect(52,48,6,1);
  fill(0);
  rect(48,44,3,3);
  rect(49,51,6,1);
  //pantalons
  fill(0);
  rect(40,75,7,20);
  rect(51,75,7,20);
  //cos
  fill(255,233,0);
  rect(70,60,5,5);
  fill(255,0,0);
  rect(37,55,23,30);
  rect(50,60,20,5);
  //gorro
  rect(35,39,27,3);
  arc(48,39,18,15,3.14,6.30);
  fill(0);
  rect(55,36,2,3);
  //zapatos
  fill(255,0,0);
  rect(40,95,7,7);
  rect(51,95,7,7);
  //manguera
  stroke(170,0,0);
  strokeWeight(5);
  line(6,74,80,65);
  line(5,74,5,370);
  line(5,370,30,370);
  stroke(122,122,122);
  line(76,66,80,65);
  //GRUA
  stroke(0);
  strokeWeight(20);
  line(x+10,y+120,x+40,y+150);  
  line(x+10,y+120,x+40,y+100);  
  line(x+40,y+100,x+10,y+70); 
  line(x+10,y+70,x+40,y+50);
  line(x+40,y+50,x+10,y+20);
  line(x+10,y+20,x+40,y);
  line(x+40,y,x+10,y-30); 
  stroke(80,80,80);
  strokeWeight(10);
  line(x+10,y+120,x+40,y+150);  
  line(x+10,y+120,x+40,y+100);  
  line(x+40,y+100,x+10,y+70); 
  line(x+10,y+70,x+40,y+50);
  line(x+40,y+50,x+10,y+20);
  line(x+10,y+20,x+40,y);
  line(x+40,y,x+10,y-30); 
  strokeWeight(5);
  stroke(0);
  fill(80,80,80);
  rect(10,99,100,20);
  noStroke();
  stroke(0);
  strokeWeight(2);
  line(10,80,110,80);
  line(11,80,11,100);
  line(20,80,20,100);
  line(30,80,30,100);
  line(39,80,39,100);
  line(49,80,49,100);
  line(59,80,59,100);
  line(70,80,70,100);
  line(80,80,80,100);
  line(90,80,90,100);
  line(100,80,100,100);
  line(109,80,109,100);
  noStroke();

  //CAMIO
  //estructura
  fill(255,0,0);
  rect (x-10, y+150, 140, 80);
  rect (x-10, y+163, 180, 80);
  fill (252,26,5);
  //ruedas
  fill (30,30,30);
  ellipse (x+20, y+248, 28, 25);
  ellipse (x+90, y+246, 28, 25);
  ellipse (x+150, y+246, 28, 25);
  fill (74,74,74);
  ellipse (x+20, y+248, 15, 15);
  ellipse (x+90, y+246, 15, 15);
  ellipse (x+150, y+246, 15, 15);
  //cuadro herramientas.
  fill(74,74,74);
  rect (x, y+163, 100, 30);
  //escalera
  fill(165,102,93);
  rect (x+10, y+166, 80, 3);
  rect (x+10, y+186, 80, 3);
  rect (x+13, y+166, 3, 23);
  rect (x+23, y+166, 3, 23);
  rect (x+33, y+166, 3, 23);
  rect (x+43, y+166, 3, 23);
  rect (x+53, y+166, 3, 23);
  rect (x+63, y+166, 3, 23);
  rect (x+73, y+166, 3, 23);
  rect (x+83, y+166, 3, 23);
  //linia vertical
  rect (x+128,y+150, 2, 93);
  fill(0);
  rect (x+135,y+170, 30, 30);
  //mostra cronometre
  //
  textSize(35);
  fill(255, 0, 0);
  int x =cronometre.segonsEnrera();
  if (cronometre.segonsEnrera() < 0){
    x = 0;
  }
  //Imprimim una comptaEnrera que és de trenta segons
  text(cronometre.minutsEnrera()+":"+x, 520, 120+350);
  //EXPULSA AIGUA
  
  if (dispararAgua== true){
     ventanaApagada();
    if (mousePressed && mouseX >450){
      stroke(255);
      strokeWeight(2);
      fill(0,255,255);
      bezier(80,65,mouseX-80,mouseY-80,mouseX-40,mouseY-40,mouseX,mouseY);
      noStroke();
    }  
  } 
 
 
  textSize(12);
  fill(255,255,0);
  strokeWeight(2);
  stroke(0);
  rect (10,430,110,60);
  noStroke();
  fill(0);
  text("TORNAR",40,465);
  
  if (mousePressed && mouseX >10 && mouseX <120 && mouseY>430 && mouseY<490){
    nombrePantalla = 1;
  }
  }

  void mouseReleased(){
  background(0,170,228); 
  draw();
  }


void keyReleased() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
    typedText = typedText.substring(0,max(0,typedText.length()-1));
    break;
    case TAB:
    typedText += "    ";
    break;
    case ENTER:
    case RETURN:
    validar();
    break;
    case ESC:
    case DELETE:
    break;
    default:
    typedText += key;
    }
  }
}
void ventanaApagada(){
  if (mousePressed && mouseX >480 && mouseX <520 && mouseY>80 && mouseY<120){
   ha_encertat[0]=true;
   dispararAgua=false;
  }
  if (mousePressed && mouseX >540 && mouseX <580 && mouseY>80 && mouseY<120){
     ha_encertat[1]=true;
     dispararAgua=false;
  }
  if (mousePressed && mouseX >480 && mouseX <520 && mouseY>150 && mouseY<190){
        ha_encertat[2]=true;
        dispararAgua=false;
  }
  if (mousePressed && mouseX >540 && mouseX <580 && mouseY>150 && mouseY<190){
       ha_encertat[3]=true;
       dispararAgua=false;
  }
  if (mousePressed && mouseX >480 && mouseX <520 && mouseY>220 && mouseY<260){
        ha_encertat[4]=true;
        dispararAgua=false;
  }
  if (mousePressed && mouseX >540 && mouseX <580 && mouseY>220 && mouseY<260){
        ha_encertat[5]=true;
        dispararAgua=false;
  }
  if (mousePressed && mouseX >480 && mouseX <520 && mouseY>290 && mouseY<330){
        ha_encertat[6]=true;
        dispararAgua=false;
  }
  if (mousePressed && mouseX >540 && mouseX <580 && mouseY>290 && mouseY<330){
        ha_encertat[7]=true;
        dispararAgua=false;
  }
}
/*void apagarVentana2(){
   fill(colorQuadrat2);
  rect(540,80,40,40);
 
}
void apagarVentana3(){
   fill(colorQuadrat3);
  rect(480,150,40,40);
  
}
void apagarVentana4(){
   fill(colorQuadrat4);
  rect(540,150,40,40);
  
}
void apagarVentana5(){
   fill(colorQuadrat5);
  rect(480,220,40,40);
  
}
void apagarVentana6(){
   fill(colorQuadrat6);
  rect(540,220,40,40);
  
}
void apagarVentana7(){
   fill(colorQuadrat7);
  rect(480,290,40,40);
  
}
void apagarVentana8(){
   fill(colorQuadrat8);
  rect(540,290,40,40);
  
}
*/
void Ventana1(){
  if (ha_encertat[0]){
    fill(#00FFFF);   //blue
  } else{ 
   fill(#FF0000);  //red
  }
  rect(480,80,40,40);
  
}

void Ventana2(){
  if (ha_encertat[1]){
    fill(#00FFFF);   //blue
  } else{ 
   fill(#FF0000);  //red
  }
  rect(540,80,40,40);
  
}
void Ventana3(){
  if (ha_encertat[2]){
    fill(#00FFFF);   //blue
  } else{ 
   fill(#FF0000);  //red
  }
  rect(480,150,40,40);
  
}
void Ventana4(){
  if (ha_encertat[3]){
    fill(#00FFFF);   //blue
  } else{ 
   fill(#FF0000);  //red
  }
  rect(540,150,40,40);
  
}
void Ventana5(){
  if (ha_encertat[4]){
    fill(#00FFFF);   //blue
  } else{ 
   fill(#FF0000);  //red
  }
  rect(480,220,40,40);
  
}
void Ventana6(){
  if (ha_encertat[5]){
    fill(#00FFFF);   //blue
  } else{ 
   fill(#FF0000);  //red
  }
  rect(540,220,40,40);
 
}
void Ventana7(){
  if (ha_encertat[6]){
    fill(#00FFFF);   //blue
  } else{ 
   fill(#FF0000);  //red
  }
  rect(480,290,40,40);
}
void Ventana8(){
  if (ha_encertat[7]){
    fill(#00FFFF);   //blue
  } else{ 
   fill(#FF0000);  //red
  }
  rect(540,290,40,40);
  
}
		
  
  
		
  
  
// Funció que mostra la primera pantalla
void pantalla1(){
   background(#6A8FD6);  
   image (fondo1, 0, 0);

   // Anar a la pantalla Historia
     if (mouseX > 450 && mouseX < 580 && mouseY > 150 && mouseY < 200){
      cursor(HAND);
      if (mousePressed) {
        cursor(ARROW);
        nombrePantalla=2;
      }
   }
   else {
     cursor(ARROW);
   }
   
   // Anar a la pantalla opcions
   if (mouseX > 450 && mouseX < 580 && mouseY > 190 && mouseY < 300){
      cursor(HAND);
      if (mousePressed) {
        cursor(ARROW);
        nombrePantalla=3;
      }
   }
   else {
     cursor(ARROW);
   }
//Anar a la pantalla joc  
if (mouseX > 460 && mouseX < 580 && mouseY > 400 && mouseY < 480){
      cursor(HAND);
      if (mousePressed) {
        cursor(ARROW);
        nombrePantalla=4;
      }
   }
   else {
     cursor(ARROW);
   }

}
// Funció que mostra la historia
void pantalla2(){
   background(#6A8FD6);  
   image (fondo2, 0, 0);

   // Tornar a la pantalla 1
   if (mouseX > 10 && mouseX < 150 && mouseY > 400 && mouseY < 470){
      cursor(HAND);
      if (mousePressed) {
        cursor(ARROW);
        nombrePantalla=1;
      }
   }
   else {
     cursor(ARROW);
   }
   
}

// Funció que mostra les opcions
void pantalla3(){
   background(#6A8FD6);  
   image (fondo3, 0, 0);
   
   // Tornar a la pantalla 1
     if (mouseX > 400 && mouseX < 560 && mouseY > 370 && mouseY < 460){
      cursor(HAND);
      if (mousePressed) {
        cursor(ARROW);
        nombrePantalla=1;
      }
   }
   else {
     cursor(ARROW);
   }
   
   // Anar a la pantalla 5
     if (mouseX > 20 && mouseX < 170 && mouseY > 30 && mouseY < 160){
      cursor(HAND);
      if (mousePressed) {
        cursor(ARROW);
        nombrePantalla=5;
      }
   }
   else {
     cursor(ARROW);
   }
}
void pantalla4(){
   background(#6A8FD6);  
   image (fondo4, 0, 0);
   // Tornar a la pantalla 1
   if (mouseX > 10 && mouseX < 120 && mouseY > 410 && mouseY < 500){
      cursor(HAND);
      if (mousePressed) {
        cursor(ARROW);
        nombrePantalla=1;
      }
   }
   else {
     cursor(ARROW);
   }
    
   
}
void pantalla5(){
   background(#6A8FD6);  
   image (fondo5, 0, 0);
     // Tornar a la pantalla 3
   if (mouseX > 20 && mouseX < 160 && mouseY > 400 && mouseY < 470){
      cursor(HAND);
      if (mousePressed) {
        cursor(ARROW);
        nombrePantalla=3;
      }
   }
   else {
     cursor(ARROW);
   }
     
   }
class Temps {
  int principi;
  int enrera;
  
  
  Temps(){
    principi = millis();
    if(millis()==0){ 
      
    }
    
  }
  
  int segons(){
    return (millis()-principi)/1000%60;
  }
  int minuts(){
    return (millis()-principi)/60000;
  }
  void comptaEnrera(int segons){
    enrera = segons * 1000 + millis();
    if(segons==0){
      segons=0;
      enrera=0;
      principi=0;

    }
  }
  
  int minutsEnrera(){
    return (enrera-millis())/60000;
    
  }
  int segonsEnrera(){
    return (enrera-millis())/1000%60;
    
  } 
}





