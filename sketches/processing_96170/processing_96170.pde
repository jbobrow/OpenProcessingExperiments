
float a;
float b;
float c=200;
float d=0;
float x;
float y;
float e;
float r;
float f;
float g;
float h;
float i=0;
float j=0;
PImage img;
PImage img1;
//primer he definit les diferents variables que he elegit//


void setup(){
  size(500,500);


  img=loadImage("green_grass.jpg");
  img1=loadImage("raices1.jpg");//he definit la posicio del fitxer a la carpeta//
}


void draw(){

  image(img,i,j,width,height-200);
  image(img1,i,height-200,width,height);//indico la posicio dins del dibuix//
  noCursor();
  a=mouseX; 
  x=mouseX;//defineixo la posició d'aquestes variables que es la de la posició del cursor//

fill(255,167,33);
ellipse(a,285,30,30);
fill(0,14,255);
ellipse(c,d,10,10);
ellipse(e,f,10,10);
ellipse(g,h,10,10);//he dibuixat i pintat els cercles//

if (d>290){
  d=0;
  c=random(width);
}

if (f>290){
  f=0;
  e=random(width);
}

if (h>290){
  h=0;
  g=random(width);
}//quan la bola arriba a y=290, dic que torni a la posició y=0 i x a una posició aleatoria i ho he definit als tres cercles//
if (dist(g,h,a,285)<20){
  noLoop();
}

if (dist(e,f,a,285)<20){
  noLoop();
}

if (dist(c,d,a,285)<20){
  noLoop();
}//he fet que quan el radi de la circumferència gran i el de la petita siguin la suma d'aquets dos pari de repetir-se la aciió//

  d=d+10;
  f=f+10;
  h=h+10;//aqui decideixo la velocitat dels cercles petits//
}
void mousePressed() {
  d=0;
  f=0;
  h=0;
  loop();
  //faig que quan apretis el botó del cursor, les y de les tres circumferències sigui 0//
}



