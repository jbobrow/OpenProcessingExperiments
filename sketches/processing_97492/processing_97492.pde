
frameRate(5);
//matrizBolas
int numeroDeBolas = 10;
float[] posX = new float[numeroDeBolas];
float[] posY = new float[numeroDeBolas];
float[] velX = new float[numeroDeBolas];
float[] velY = new float[numeroDeBolas];

void setup() { 
  size(500, 500);
  for (int b=0; b < numeroDeBolas; b++) {
    //posicionesVelocidades
    posX[b] = random(width);
    posY[b] = random(height);
    velX[b] = random(0.01, 0.1);
    velY[b] = random(0.01, 0.1); 
  //degradado
  colorMode(RGB,300);
} 
}
void draw() { 
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
    for (int b=0; b < numeroDeBolas; b=b+1) {

    posX[b] = posX[b] + velX[b];
    posY[b] = posY[b] + velY[b];

   
    if (posX[b] < 0 || posX[b] > width) {
      velX[b] = -velX[b];
    }
    if (posY[b] < 0 || posY[b] > height) {
      velY[b] = -velY[b];
     
        
    }
    //bolasFormal
noStroke();
fill(i,a,b,40);
    ellipse(posX[b], posY[b], 30, 30);
    fill(b,i,a,30);
    ellipse(posX[b], posY[b], 15, 15);
      fill(a,a,b,50);
     ellipse(posX[b], posY[b], 5, 5);
  }

    }
   
     
}


