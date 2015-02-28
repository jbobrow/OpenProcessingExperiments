

class Cercle {  //nom de la classe
 
 float x; 
 float y;
 float vx;
 float vy;
 color c;
 
 Cercle (color c, float x, float y, float vx, float vy){ 
  this.x=x;
  this.y=y;
  this.vx=vx;
  this.vy=vy;
  this.c = c;
  
}

void update ( ) { //declaration d'une fonction
 
fill (c);
x = x + vx;
y = y + vy;
ellipse (x , y , 50 , 50);
fill(255);
text("Score : " + score, 285, 20);
//rebond droit
if (x >= 375) {
 vx = -vx;  
}
//rebond gauche
if (x <= 25) {
 vx = -vx;  
}
//rebond bas
if (y >= 355) {
 vy = -vy;  
}
//rebond haut
if (y <= 25) {
 vy = -vy;
}
}
}



