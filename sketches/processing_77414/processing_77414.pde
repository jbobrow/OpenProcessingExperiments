
float posX=random(400);
float posY=random(600);
 
float sentidoX=4;
float sentidoY=8;
 
int buenas=0;
int malas= 0;
 
void setup(){
size(600,400);
background(38,180,39);
}
 
void draw (){
background(38,180,39);
fill(30,146,232);
rect (mouseX-50, height-10, 100,10);
fill(211,21,199);
ellipse (posX,posY,60,60);
 
posY=posY+sentidoY;
posX=posX+sentidoX;
 
if(posY>height-30){
sentidoY=-sentidoY;
float distancia=abs (mouseX-posY);
if  (distancia<=100) buenas=buenas+1;
else malas=malas+1;
 
}
 
if(posY-30<=0){
sentidoY=-sentidoY;
}
 
if(posX>=width-30){
sentidoX=-sentidoX;
}
if(posX-30<=0){
sentidoX=-sentidoX;
}
 
text("Buenas: "+buenas,10,20);
text("Malas: "+malas,10,30);
}
