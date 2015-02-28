
import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioPlayer song1;

float a[];
float b[];
float angulos[];
boolean vivas[];
//boolean suena=false;
int numElementos = 5;
int puntaje = 0;
PFont miletrica;
double tiempoAnterior;
boolean jugando = false;


void setup() 
{
  //sonido

  minim = new Minim(this);


  cursor(HAND);
  size(400, 400, P3D);
  miletrica=loadFont("Letra5.vlw");
  textFont(miletrica, 32);
  a = new float[numElementos];
  b = new float[numElementos];
  angulos = new float[numElementos];
  vivas = new boolean[numElementos];

  for (int i=0; i<numElementos; i++) {
    a[i] = random(400);
    b[i] = random(400);
    angulos[i] = random(PI*2);
    vivas[i] = true;
  }
  a[0] = 100;
  tiempoAnterior = millis();
}

void draw() 
{
  PImage w;
  w = loadImage ("Pipes.jpg");
  w.resize(400, 400); 
  imageMode(CORNER);
  background(w);
  if (jugando == false) {

    fill(12, 90, 131);
    text("CLICK TO START", 20, 210);

    if (mousePressed==true) {
      song1 = minim.loadFile("Water.mp3");
      song1.loop();

      jugando=true;
      tiempoAnterior = millis();
    }
  } 

  else if (((millis()-tiempoAnterior)<20000)&&(jugando == true)&&(puntaje<numElementos)) {//condiciones finalizar el juego

    for (int i=0; i<numElementos; i++) {
      a[i] = a[i] ; //random(-10, 10);
      b[i] = b[i] ; //random(-5, 5);
      if (i<numElementos/2) {
        angulos[i] = angulos[i] + random(-0.05);
      } 
      else {
        angulos[i] = angulos[i] + random(0.05);
      }

      fill(255, 129, 3);
      rect(20, 20, 80, 40); // boton 1
      PFont font;
      fill(0);
      font = loadFont("Letra5.vlw"); 
      textFont(font, 14); 
      text("reiniciar", 30, 50);
    }


    //for para pintar las cucarachas

    for (int i=0; i<numElementos; i++) {//dibuja las 5


      if (mousePressed) { 
        if ((mouseX>20)&&(mouseX<100)&&(mouseY>20)&&(mouseY<80)) {
          vivas[i] = true;
        }
      }
      if (vivas[i] == true) {

        noStroke();
        fill(3, 97, 255, 250);
        pushMatrix();


        translate(a[i], b[i], 0);

        // rotateZ(angulos[i]);
        ellipse(0, 0, 5, 5);
        noStroke();
        if (dist(mouseX, mouseY, a[i], b[i]) <= 10) {
          vivas[i] = false;

          //sonido aqui 

          song = minim.loadFile("Plug.wav");
          song.play();



          fill(255, 3, 3, 125);
        } 
        else {

          fill(16, 95, 227, random(200, 0));
        }

        ellipse(0, 0, 10, 10);
        /*     
         fill(0,random(100,255),random(172,173),random(200,255));
         ellipse(15, 0, 3, 3);
         fill(0,100);
         ellipse(5, 0, 17, 5);
         fill(0,50);
         ellipse(5,0,2,40);
         
         
         stroke(0,random(100,150));
         line(0, 0, -6, -(6));
         line(0, 0, -6, random(6));
         
         
         
         line(3,5,3,-5);//patas delanteras
         line(3,5,0,random (5,10));
         line(3,-5,0,-random(5,10));
         line(7,5,7,-5);//patas medias
         
         line(7,5,7,random (5,10));
         line(7,-5,7,-random(5,10));
         
         line(11,5,11,-5);//patas trazeras
         
         line(11,5,11,random (5,10));
         line(11,-5,11,-random(5,10));
         */
        popMatrix();
        translate(0, 0, 0);
      }
    }
  } 
  else {
    song1.close();

    minim.stop();
    if (puntaje==numElementos) {
      ;

      fill(255, 34, 0);
      text("puntaje Maximo!!! ", 200, 70);

      //println("el puntaje es : "+puntaje);

      song = minim.loadFile("Vic.wav");

      song.play();

      delay(7000);

      song.close();

      minim.stop();
    }
    puntaje = numElementos + 1;
    if (puntaje>numElementos) {
      exit();
    } 

    else {


      text("GAME OVER", 120, 210);
      text("click in order to play again", 100, 240);


      if (mousePressed) {
        // revivir los muertos
        for (int i=0; i<numElementos; i++) {
          vivas[i] = true;
        }
        // resetear el tiempo
        tiempoAnterior=millis();
      }
    }
  }
  //for para calcular puntaje
  puntaje = 0;
  for (int i=0; i<numElementos; i++) {
    if (vivas[i] == false) {
      puntaje = puntaje + 1;
    }
  }
  if (puntaje==numElementos) {   
    fill(255, 34, 0);
    text("puntaje Maximo!!! ", 200, 70);
  }

  if (jugando==true) {
    fill(255, 34, 0);
    text("puntaje: "+puntaje, 200, 50);
    println("el puntaje es : "+puntaje);
  }
}


void stop()
{
  song.close();
  minim.stop();
  super.stop();
}


