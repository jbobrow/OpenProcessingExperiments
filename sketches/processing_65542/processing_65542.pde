
float x1f;  
float x2f;  
float y1f;  
float y2f;
float x1g;  
float x2g;  
float y1g;  
float y2g;
float x1h;  
float x2h;  
float y1h;  
float y2h;
float x1i;  
float x2i;  
float y1i;  
float y2i;
float var1; 
float var2; //factor de variabilidad de posición (RANDOM)
float var3; 
float var4; //factor de variabilidad de posición (RANDOM)
float var5; 
float var6; //factor de variabilidad de posición (RANDOM)
float var7; 
float var8; //factor de variabilidad de posición (RANDOM)


float puntoRaro1;
float puntoRaro2;
float puntoRaro3;
float puntoRaro4;
float strkW;
float sR; 
float sG; 
float sB; 
float sA;//Variacion de grosor y color del stroke
int x; 
int y; //posicion del cusror, apra rotación
float tetha; 
float tethaRad;// variables de rotación //NEW!!
float fckinRandom;
void setup() {
  size(720, 480);/**/
  background(255);/**/
  frameRate(120);/**/
  smooth();
}
void draw() {//-------------------
  puntoRaro1=random(0, width*3);
  puntoRaro2=random(0, width*3);
  puntoRaro3=random(0, width*3);
  puntoRaro4=random(0, width*3);

  //colores random de inicio

  sR=random(24, 86);
  sG=random(16, 160);
  sB=random(0, 60);
  sA=random(29, 255);
  //rectMode(CENTER);
  fill(255, 255, 255, 14);
  rect(-100, -100, 1000, 1000);
  fckinRandom= random(255, 900);
  x = mouseX; 
  y = mouseY;
  tetha = -fckinRandom * 360/width;
  tethaRad = radians(tetha);
  ////balbalbalb
  stroke(sR, sG, sB, 255);  //grosor etc 
  strokeWeight(strkW);
  strkW=random(1, 3);
  //balba  
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(-tethaRad);
  //balba
  //ver-met-hor
  x1f=puntoRaro4;
  x2f=puntoRaro3;
  y1f=0+var1;
  ;
  y2f=0+var2;
  //ver-met-hor
  x1g=puntoRaro1;
  x2g=puntoRaro2;
  y1g=0+var3;
  ;
  y2g=0+var4;
  //ver-met-hor
  x1h=puntoRaro2;
  x2h=puntoRaro3;
  y1h=0+var5;
  ;
  y2h=0+var6;
  //ver-met-hor
  x1i=puntoRaro3;
  x2i=puntoRaro1;
  y1i=0+var7;
  ;
  y2i=0+var8;
  //variacion de posición
  var1=random(-23, 23);
  var2=random(-23, 23);
  var3=random(-23, 23);
  var4=random(-23, 23);
  var5=random(-23, 23);
  var6=random(-23, 23);  
  var7=random(-23, 23);
  var8=random(-23, 23);
  //el dibujo
  line(x1f, y1f, x2f, y2f);
  line(x1g, y1g, x2g, y2g);
  line(x1h, y1h, x2h, y2h);
  line(x1i, y1i, x2i, y2i);

  popMatrix();//regresa la matriz a 0, creo..
}//------------------------------


