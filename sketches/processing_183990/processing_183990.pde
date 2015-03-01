
float [] psX = new float [15];
float [] psY = new float [15];

float [] velocitatY = new float [15];
float [] velocitatX = new float [15];

float mida = 10;
float radi = mida/2;

float R = 255;
float G = 255;
float B = 255;

float psXTri;
float psYTri;
float psX2;
float psX3;
float psY2;

void setup(){
  size(600,600);
  for(int i=0; i<15; i++){
  psX[i] = random(25);
  psY[i] = random(25);
  velocitatY [i] = random(10);
  velocitatX [i] = random(10);
}

}
void draw(){
  background(0);
  fill(R,G,B);
  
  for(int i=0; i<15; i++){
    psX[i] = psX[i] + velocitatX[i];
    psY[i] = psY[i] + velocitatY[i];
  ellipse(psX[i],psY[i], mida, mida);
    psXTri = psX[i];
    psYTri = psY[i];
    psX2 = psXTri+mida;
    psX3 = psXTri+radi;
    psY2 = psYTri-mida;
  triangle(psXTri, psYTri, psX2, psYTri, psX3, psY2);
  rect(psX[i],psY[i],-mida,mida);
 if (psX[i]>=width||psX[i]<=0) {
      velocitatX[i]=-velocitatX[i];
      R = R-100;
    }
    if (psY[i]>=height||psY[i]<=0) {
      velocitatY[i]=-velocitatY[i];
      mida=mida+1;

      R = B+100;
    }
}
}
void mousePressed(){
  G = random(255);
  B = random(255);
}
