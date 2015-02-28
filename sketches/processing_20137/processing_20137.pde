
int elementos;
int[] posX;
int[] posY;
float[] velX;
float[] velY;
int[] r;
int[] g;
int[] b;
boolean direccion=true;
int maxY = 20;
float gravedad = 0.1;
int friccion = 1;

void setup() {

  elementos=1;

  size(400,400);
  background(0);

  posX=new int[elementos];
  posY=new int[elementos];
  velX=new float[elementos];
  velY=new float[elementos];
  r=new int[elementos];
  g=new int[elementos];
  b=new int[elementos];

  for(int i=0;i<elementos;i++) {
    posX[i]=(int)random(17,width-16);
    posY[i]=(int)random(17,width-16);
    velX[i]=-3+random(6);
    velY[i]=-random(4);
    r[i]=(int)random(255);
    g[i]=(int)random(255);
    b[i]=(int)random(255);
  }

  for(int i=0;i<elementos;i++) {
    if(i % 2 == 0) {
      velX[i]*=-1;
    }
    else {
      velX[i]*=1;
    }

    if(i % 2 == 0) {
      velY[i]*=-1;
    }
    else {
      velY[i]*=1;
    }
  }
}


void draw () { 

  noStroke();
  fill(0,50);
  rect(0,0,width,height);

  strokeWeight(1.5);
  noFill();

  for(int i=0;i<elementos;i++) { 

    stroke(r[i],g[i],b[i]);
    ellipse(posX[i],posY[i],30,30);

    if(posX[i]+15>=width||posX[i]-15<=0) {
      velX[i]*=-1;
    }

    if(posY[i]+15>=height) {
      velY[i]*=-1;
      if(posY[i] + 15 - height >= 0.15){
        posY[i] = height - 15;        
        if(velY[i] >-3){
          velX[i]*= 0.96;
        }
      }
    }

    if((velY[i]<maxY)){
      velY[i] += gravedad;
    }
    velY[i]*=friccion;
    posX[i]+=velX[i];
    posY[i]+=velY[i];
 
  }

}

void mousePressed() {

if(elementos <= 80){

  elementos*=2;

  for(int i=0;i<elementos;i++) {
    posX[i]= mouseX;
    posY[i]= mouseY;
    velX[i]=-3+random(6);
    velY[i]=-random(4);
    r[i]=(int)random(255);
    g[i]=(int)random(255);
    b[i]=(int)random(255);
  } 

  if(direccion==true) {
    direccion=false;
    for(int i=0;i<elementos;i++) {
      if(i % 2 == 0) {
        velX[i]*=-1;
      }
      else {
        velX[i]*=1;
      }

      if(i % 2 == 0) {
        velY[i]*=-1;
      }
      else {
        velY[i]*=1;
      }
    }
  }
   
  else if(direccion==false) {
    direccion=true;
    for(int i=0;i<elementos;i++) {
      if(i % 2 == 0) {
        velX[i]*=-1;
      }
      else {
        velX[i]*=1;
      }

      if(i % 2 == 0) {
        velY[i]*=-1;
      }
      else {
        velY[i]*=1;
      }
    }
  }
  
  }
}              
                                                                                                                                                                                                                
