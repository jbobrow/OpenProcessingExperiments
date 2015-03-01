
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 
 editado por Waldo Costa 25/06/2014
 
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */

float[] x;      //arrays que guardam as posicoes x e y
float[] y;      // de cada um dos elementos

float[] dx;
float[] dy;    // change in position at each frame

float[] rad;       // radius for the moving hand

float[] fase; // diferenca de fase

int quantidade = 20;

void setup() {
  size(500, 500);

  // initial position in the centre of the screen
  
  x = new float[quantidade];
  y = new float[quantidade];
  dx = new float[quantidade];
  dy = new float[quantidade];
  rad = new float[quantidade];
  fase= new float[quantidade];
      
  for (int i = 0; i< quantidade; i++) // inicializa valores iniciais de x e y
  {
  x[i] = width/random(1,10);
  y[i] = height/random(1,10);
  }

for (int i = 0; i< quantidade; i++) // inicializa valores iniciais de dx e dy
  {
  // dx and dy are the small change in position each frame
  dx[i] = random(-1, 1);
  dy[i] = random(-1, 1);
  }
  
    for (int i = 0; i< quantidade; i++) // inicializa valores de dif de fase!
  {
  fase[i] = random(0,360);
  }
  
  
  
  background(0);
  
}


void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  fill(0, 10);
  //rect(0, 0, width, height);



for (int i = 0; i< quantidade; i++)
  {

      rad[i] = radians(frameCount + fase[i]);
    
    // calculate new position
    // novo valor de x e y eh igual ao valor de x ou y + o diferencial
    // que eh definido inicialmente como um random entre -1 e +1, e depois
    // durante a execucao do programa entre random de -(0.5 a 1) ou 0.5 a 1
    x[i] += dx[i];
    y[i] += dy[i];
  
    float max = 1; // velocidade maxima na direcao positiva ou negativa
    float min = 0.5; // velocidade minima na direcao positiva ou negativa
  
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    // inverte o sentido na direcao X quando chega 100 pixels de distancia do limite 
    if (x[i] > width-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }
  
    // inverte o sentido na direcao Y quando chega 100 pixels de distancia do limite
    if (y[i] > height-100 || y[i] < 100) { // "se y eh maior que altura-100 OU y eh menor que 100, faz:
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
      // se dy > 0 eh TRUE, faz o valor negativo randomico no intervalo (min, max), senao faz random(min,max)
    }
  
  
  // rad foi definido como: rad= radians(frameCount);
  
    float bx = x[i] + 100 * sin(rad[i]);
    float by = y[i] + 100 * cos(rad[i]);
  
    fill(180);
  
    float radius = 100 * sin(rad[i]*3); // raio de distancia entre o bx by e o handX e handY
    float handX = bx + radius * sin(rad[i]*3);
    float handY = by + radius * cos(rad[i]*3);
  
    stroke(random(255),random(255),random(255), 50);
    line(bx, by, handX, handY);
    
    stroke(80,120,120);
    ellipse(handX, handY, 2, 2); // hand

  }
  
}



