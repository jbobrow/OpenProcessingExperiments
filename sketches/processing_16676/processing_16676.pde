
int v=0;
int x=0;
int y=0;
int p =8;
void setup(){
size(600,438);
frameRate(15);
}

void draw(){
  PImage img;
  img = loadImage("SI_Bilbao.jpg");
  image(img, 0, 0,600,438);
  fill(0);
  noStroke();
  //tapo el invader original (hide original invader)
  quad(317,34,412,110,406,331,315,233);
  pushMatrix();
  translate(x,y);
//CUERPO ROJO  (red body)
  fill(214,1,18);
  stroke(214,75,75);
  pix(1,0,4,1,p);
  pix(-1,2,8,2,p);
  pix(-1,3,10,3,p);
  for (int f=4;f<=6;f++){
    pix(-1,4,12,f,p);}
  for (int f=7;f<=8;f++){
    pix(-1,5,14,f,p);}
  pix(-1,4,12,9,p);

//patita 1 (leg 1)
  pix(-1,3,2,10,p);
  pix(-1,4,3,11,p);
  pix(-1,5,3,12,p);  
  pix(-1,6,4,13,p);
  pix(-1,6,2,14,p);
//patita 2 (leg 2)
  pix(1,1,2,10,p);
  pix(1,1,2,11,p);
  pix(1,0,3,12,p);
  pix(-1,1,3,13,p);
  pix(-1,1,2,14,p);  
//patita 3 (leg 3)
  pix(1,4,3,10,p);
  pix(1,4,2,11,p);  
  pix(1,4,4,12,p);
  pix(1,4,4,13,p);
  pix(1,4,2,14,p);

//OJITOS BLANCOS (white part of the eyes)
  fill(255);
  stroke(240);
  pix(-1,3,2,4,p);
  for (int f=5;f<=7;f++){
    pix(-1,4,4,f,p);}
  pix(-1,3,2,8,p);
  pix(1,3,2,4,p);
  for (int f=5;f<=7;f++){
    pix(1,2,4,f,p);}
  pix(1,3,2,8,p);
//OJITOS AZUL (blue part of the eyes)
  fill(18,57,126);
  stroke(18,100,126);  
  pix(-1,4,2,6,p);
  pix(-1,4,2,7,p);
  pix(1,2,2,6,p);
  pix(1,2,2,7,p);
  popMatrix();
  v++;
  if (v<=7){x-=25;y-=10;} else {y+=30;} //empieza a caer (starts falling)
  if (y>=height){x=0;y=0;v=0;} // vuelve al origen (restarts)
  }
// funcion para dibujar los pixeles (function to draw pixels)  
void pix(int d,int pos,int cant, int fila, int p){
  for (int c=0;c<=cant-1;c++){
  rect(335+d*pos*p+p*c,120+(fila-1)*p,p,p);}}
  
// todavia le hacen falta mejoras....still need improvements
//inspired by Space Invaders: http://www.space-invaders.com/som.html
// basado en SpaceInvaders http://www.flickr.com/photos/50ftw/5230869814/  



