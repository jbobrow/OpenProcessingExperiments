
//introduim les variables enteres
//int r = 20;
int numeroBoles = 100;

//Dones valors nous a x,y,vx,vy per a cada bola nova creada
float[] x = new float[numeroBoles];
float[] y = new float[numeroBoles];
float[] vX = new float[numeroBoles];
float[] vY = new float[numeroBoles];
float[] r = new float[numeroBoles];
float[] c1 = new float[numeroBoles];
float[] c2 = new float[numeroBoles];
float[] c3 = new float[numeroBoles];
 
void setup(){
//donem una mida al dibuix
  size(600,600);
//Quan hi hagi entre 0 i 99 boles, afegeix boles
  for(int i = 0; i<numeroBoles; i++){
//afegeixles al punt x=0 i y=0
    x[i] = 0;
    y[i] = 0;
//amb velocitats entre 1 i 10
    vX[i] = random(1,10);
    vY[i] = random(1,10);
//radis de pilotes entre 10 i 20
    r[i] = random (10,20);
//color de boles random
    c1[i] = random (0,256);
    c2[i] = random (0,256);
    c3[i] = random (0,256);
  }
}
 
void draw(){
//Color del fons
background(1);
//Quan i valgui entre 0 i 99, a x sumali vx i a y sumali vy 
  for(int i = 0; i<numeroBoles; i++){
    x[i] += vX[i];
    y[i] += vY[i];

//Quan toqui en limits de x, canvia de signe vx 
    if((x[i]<0)||(x[i]>width-(r[i]/2))){
      vX[i] = -vX[i];
    }
//Quan toqui en limits de y, canvia de signe vy
    if((y[i]<0)||(y[i]>height-(r[i]/2))){
      vY[i] = -vY[i];
    }
  }
//Dibuixa les boles 
  for(int i = 0; i<numeroBoles; i++){
    //Amb colors random
    fill(c1[i],c2[i],c3[i]);
    ellipse(x[i],y[i],r[i],r[i]);
  }
}
