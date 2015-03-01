
/*
 * Creative Coding
 * Week 3, 02 - array with sin()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University

edited by Waldo Costa 23/06/2014

 *
 * This program demonstrates the use of arrays.
 * It creates three arrays that store the y-position, speed and phase of some oscillating circles.
 * You can change the number of circles by changing the value of num in setup()
 * You can change the background colour by holding the left mouse button and dragging.
 * 
 */

int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = 120;
float green = 120;
float blue = 120;

float referenciaX = width/2;
float referenciaY = height/2;

float diametros =20;

int corbackground =0;
int incremento = 1;



void setup() {
  size(500, 500);
  frameRate(25);
  num = 60;

  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(7);
    phase[i] = random(TWO_PI);
  }
}


void draw() {
  background(corbackground, 160, 160);

  corbackground += incremento;

  // modifica a cor do background:
  if (corbackground==255) {
     incremento = -1;
  }
  if (corbackground==0) {
    incremento = +1;
  }


  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    float x = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200;

    
    // circulo no local onde o mouse eh pressionado:
    noStroke();
    fill(255, 30);
    ellipse(referenciaX, referenciaY, 20, 20);
    
        
    /*
    fazer com que a distancia entre o circulo em movimento e o estatico
    influencie no tamanho dos circulos moveis..
    */
    
    diametros = dist(referenciaX, referenciaY, x, y[i]);
    diametros = map(diametros, 0, width, 0, width/4);
    // circulos em movimento
    fill(255,255,255, 150);
    ellipse(x, y[i], diametros, diametros);
    
    referenciaX += 0.001;
    referenciaY += 0.001;
  }
  
  
  // uncomment para salvar of frames e fazer um video
  // saveFrame("frames/####.png");
  
}


// change the background colour if the mouse is dragged
void mouseDragged() {
   referenciaX = mouseX;
   referenciaY = mouseY;
}

// cria um circulo vermelho onde o mouse eh clicado
void mousePressed() {
   referenciaX = mouseX;
   referenciaY = mouseY;
  
}



