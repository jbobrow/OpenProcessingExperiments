

int totalBoles = 10;
//creem una matriu d'enters anomenat llistaPosicions:
float[] pX = new float[totalBoles];
float[] pY = new float[totalBoles];
float[] vX = new float[totalBoles];
float[] vY = new float[totalBoles];

void setup() {
  size(800, 800);
  for (int i=0; i < totalBoles; i++) {
    pX[i] = width/2;
    pY[i] = height/2;
    vX[i] = random(-10, 10);
    vY[i] = random(-10, 10);
  }
}

void draw() {
  background(250);
  for (int j=0; j<width; j=j+5) {
    strokeWeight(1);
    stroke(0, 0, 255);
    line(width/2, height/2, width-j, height);
    line(width/2, height/2, width, height-j);
    stroke(255, 0, 0);

    line(j, 0, width, height);
    stroke(20, 255, 0);
    
   line(0, j, width, height);
 stroke(0);
 line(j,0,width/2,height/2);

}
  
  for (int i=0; i < totalBoles; i++) {

    pX[i] = pX[i] + vX[i];
    pY[i] = pY[i] + vY[i];

    //REBOT:
    if (pX[i] < 40 || pX[i] > width-40) {
      vX[i] = -vX[i];
    }
    if (pY[i] < 40 || pY[i] > height-40) {
      vY[i] = -vY[i];
    }
    stroke(0);
    strokeWeight(5);
    fill(250, 250, 0);
    ellipse(pX[i], pY[i], 80, 80);
    fill(1);
    ellipse(pX[i]+10, pY[i]-15, 10, 10);  
    ellipse(pX[i]-10, pY[i]-15, 10, 10);
    noFill();
    strokeWeight(5);
    arc(pX[i], pY[i], 50, 50, 0, PI);
  }
}


//referencias obtenidas del problema de clase matrius3, realizado por Joan Soler


