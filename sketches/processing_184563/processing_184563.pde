
int total=70;
float rojo=255;
float verde=255;
float azul=255;
float posicioX;
float posicioY;
float velocitatX;
float velocitatY;
float[] x= new float[total];
float[] y= new float[total];
float v;
float sz;

void setup() {
  size(400, 300);
  for (int i=0; i<total; i++) {
    x[i] =width/2;
    y[i] =height/2;
 }


  for (int i=0; i<total; i++) {
    x[i] =random (width);
    y[i] =random (height);
  }
  v=10;
  sz=50;
}

void draw() {
  for (int i=0; i<total; i++) {
    x[i]=x[i] + random(-v,v);
    y[i]=y[i] + random (-v, v);
    rect (x[i], y[i], 12, 12);
  }

fill(255, 255, 255); 
   fill (verde, azul, rojo);
   fill(azul, rojo, verde);
   fill (verde, azul, rojo);
 
 
  
}
 
void mouseReleased() {
  background(random(0,255), random(0, 255), random(0, 255));
  velocitatX= random (-15, 15);
  velocitatY= random (-15, 15);
  posicioX = pmouseX;
  posicioY = pmouseY;
  rojo = random(5, 255);
  verde = random(5, 255);
  azul = random(5, 255);
}
