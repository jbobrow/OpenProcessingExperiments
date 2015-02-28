
float posX=random(800);
float posY=random(600);
float sentidoX=4;
float sentidoY=8;
int buenas=0;
int malas=0;
void setup() {
  size (800,600);
  background (100,230,200);
}
void draw () {
  background (100,230,200);
  fill (50,20,100);
 
rect (mouseX,height-20,150,20);
fill (50,50,150);
ellipse (posX,posY,30,30);
posY=posY+sentidoY;
posX=posX+sentidoX;
 
if (posY>=height-30) {
  sentidoY= -sentidoY;
  float distancia = abs (mouseX-posX);
  if (distancia<=100) buenas= buenas+1;
  else malas=malas+1;
   
}
if (posY-30<= 0) {
  sentidoY=-sentidoY;
}
if (posX >= width -30) {
sentidoX =-sentidoX;
 
}
if (posX-30 <= 0) {
  sentidoX=-sentidoX;
}
text ("Score",10,10);
text ("Buenas"+ buenas,10,20);
text ("Malas" + malas,10,30);
 
}

