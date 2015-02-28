
int colorR = 0;
int colorG=0;
int colorB=0;
int posicionx=0;
int posiciony=0;
int delineado=0;
int grosor =1;
boolean circulo= false;
PImage instru ; 
boolean yainicio= false;

void setup(){
size(1300,900);
background(0);
smooth();
rectMode(CENTER);
ellipseMode(CENTER);
frameRate(25);
instru =loadImage("instrucciones.jpg");
}

void draw(){
  if(!yainicio){
     image(instru,0,0,width,height);
     if (keyPressed){
         background(colorR,colorG,colorB);
        yainicio= true;}}
     
 if (yainicio==true){    
  float velocidad= abs(mouseX-pmouseX);
  colorR= (int( random(0,255)));
  colorG= (int( random(0,255)));
  colorB=  (int( random(0,255)));
  posicionx= (int( random(0,width)));
  posiciony= (int( random(0,height)));
  if (!circulo){
    strokeWeight(delineado);
     fill(colorR,colorG,colorB);  
     rect(posicionx,posiciony,20+velocidad,20+velocidad);}
  else{
    strokeWeight(delineado);
    fill(colorR,colorG,colorB);
    ellipse(posicionx,posiciony,20+velocidad,20+velocidad);}
  
  
 
if (mousePressed){
  background(colorR,colorB,colorG);
  if((mouseButton == LEFT)&& (delineado <20)){
    delineado= delineado + grosor;}
  if ((mouseButton == RIGHT)&&(delineado>0)){
    delineado= delineado - grosor;}
  if (mouseButton== CENTER){
    if (circulo){
      circulo= false;}
      else{
        circulo= true ;}
   
}}
if (keyPressed){
  if ((key=='f') || (key=='F')){
  
  delay(10000);
  save("mipicasso.jpg");
}
}
 }}



