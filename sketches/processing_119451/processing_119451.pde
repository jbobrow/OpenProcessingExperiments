
//NAVE
int Xrect = 100;
float szrect = 20;
float fuegomax = Xrect*0.4;
float fuegocrece = 10;
float fuegomin = Xrect*0.6;
float fuegoestable = Xrect*0.45;
boolean creciendo = true;
int rojo = 255;
int amarillo = 230;

//EXPLOSION
int explmax = 301;
/*int explmin = 1;*/
int explbaja = 1;
int explcreciendo = 50;
boolean explcrece = true;


//OBSTACULOS
int numObst = 40;

float [] Xobst = new float[numObst];
float [] Yobst = new float[numObst];
float [] velXobst = new float[numObst];
float [] velYobst = new float[numObst];
float []szObst = new float [numObst];

//FONDO ESTRELLADO
int numstar = 300;

float [] Xstar = new float[numstar];
float [] Ystar = new float[numstar];
float [] szstar = new float[numstar];

PFont letra;

void setup() {
  size(800, 600);
  for (int i = 0; i<numObst;i++) {
    Xobst[i] = width;
    Yobst[i] = int(random(height));
    velXobst[i] = random(1, 4);
    velYobst[i] = random(-1, 1);
    szObst[i] = random(10, 80);
  }

  for (int i = 0; i<numstar;i++) {
    Xstar[i] = int(random(width));
    Ystar[i] = int(random(height));
    szstar[i] = random(1, 3);
  }
  noCursor();
}

void draw() {
  background(0);



  //fondo estrellado
  for (int i=0; i<numstar; i++) {
    noStroke();
    fill(255);
    ellipse(Xstar[i], Ystar[i], szstar[i], szstar[i]);
  }

  //Obstaculos
  for (int i=0; i<numObst; i++) {
    Xobst[i] = Xobst[i]-velXobst[i];
    Yobst[i] = Yobst[i]+velYobst[i];

    if ((Yobst[i]<0)||(Yobst[i]>height)) {
      velYobst[i] = -velYobst[i];
    }
  }




  for (int i=0; i<numObst; i++) {
    colorMode(HSB, numObst);
    fill(i, i, i);
    stroke(54, 0, 99);
    rect(Xobst[i], Yobst[i], szObst[i], szObst[i]);
    if (Xobst[i] <= 0) {
      Xobst[i] = width;
    }
    //RESET
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        Xobst[i] = width;
      }
    }
  }



  //Dibujo Nave
  noStroke();
  colorMode(RGB, 255);
  rectMode(CENTER);
  fill(156);

  //cuerpo
  rect(Xrect, mouseY, szrect, szrect);
  fill(0, 0, 255);
  ellipse(Xrect, mouseY, szrect*0.3, szrect*0.3);

  //propulsor
  rect(Xrect*0.9, mouseY, szrect*0.5, szrect*0.5);

  //fuego
  if (creciendo == true) {
    fuegoestable = fuegoestable-fuegocrece;
    fill (rojo, amarillo, 0);
  }
  else {
    fuegoestable = fuegoestable+fuegocrece;
    fill (rojo, 0, 0);
  }
  /////////////////////////////////////////////////////////////////////////////////////////
  if (fuegoestable > fuegomin) {
    creciendo = true;
  }

  if (fuegoestable < fuegomax) {
    creciendo = false;
  }
  ////////////////////////////////////////////////////////////////////////////////////////
  triangle(Xrect*0.8, mouseY+(szrect/2)/2, Xrect*0.8, mouseY-(szrect/2)/2, fuegoestable, mouseY);







  /////////////////////////////////////////////////////////////////////////////////////////
  //GAME OVER


  for (int i=0; i<numObst; i++) {
    if (dist(Xrect, mouseY, Xobst[i], Yobst[i]) < (szrect/2)+(szObst[i]/2)) {


      /*
      
       PRUEBA CON EXPLOSION CRECIENDO Y DECRECIENDO FALLIDA
       
       if (explcrece == true) {
       explbaja += explcreciendo;
       }
       if (explcrece == false) {
       explbaja = 1;
       }
       
       if (explbaja > explmax) {
       explcrece = false;
       }
       
       
       
       if (explbaja < explmin) { 
       
       explcrece = true;
       }*/



      if (explbaja < explmax) {
        explbaja += explcreciendo;
      }

      /*if (explbaja > explmax) {
       explbaja = 1;
       }*/

      fill(255, 130, 0);
      ellipse (Xrect, mouseY, explbaja, explbaja);
    }
  }

  if (explbaja == explmax) {

    rectMode(CORNER);
    noStroke();
    fill(255, 0, 0);
    rect(0, 0, width, height);
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        explbaja = 1;
      }
    }
  }


  stroke(156);
  fill(255);
  letra = loadFont("ArialMT-24.vlw");
  textFont(letra, 18); 
  text ("Evita los obstaculos", width*0.7, height*0.1);
  text ("Pulsa R para reset", width*0.7, height*0.15);
  
}
