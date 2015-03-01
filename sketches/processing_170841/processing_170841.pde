
float XXX; 

void setup (){
size (500,500);
rectMode (CENTER);
background (255);
noCursor();
XXX = 2*mouseX;
}// setup
void draw(){
background(0);
// x,y, sep, color
dibujaCuadrados (mouseX+ XXX, mouseY, mouseX+ 2,#254637*mouseY );
}//draw
void dibujaCuadrados (float x, float y, float sep, color c){
  fill (c);
rect (x, y, 50,50);
rect (x, y+ sep, 50,50);
rect (x+ sep, y, 50,50);
rect (x+ sep, y + sep, 50,50);
}


