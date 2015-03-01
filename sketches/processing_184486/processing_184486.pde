
int num = 30;
float [] velocitatX = new float[num];
float [] velocitatY = new float[num];
float [] posicioX = new float[num];
float [] posicioY = new float[num];
float[] mida = new float[num];


 
void setup () {
  
   size (500,500);
 
   for (int i=0; i<num; i++) {
    mida[i] = 100;
    posicioX[i] = random(mida[i]/2, width-mida[i]/2);
    posicioY[i] = random(mida[i]/2, height-mida[i]/2);
    velocitatX[i] = random(-10,10);
    velocitatY[i] = random(-10,10);  
  }
}
 
 
void draw () {
  
  background(0);
  strokeWeight(mouseY/8+mouseX/8);
  stroke(random(255),random(255),random(255),random(255)); 
   
   for (int i=0; i<num; i++) {
   
    posicioX[i] += velocitatX[i];
    posicioY[i] += velocitatY[i];
   

 if (posicioX[i]<0+mida[i]/4 || posicioX[i]>width-mida[i]/4) {
      velocitatX[i] = -velocitatX[i];
    }
    
 if (posicioY[i]<0+mida[i]/4 || posicioY[i]>height-mida[i]/4) {
      velocitatY[i] = -velocitatY[i];
    } 
    
    fill (random (255), random (255), random(255));
    ellipse(posicioX[i], posicioY[i], mida[i], mida[i]);
  }
  
}
  
void mousePressed() {
  for (int i=0; i<num; i++) {
    posicioX[i] = mouseX;
    posicioY[i] = mouseY;
    mida[i] = 30;
  }
}

