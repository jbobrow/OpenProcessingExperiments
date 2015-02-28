

//matrizBolas
int numeroDeBolas = 10;
float[] posX = new float[numeroDeBolas];
float[] posY = new float[numeroDeBolas];
float[] velX = new float[numeroDeBolas];
float[] velY = new float[numeroDeBolas];
 int a;
 int b;
 int i;
void setup() {
  size(500, 500);
  for (int b=0; b < numeroDeBolas; b++) {
    //posicionesVelocidades
    posX[b] = random(width);
    posY[b] = random(height);
    velX[b] = random(0.01, 10);
    velY[b] = random(0.01, 10);
  //degradado
  colorMode(RGB,300);
}
}


void draw() {
  dibujafondo();
   for (int b=0; b < numeroDeBolas; b++)
    {
    posicionaelementos(posX[b], posY[b]);
    actualizaposicion(b);
  }
}
  void dibujafondo(){

  background(255,255,255);
  //fondoElipses
  for (int i=0; i<=width; i = i +35)for (int a=0; a<=height; a = a +35){ 
    fill(i,a,0);
    stroke(a,i,0);
    strokeWeight(4);
    ellipse(i, a,30,30);
    fill(0,a,i);
    stroke(i,0,a);
    strokeWeight(2);
    ellipse(i, a,15,15);
    fill(a,0,i);
    stroke(i,0,a);
    strokeWeight(0.5);
    ellipse(i, a,5,5);
    //bolasMovimiento
  }
  
  }
  void posicionaelementos(float posX , float posY ){
    for (int i=0; i<=width; i = i +35)for (int a=0; a<=height; a = a +35){
    noStroke();
fill(i,a,b,40);
    ellipse(posX, posY, 30, 30);
    fill(b,i,a,30);
    ellipse(posX, posY, 15, 15);
      fill(i,a,b,50);
     ellipse(posX, posY, 5, 5);
  }
  }
  void actualizaposicion(int b){
    
 
    posX[b] = posX[b] + velX[b];
    posY[b] = posY[b] + velY[b];
 
    
    if (posX[b] < 0 || posX[b] > width) {
      velX[b] = -velX[b];
    }
    if (posY[b] < 0 || posY[b] > height) {
      velY[b] = -velY[b];
      
    }
  }
    

    

  


