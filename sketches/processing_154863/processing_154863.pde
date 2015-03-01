
float eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ;
float salto;

void setup(){
  size(500, 500, P3D);
  iniciarCamara(250.0,1120.0,523.0127,250.0,100.0,0.0,0.0,1.0,0.0);
  noSmooth();

}

void draw() {
  lights();
  background(75);

  camera(eyeX, eyeY,eyeZ, centerX, centerY,centerZ,upX, upY, upZ);
  
  translate(width/2, height/2 + 50, 0);

  rotate((frameCount%360) * TWO_PI/360);
  for(int k=0;k<8*50;k+=50){
    for(int i=-175;i<225;i+=50){
      for(int j=-200;j<200;j+=50){
        ponerCubo(i,j,k);
      }    
    }
  } 
}  
void iniciarCamara(float eX, float eY,float eZ,float cX,float cY,float cZ,float uX,float uY,float uZ){
  eyeX=eX;
  eyeY=eY;
  eyeZ=eZ;
  centerX=cX;
  centerY=cY;
  centerZ=cZ;
  upX=uX;
  upY=uY; 
  upZ=uZ;
  salto=30;  
}

void ponerCubo(int x,int y, int z){
  pushMatrix();
  translate(x,y,z);
  box(40);  
  popMatrix();  
}

