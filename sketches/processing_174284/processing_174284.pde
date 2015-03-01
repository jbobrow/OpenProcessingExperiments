
int sz = 5; //definimos diametro pelota
int numeroPelotas = 10;

//variables tamaño,posicion y velocidad pelota
float [] posX = new float [numeroPelotas];
float [] posY = new float [numeroPelotas];
float [] velX = new float [numeroPelotas];
float [] velY = new float [numeroPelotas];

void setup() {  
  size(500, 300);  
  noStroke(); //pelota sin borde

    for (int i=0; i<numeroPelotas; i++) {
    posX[i]=width/2; //definimos la posicion inicial pelota
    posY[i]=0;
    velX[i]=0; //definimos velocidad inicial pelota
    velY[i]=0;
  }
} 

void draw() { 

  fill(0,25); //fill(R,G,B,alpha): fondo pantalla con grado de transparencia
  rect(0, 0, width, height);

  for (int i=0; i<numeroPelotas; i++) {
    velY[i] = velY[i] + 0.5;  //añadimos gravedad al eje Y
    posX[i] = posX[i] + velX[i]; //actualizamos posiciones 
    posY[i] = posY[i] + velY[i];  

    // rebote pelota en su borde(sz)
    if ((posX[i]+sz/2 > width) || (posX[i]-sz/2 < 0)) { 
      velX[i] = -velX[i];
    }  

    if ((posY[i]+sz/2 > height) || (posY[i]-sz/2 < 0)) { 
      velY[i] = -velY[i]*0.9; //reducimos velocidad en la direccion opuesta: tienden a ascender
    }
  }

  for (int i=0; i<numeroPelotas; i++) {
    fill(255); //fill(RGB,alpha): relleno pelota
    ellipse(posX[i], posY[i], sz, sz);  //dibujamos pelota
  }
} 

void mousePressed() {  //variacion de velocidad
 for (int i=0; i<numeroPelotas; i++) {
   velX[i] = random(-20, 20);      
   velY[i] = -30;
    
  }
}



