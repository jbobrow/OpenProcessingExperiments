
float[] x = new float[2]; 
float[] y = new float[2];
float posx, posy,j;

float beginX = 50.0; 
float beginY = 50.0; 
float endX = 50.0;   
float endY = 50.0;  
float distX;         
float distY;         
float exponent = 4;  
float xq = 0.0;       
float yq = 0.0;       
float step = 0.01;   
float pct = 0.0; 

int distxRandom;
int distyRandom;

int ojox, ojoy;
int ojosize;
float ojoangle = 0.0;
  
void setup() {
  size(800, 600);
}

void draw() {
  background(0);

  //Cada cierto tiempo (random) se activa el IF que calcula la posición actual de Plu, y a donde debe dirigirse (posición del ratón).
  j=random(300); 
  if (j<5) {
    pct = 0.0;
    
    //Posición actual de Plu
    beginX = posx;
    beginY = posy;
    
    //Mantener a Plu a una distancia random del ratón.
    distxRandom = (int)Math.floor(Math.random()*(60-100+1)+100);
    distyRandom = (int)Math.floor(Math.random()*(60-100+1)+100);
    
    if (mouseX>width/2){ //Si el ratón esta del lado derecho de la pantalla Plu quedara del lado izquierdo.
      endX = mouseX-distxRandom;
    }else{               //Sino Plu estara del lado derecho del ratón
      endX = mouseX+distxRandom;
    }
    if (mouseY>height/2){//Si el ratón esta del lado inferior de la pantalla Plu quedara del lado superior.
      endY = mouseY-distyRandom;
    }else{              //Sino Plu quedara del lado inferior.
      endY = mouseY+distyRandom;
    }
    
    //A donde debe dirigirse Plu.
    distX = endX - beginX;
    distY = endY - beginY;
  }

  pct += step;
  if (pct < 1.0) {
    posx = beginX + (pct * distX);
    posy = beginY + (pow(pct, exponent) * distY);
  }
  
  ojox = (int)posx;
  ojoy = (int)posy;
  
  dibujarRaton();  
  posicionCuerpo(0, posx,posy,55,45);
  posicionCuerpo(1, x[0], y[0],45,35);
  posicionOjo(mouseX, mouseY);
   
}

void dibujarRaton() {
    pushMatrix();
    translate(mouseX, mouseY);
    noStroke();
    fill(50, 55, 100);
    ellipse(0,0, 150, 150);
    fill(127, 204, 0);
    strokeWeight(20.0);
    stroke(0);
    ellipse(0,0, 80, 80);
    rotate(ojoangle*3);
    line(0, 0,50, 50);
    popMatrix();
}

void posicionCuerpo(int i, float xin, float yin, float s, float t) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * 20;
  y[i] = yin - sin(angle) * 20;
  
  dibujarCuerpo(x[i], y[i], angle, s, t);
}

void dibujarCuerpo(float x, float y, float a, float s, float t) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  fill(200);
  strokeWeight(20.0);
  stroke(200, 100);
  ellipseMode(CENTER);
  ellipse(0, 0, s, t);
  popMatrix();
}

void posicionOjo(int mx, int my) {
    ojoangle = atan2(my-ojoy, mx-ojox);
    dibujarOjo();
}
  
void dibujarOjo() {
    ojosize = 25;
    pushMatrix();
    translate(ojox, ojoy);
    rotate(ojoangle);
    noStroke();
    fill(255);
    ellipse(0, 0, ojosize, ojosize);
    fill(666, 204, 0);
    strokeWeight(10.0);
    ellipse(ojosize/4, 0, ojosize/2, ojosize/2);
    popMatrix();
}



