
float posX=random(300);
float posY=random(700);
float sentidoX=4;
float sentidoY=8;
int buenas=0;
int malas=0;
void setup() {
  size (800,400);
  background (235,252,5);
}
void draw () {
  background (235,252,5);
  fill (99,19,206);

rect (mouseX,height-10,100,10);
fill (252,5,142);
ellipse (posX,posY,50,50);
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
