
/**
 * Shows image animation
 * interactive basic
 * by IQLab to Marcela 
 * to Marcela Caballero
 * Grafobios version Web
 * www.iqlab.com.ar (interactive proyect
 */




PImage img, fondo;
float tamanio;
Bicho bichito [];
long time;

int cantidad;
int cantCapas;


boolean atraer = false;

void setup() {

  size(800, 600); 
  colorMode( HSB);
  img = loadImage("a0.png");  // Load an image into the program 
  fondo = loadImage("fondo.png");  // Load an image into the program 
  image(fondo, 0, 0);
  tint(255, 50);
  frameRate (15);
  cantidad = 5;
  bichito = new Bicho [cantidad];
  for (int i = 0; i< cantidad; i++) {
    bichito [i] = new Bicho (width/2, height/2, 3, 120, "a", 29, i);
    bichito [i].xposDestino = random (width) ;
    bichito [i].yposDestino = random (height);
    bichito [i].moviendose = true;
  }
  time = millis ();
  imageMode (CENTER);
  cantCapas =6; // cantidad de capas de habitat
}

void draw() { 
  tint(255);
  background (255);
  if (millis () - time > 1000) {             //---------determina cuando se mueve y genera un destino
    int j = int ( random (cantidad));
    if ( !bichito [j].atraido) {
      bichito [j].xposDestino = random (width) ;
      bichito [j].yposDestino = random (height);
      bichito [j].capaDestino = int (random (6) + 1);
      bichito [j].moviendose = true;
      time = millis ();
    }
  }
  for (int j = 1; j <= cantCapas; j++) {
    for (int i = 0; i< cantidad; i++) {
      if (bichito[i].nroCapa == j) {
        if (bichito[i].moviendose ) {
          bichito[i].avanzar ();
        }
        if (bichito[i].atraido ) {
          bichito[i].avanzar ();
        }

        bichito[i].dibujar ();
      }
    }
  }

  if (atraer) {
    /*
  for (int i = 0; i< 4; i++) {
     //  if (dist (mouseX, mouseY, bichito[i].xpos, bichito[i].ypos ) < 200) {
     bichito[i].atraido = true;
     bichito [i].xposDestino = mouseX;
     bichito [i].yposDestino = mouseY;
     println ("atraido " + i);
     //    }
     }
     */
    bichito[0].atraido = true;
    bichito [0].xposDestino = mouseX;
    bichito [0].yposDestino = mouseY - 100;
    bichito [0].capaDestino = 6;
    bichito[1].atraido = true;
    bichito [1].xposDestino = mouseX+100;
    bichito [1].yposDestino = mouseY;
    bichito [1].capaDestino = 6;
    bichito[2].atraido = true;
    bichito [2].xposDestino = mouseX ;
    bichito [2].yposDestino = mouseY + 100;
    bichito [2].capaDestino = 6;
    bichito[3].atraido = true;
    bichito [3].xposDestino = mouseX - 100;
    bichito [3].yposDestino = mouseY;
    bichito [3].capaDestino = 6;
  }
}



void mousePressed () {
  atraer= true;
  /*    if (atraer)  {
   atraer = false;
   }
   else{
   atraer= true;
   }
   */
}

void mouseReleased() {
  atraer= false;
  for (int i = 0; i< cantidad; i++) {
    bichito[i].atraido = false;
  }
}

class Bicho { 

  float xpos, ypos, speed;
  float angulo;
  boolean dibuajar;
  color saturacion;
  String nombre;
  PImage imgBicho [];
  int indice, cantImagenes, direccion;
  float tamanio;
  float xVel, yVel;
  float apuntarA;
  boolean moviendose = false;
  boolean vibrar = true; 
  float xposDestino, yposDestino;
  int capaDestino;
  int saltoCapa;
  long edad;
  int nroCapa;
  int vida;
  //------------------------------------------------------------------------
  float t = 0;   // incrementador de movimiento (velocidad)
  float factor;  // factor de movimiento
  float xMovimiemto, yMovimiento;
  float step;
  float step2;
  int indiceVector;
  //float factor;
  boolean atraido = false;

  //------------------------------------------------------------------------


  Bicho (float x, float y, float s, int saturacion, String nombre, int cantImagenes, int indiceVector) {  
    xpos = x;
    ypos = y; 
    speed = s; 
    xposDestino = x;
    yposDestino = y;


    this.nombre = nombre;
    this.cantImagenes = cantImagenes;
    this.indiceVector = indiceVector;
    indice = int (random (cantImagenes-1));
    direccion = 1;
    xVel= s ;
    yVel= s;
    imgBicho = new PImage [cantImagenes];
    for (int i = 0   ; i< cantImagenes; i++) {
      int j = i+1;
      imgBicho [i] = loadImage (nombre + i  + ".png");
    }
    edad = millis ();
    nroCapa = int (random (6) + 1);
    capaDestino = nroCapa ;
    tamanio = 0.175;
    println (nroCapa);
    vida = 6;
    saltoCapa =0;

    this.saturacion = vida * 25;
    factor = random(0, 3);
    step = random(1.0, 2.0);
    step2 = random(2.0, 2.5);
  } 





