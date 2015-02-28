


// - - -  VARIABLES - - -  //


float posX= 100;
float posY= 150;

float velocidadX = 1.2;
float velocidadY = 1.2;


float posX2= 100;
float posY2= 150;

float velocidadX2 = 1.5;
float velocidadY2 = 1.5;


float posX3= 100;
float posY3= 150;

float velocidadX3 = 2;
float velocidadY3 = 2;

float posX4= 100;
float posY4= 150;

float velocidadX4 = 2.5;
float velocidadY4 = 2.5;

float posX5= 100;
float posY5= 150;

float velocidadX5 = 3;
float velocidadY5 = 3;

PFont miTexto;



String variables= "INK";
String variables2= "AS";
String variables3= "A";
String variables4= "TESLA";
String variables5= "MACHINE";


String [] verdades= split (variables," ");
String [] verdades2= split (variables2," ");
String [] verdades3= split (variables3," ");
String [] verdades4= split (variables4," ");
String [] verdades5= split (variables5," ");



// SETUP

void setup () {
  size (800,600);
  smooth();
  background (255);
  
  
  
 
  


  //Crear la fuente
  miTexto = loadFont ("AppleTree-48.vlw");
}


// - - - - - - - - DRAW - - - - - - - //

void draw (){
  
  posX = posX + velocidadX;
  posY = posY + velocidadY;

textFont(miTexto);
fill(random(120));
  text(verdades [frameCount %verdades.length ], posX, posY);

  
  
   posX2= posX2 + velocidadX2;
  posY2 = posY2 + velocidadY2;

textFont(miTexto);
fill(random(160));
  text(verdades2 [frameCount %verdades2.length ], posX2, posY2);
  
  
  
   posX3= posX3 + velocidadX3;
  posY3 = posY3 + velocidadY3;

textFont(miTexto);
fill(random(320));
  text(verdades3 [frameCount %verdades3.length ], posX3, posY3);
  
  
  
  
   posX4= posX4 + velocidadX4;
  posY4 = posY4 + velocidadY4;

textFont(miTexto);
fill(random(640));
  text(verdades4 [frameCount %verdades4.length ], posX4, posY4);
  
  
  
  
     posX5= posX5 + velocidadX5;
  posY5 = posY5 + velocidadY5;

textFont(miTexto);
fill(random(1280));
  text(verdades5 [frameCount %verdades5.length ], posX5, posY5);
  
  
  
  
  if (posX >width) {
    velocidadX = -1;
  }
  
  if (posX <0) {
    velocidadX=1;
  }
  
   if (posY > height ) {
  velocidadY = -1;
  }  
 
 
  
  if (posY < 0 ) {
  velocidadY=1;
  }
  
  
  
  
  //
  
   
  if (posX2 >width) {
    velocidadX2 = -1;
  }
  
  if (posX2 <0) {
    velocidadX2=1;
  }
  
   if (posY2 > height ) {
  velocidadY2 = -1;
  }  
 
 
  
  if (posY2 < 0 ) {
  velocidadY2=1;
  }
  
  
  
  //
  
   
  if (posX3 >width) {
    velocidadX3 = -1;
  }
  
  if (posX3 <0) {
    velocidadX3=1;
  }
  
   if (posY3 > height ) {
  velocidadY3 = -1;
  }  
 
 
  
  if (posY3 < 0 ) {
  velocidadY3=1;
  }
  
  //
  
   
  if (posX4 >width) {
    velocidadX4 = -1;
  }
  
  if (posX4 <0) {
    velocidadX4=1;
  }
  
   if (posY4 > height ) {
  velocidadY4 = -1;
  }  
 
 
  
  if (posY4 < 0 ) {
  velocidadY4=1;
  }
  
  
  //
  
   
  if (posX5 >width) {
    velocidadX5 = -1;
  }
  
  if (posX5 <0) {
    velocidadX5=1;
  }
  
   if (posY5 > height ) {
  velocidadY5 = -1;
  }  
 
 
  
  if (posY5 < 0 ) {
  velocidadY5=1;
  }
  
  
  
  //
  }  
 

  
  

