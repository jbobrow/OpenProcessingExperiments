
//S4_KeroberoBucles _ Laura Freixas 2n GEDI 03
//L'objectiu d'aquest programa es moure el personatge principal (Kerobero) i una serie de repeticions d'aquest personatge per tota la pantalla  
//amb la funcio randomWalker de forma que vibrin, ja que els valors que prenen son el mateixos en x que en y, pero cada vegada en una direccio aleatoria diferent



//creacio matriu de 7 walkers
Walker [] KEROBEROwkrs = new Walker [7];

//definicio variables enteres (no decimals)

//definicio variables enteres (no decimals)
int a;
int b;
int c;
int d;
int e;
int f;
int valor = 0;
int numKerobero = 7;
int keroberoMouse;
int mX, mY;

//definicio variables amb valors decimals
float x;
float y;
 
float velX = 5;
float velY = 1;
 
float verm = 50;
float verd = 200;
float blau = 200;
float transp = 200;
 
float diam = 20;
float circumX = 100;
float circumY = 100;
 
 
void setup(){ // inicialitzacio
 
  noCursor(); //fa desapareixer el cursor de la pantalla
  size(1000,1000); //width es 1000 i height es 1000
  smooth();
  
   //definicio variables amb valors decimals
 x = width/2;
 y = height/2;
  a=width/2; //a es el valor de la meitat de l'ample de la pantalla
  b=height/2; //b es el valor de la meitat de l'altura de la pantalla
  c=width/3; //c es el valor d'un ters de l'ample de la pantalla
  d=height/3; //d es el valor d'un ters de l'altura de la pantalla
  e=width/4; //e es el valor d'un quart de l'ample de la pantalla
  f=height/4; //f es el valor d'un quart de l'altura de la pantalla
  
  //inicialitzacio de cada walker (definicio parametres step i dimensions x, y)
  for (int i = 0; i < KEROBEROwkrs.length; i++){
    KEROBEROwkrs[i] = new Walker (3, mX, mY);   
 }
}

 
void draw(){

  background(valor); //el color del fons varia segons el clic del mouse, passant de blanc a negre i viceversa
 
  //canviar color de circumeferencies passatgeres en moviment amb valors random
  verm = random(255);
  verd = random(255);
  blau = random(255);
  transp = random(255);
  diam = random(100);
  circumX = random(width);
  circumY = random(height);
  
  //execucio dels elements walkers
  for (int i = 0; i < KEROBEROwkrs.length; i++){
    KEROBEROwkrs[i].run();   
  }
}
  
  //realitzacio de la classe walker
  class Walker{
    //definicio variables
    int mSzX, mSzY, mStep;
    float mX, mY;
    
    //constructor
    Walker (int _st, int _szX, int _szY) {
      mStep = _st;
      mSzX = _szX;
      mSzY = _szY;
      mX = width/2;
      mY = height/2;
    }
  
  //definicio funcio equivalent a draw per contenir tots els elements que formen el personatge Kerobero
  void run (){
    updatePosition();
    drawMe();
  }
  
  //definicio posicions
  void updatePosition(){
    
    //definicio d'un random per cada direccio 
    float randX = random (100);
    float randY = random(100);
    
    if (randX >= 50){
      mX += mStep;
    }
    
    else{
      mX -= mStep;
    }
    
    if (randY >= 50){
      mY += mStep;
    }
    
    else{
      mX -= mStep;
    }
    
    //definicio de limits de pantalla per evitar que els personatges surtin de la finestra
    mX = constrain (mX, 0, width);
    mY = constrain (mY, 0, height); 
  }
  
    
  void drawMe(){
  KEROBERO (mX,mY);
  }

void KEROBERO (int mX, int mY){  
  
  //definicio dimensions circumferencies fons que van passant (en moviment)
  noStroke();
  fill(verm,verd,blau,transp);
  ellipse(circumX,circumY,diam,diam);
 
 
  //formes calideoscopiques del fons (fixes)
  stroke(0); //color linia negre
  strokeWeight(width/1000); //gruix de la linia en funcio de l'amplada de la pantalla dividit entre 1000
  fill(mouseY,mouseY,mouseX,mouseX); //canvi de color segons la posicio del mouse en x i y
   
  ellipse(a,f,mouseX+5,mouseX+5); //x1=coordenada x de posicio respecte l'ample de pantalla, y1=coordenada y de posicio respecte l'altura de pantalla, x2=dimensio ellipse en la direccio x, y2=dimensio ellipse en la direccio y
  ellipse(e,height/4*2,mouseX+5,mouseX+5);
  ellipse(width/4*3,height/4*2,mouseX+5,mouseX+5);
  ellipse(a,height/4*3,mouseX+5,mouseX+5);
   
  ellipse(a,b,mouseX-50,mouseX-50);
  ellipse(c,d,mouseX+10,mouseX+10);
  ellipse(width/3*2,d,mouseX+10,mouseX+10);
  ellipse(c,height/3*2,mouseX+10,mouseX+10);
  ellipse(width/3*2,height/3*2,mouseX+10,mouseX+10);
   
  fill(mouseX,mouseX,mouseY,mouseY);
  ellipse(a,b,a,b);
  noFill(); //entitat sense color de fons
  ellipse(a,b,mouseX+100,mouseX+100);
  fill(valor);
  ellipse(a,b,a-400,b-400);
 
 
  //dibuix personatge per parts:
   
  //orella esquerra
  strokeWeight(width/500);//gruix de la linia en funcio de l'amplada de la pantalla dividit entre 500
  fill(251,199,1); //valors paleta de colors separats per r+g+b
  ellipse(mX-140,mY,width/4.4,f);
 
  //orella interior esquerra
   fill(251,253,128);
  ellipse(mX-150,mY,width/6.1,height/5.3);
 
  //orella dreta
  fill(251,199,1);
  ellipse(mX+140,mY,width/4.4,f);
 
  //orella interior dreta
  fill(251,253,128);
  ellipse(mX+150,mY,width/6.1,height/5.3);
 
  //cara
  fill(251,199,1);
  ellipse(mX,mY,width/2.8,d);
 
  //boca
  fill(255,113,128);
  ellipse(mX,mY+10,width/66.6,height/17.7);
  noStroke(); //sense linia de contorn
  fill(251,199,1);
  rect(mX,mY+17,width/66.6,-height/17.7);
  rect(mX,mY+17,-width/66.6,-height/17.7);
   
  //ull esquerre
  stroke(0);
  strokeWeight(width/500);
  fill(251,199,1);
  ellipse(mX-120,mY,width/57.1,height/114.2);
  noStroke();
  rect(mX-130,mY,width/40,height/114.2);
 
  //ull dret
  stroke(0);
  strokeWeight(width/500);
  fill(251,199,1);
  ellipse(mX+120,mY,width/57.1,height/114.2);
  noStroke();
  rect(mX+110,mY,width/40,height/114.2);
 
  //nas
  stroke(0);
  strokeWeight(width/500);
  fill(0);
  triangle(mX-3,mY+5,mX+3,mY+5,mX,mY+7); //parametres de posicio x1,y1,x2,y2,x3,y3 dels vertexs del triangle
 
  //llavi esquerre
  noFill();
  ellipse(mX+4,mY+15,width/100,height/160);
  fill(251,199,1);
  noStroke();
  rect(mX,mY+15,width/40,-height/177.7);
 
  //llavi dret
  stroke(0);
  strokeWeight(width/500);
  noFill();
  ellipse(mX-4,mY+15,width/100,height/160);
  fill(251,199,1);
  noStroke();
  rect(mX,mY+15,-width/40,-height/177.7);
 
  //galta esquerra
  stroke(0);
  strokeWeight(width/500);
  fill(194+mouseY,28+mouseX/2,42);
  ellipse(mX-120,mY+25,width/32,height/80);
 
  //galta dreta
  ellipse(mX+120,mY+25,width/32,height/80);
  }
}
 
  
void mousePressed(){
  if (valor == 0) {
    valor = 255;
  } else {
    valor = 0;
  }
}