  void dibujar () {

    pushMatrix ();
    //   println (apuntarA);
    translate (xMovimiemto, yMovimiento);

    if (!atraido) {
      angulo = step * t;
    }
    rotate (angulo);


    if (atraido) {
      if (saturacion > 0) {
        saturacion--;
      }
    }
    else {
      if (saturacion < vida * 25) {
        saturacion ++;
      }
    }

    tint(color ( 32, saturacion, 255), 40 * nroCapa  + 15); 

    //  image(imgBicho [indice], xMovimiemto, yMovimiento, img.width* tamanio* (nroCapa+1), img.height* tamanio * (nroCapa+1) );
    image(imgBicho [indice], 0, 0, img.width* tamanio* (nroCapa+1), img.height* tamanio * (nroCapa+1) );

    if (moviendose || indice != 10 || atraido ) {
      indice = indice + direccion; // aputa al `proximo frame de la imagen en movimiento
    }

    //----------------vibra cuando esta quieto
    if (!moviendose && indice == 10 ) {

      if ( vibrar) {
        tamanio = tamanio * 0.97;
        vibrar = false;
      }
      else {
        tamanio = tamanio / 0.97;
        vibrar = true;
      }
    }

    //------------------------------------------

    if (indice >= cantImagenes-1) {
      direccion = -1;
    }
    if (indice <= 0) {
      direccion = 1;
    }


    popMatrix ();
  }



  void avanzar () {
    if (atraido) {
      switch(indiceVector) {
      case 0: 
      println (step * t);
        if  (!(step * t < TWO_PI && step * (t + .002) > TWO_PI ) ) {   
          t =  (abs (TWO_PI - (step * t)) > .2) ? t+ 0.02: t + .002;
          angulo = step * t;
        }
        break;
      case 1: 
        if  (!(step * t < HALF_PI && step * (t + .002) > HALF_PI) ) {   
          t =  (abs (HALF_PI - (step * t)) > .2) ? t+ 0.02: t + .002;
          angulo = step * t;
        }
        break;
      case 2: 
        if  (!(step * t < PI && step * (t + .002) > PI) ) {
         t =  (abs (PI - (step * t)) > .2) ? t+ 0.02: t + .002;
          angulo = step * t;
        } 

        break; 
      case 3: 
        if  (!(step * t < 3*PI/2 && step * (t + .002) > 3*PI/2) ) {
          t =  (abs (3*PI/2 - (step * t)) > .2) ? t+ 0.02: t + .002;
          angulo = step * t;
        } 

        break;
      default:
        break;
      }
    }   
    else {

      t = t + .02;
    }

    t = (step * t > TWO_PI ) ? 0 : t;
    update (t);
    xVel = xpos < xposDestino ? speed : -speed;
    yVel = ypos < yposDestino ? speed : -speed;
    xVel = abs (xpos - xposDestino) < speed ? 0 : xVel;
    yVel = abs (ypos - yposDestino) < speed ? 0 : yVel;

    if (xpos  > 0   && xpos  < width && ypos > -100  && ypos < height && ( dist (xpos, ypos, xposDestino, yposDestino) > speed )  ) { // contenedor en el espacio de la ventana
      xpos += xVel;
      ypos += yVel;
    }
    else {
      moviendose = false;
    }
    if (capaDestino < nroCapa) {
      if (saltoCapa > 30) {
        nroCapa--;
        saltoCapa=0;
      }
      else {
        saltoCapa++;
      }
    }

    if (capaDestino > nroCapa) {
      if (saltoCapa > 20) {
        nroCapa++;
        saltoCapa=0;
      }
      else {
        saltoCapa++;
      }
    }
  }

  void update(float t) {
    if (factor <= 1) {
      xMovimiemto = xpos;
      yMovimiento = ypos;
    } 
    else if (factor <= 2) {
      xMovimiemto =  xpos;
      yMovimiento =  ypos;
    } 
    else if (factor <= 3) {
      xMovimiemto = xpos;
      yMovimiento  =  ypos;
    }
  }
  /*
  void update(float t) {
   if (factor <= 1) {
   xMovimiemto = sin(step2*t) * 120 + xpos;
   yMovimiento = cos(step*t) * 120 + ypos;
   } 
   else if (factor <= 2) {
   xMovimiemto = sin(step*t) * 120 + xpos;
   yMovimiento = cos(step2*t) * 120 + ypos;
   } 
   else if (factor <= 3) {
   xMovimiemto = sin(step*t) * (110 + sin(.01*t) * 110) + xpos;
   yMovimiento  = cos(step*t) * (110 + sin(.01*t) * 110) + ypos;
   }
   }
   */
}



