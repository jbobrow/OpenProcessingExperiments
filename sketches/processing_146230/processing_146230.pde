

int a=280;
int b=280;
int i;
int sols =10;

//MATRIU DE POSICIONS DELS SOLS
float[]posX = new float [sols];
float[]posY = new float [sols];

//MATRIU DELS COLOR
color[] colorUll = new color [20];

void setup(){
  size(560,560);
  println("SOLS EN MOVIMENT");
  println("GUILLEM DE JUAN BERTOMEU 2n GEDI G03");
  noCursor();
  for(int i=0;i<sols; i++){
    posX[i] = (posX[i])+(int)random(a,b);
    posY[i] = (posY[i])+(int)random(a,b);
    colorUll[i] = color(random(255),random(255),random(255));
  }
}


void draw(){
  background(34+mouseX/4,64+mouseX/4,156+mouseX/4);
  noStroke();
  
  for(int i=0; i<sols; i++){
    // REDETMINACIÓ POSICIONS INICIALS
    posX[i] += random(-5,5);
    posY[i] += random(-5,5);
    
    // POSEM ELS LÍMITS
    if(posX[i]<a/4){
         posX[i] = a/4;
    }
    if(posX[i]>width-a/4){
      posX[i] = width-a/4;
    }
     
     if(posY[i]<b/4){
      posY[i] = b/4;
    }
    if(posY[i]>height-b/4){
      posY[i] = height-b/4;
    }

//DIBUIX
  // CERCLE 1
  fill(253,243,6);
  ellipse(posX[i],posY[i],a/2,b/2);  
  // CERCLE 2
  fill(51,185,72);
  ellipse(posX[i],posY[i],a*3/7,3*b/7);
  //CERCLE 3
  fill(230,89,35);
  ellipse(posX[i],posY[i],a*11/28,11*b/28);
  //CERCLE 4
  fill(253,243,6);
  ellipse(posX[i],posY[i],a/2.8,b/2.8);
  
  //UllS, BOCA I NAS
  rectMode(CENTER);
  fill(230,89,35); //TARONJA
  ellipse(posX[i]+2.5*a/28,posY[i]-b/28,a/10,b/10);
  ellipse(posX[i]-2.5*a/28,posY[i]-b/28,a/10,b/10);
  ellipse(posX[i],posY[i]+b/140,a/35,b/35);
  rect(posX[i],posY[i]+b/13,a/7.5,b/15);//BOCA
  ellipse(posX[i]-a/15,posY[i]+b/13,a/15,b/15);
  ellipse(posX[i]+a/15,posY[i]+b/13,a/15,b/15);
  fill(253,243,6); //GROC
  ellipse(posX[i]+2.5*a/28,posY[i]-b/32,a/10,b/10);
  ellipse(posX[i]-2.5*a/28,posY[i]-b/32,a/10,b/10);
  ellipse(posX[i],posY[i]+b/160,a/40,b/40);
  fill(colorUll[i]); //COLOR D'ULLS
  ellipse(posX[i]+2.5*a/28,posY[i]-b/35,a/15,b/15);
  ellipse(posX[i]-2.5*a/28,posY[i]-b/35,a/15,b/15);
  
  }  
}
//CANVI DE PARÁMETRES AMB LA FUNCIÓ MOUSE PRESSED
  void mousePressed(){
  float posX, posY, velX, velY;

  //CANVI DE POSICIÓ
  posX=width/2;
  posY=height/2;
  
  //CANVI DE VELOCTIAT
  velX = random(1,5);
  velY = random(1,5);
  
  //CANVI DE MIDA
  if (a == width/2) {
    a = width/4;
  } else {
    a = width/2;
  }
 
  if (b == height/2) {
    b = height/4;
  } else {
    b = height/2;
  }
  }


