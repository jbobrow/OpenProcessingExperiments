
//Informatica 2013/2014 - S3A_Dibuix Personatge Kerobero_Condicionals - Laura Freixas Conde//



//definicio variables enteres (no decimals)
int a;
int b;
int c;
int d;
int e;
int f;
int valor = 0;

//definicio variables amb valors decimals
float x = width/2;
float y = height/2;

float velX = 5;
float velY = 1;

float verm = 50;
float verd = 200;
float blau = 200;
float transp = 200;

float diam = 20;
float circumX = 100;
float circumY = 100;


void setup(){ // elements fixos

  noCursor(); //fa desapareixer el cursor de la pantalla
  size(1000,1000); //width es 1000 i height es 1000
  smooth();
  
  a=width/2; //a es el valor de la meitat de l'ample de la pantalla
  b=height/2; //b es el valor de la meitat de l'altura de la pantalla
  c=width/3; //c es el valor d'un ters de l'ample de la pantalla
  d=height/3; //d es el valor d'un ters de l'altura de la pantalla 
  e=width/4; //e es el valor d'un quart de l'ample de la pantalla
  f=height/4; //f es el valor d'un quart de l'altura de la pantalla
}


void draw(){
  
  //canviar la posicio del dibuix amb la velocitat
  x = x + velX;
  y = y + velY;
  
  
  if ((x + 260 > width) || (x < 0)){
    velX = - velX;
  }
  
  if ((y + 170 > height) || (y < 0)){
    velY = - velY;
  }
  
  
  background(valor); //el color del fons varia segons el clic del mouse, passant de blanc a negre i viceversa

  //canviar color de circumeferencies passatgeres en moviment amb valors random
  verm = random(255);
  verd = random(255);
  blau = random(255);
  transp = random(255);
  diam = random(100);
  circumX = random(width);
  circumY = random(height);
  
  //definicio dimensions circumferencies
  noStroke();
  fill(verm,verd,blau,transp);
  ellipse(circumX,circumY,diam,diam);


  //formes calideoscopiques dek fons
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
  ellipse(x-140,y,width/4.4,f);

  //orella interior esquerra
   fill(251,253,128);
  ellipse(x-150,y,width/6.1,height/5.3);

  //orella dreta
  fill(251,199,1);
  ellipse(x+140,y,width/4.4,f);

  //orella interior dreta
  fill(251,253,128);
  ellipse(x+150,y,width/6.1,height/5.3);

  //cara
  fill(251,199,1);
  ellipse(x,y,width/2.8,d);

  //boca 
  fill(255,113,128);
  ellipse(x,y+10,width/66.6,height/17.7);
  noStroke(); //sense linia de contorn
  fill(251,199,1);
  rect(x,y+17,width/66.6,-height/17.7);
  rect(x,y+17,-width/66.6,-height/17.7);
  
  //ull esquerre
  stroke(0);
  strokeWeight(width/500);
  fill(251,199,1);
  ellipse(x-120,y,width/57.1,height/114.2);
  noStroke();
  rect(x-130,y,width/40,height/114.2);

  //ull dret
  stroke(0);
  strokeWeight(width/500);
  fill(251,199,1);
  ellipse(x+120,y,width/57.1,height/114.2);
  noStroke();
  rect(x+110,y,width/40,height/114.2);

  //nas
  stroke(0);
  strokeWeight(width/500);
  fill(0);
  triangle(x-3,y+5,x+3,y+5,x,y+7); //parametres de posicio x1,y1,x2,y2,x3,y3 dels vertexs del triangle

  //llavi esquerre
  noFill();
  ellipse(x+4,y+15,width/100,height/160);
  fill(251,199,1);
  noStroke();
  rect(x,y+15,width/40,-height/177.7);

  //llavi dret
  stroke(0);
  strokeWeight(width/500);
  noFill();
  ellipse(x-4,y+15,width/100,height/160);
  fill(251,199,1);
  noStroke();
  rect(x,y+15,-width/40,-height/177.7);

  //galta esquerra
  stroke(0);
  strokeWeight(width/500);
  fill(194+mouseY,28+mouseX/2,42);
  ellipse(x-120,y+25,width/32,height/80);

  //galta dreta
  ellipse(x+120,y+25,width/32,height/80);
}


void mousePressed(){
  if (valor == 0) {
    valor = 255;
  } else {
    valor = 0;
  }
}



