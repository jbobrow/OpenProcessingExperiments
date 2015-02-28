
//Autor: Sergio.S.

//variables
int i = 0;
int a = 0;
PFont  fontA;
//fondo
void setup (){
size (300,200);
noStroke();
smooth ();
}

//animación
void draw(){
  background (random(0));
  int i = 0;
  while (i < 300){
    fill (random(mouseX));
    rect (i,0,9,300);
    i = i + 10;
    // cara
noStroke();
fill(0);
fill(0,0,0,mouseX-1);
rect (79,175,145,50);
stroke(0);
fill(255,255,255,mouseX-1);
rect (125,150,50,25);
stroke(0);
ellipse (150,100,100,125);
rect (127,175,45,25);
fill(255,0,0,mouseX-1);
rect(141,175,15,45);
}
//pantalla Game Over
if (mousePressed){
  background (0);
  fontA = loadFont("CourierNewPS-BoldMT-36.vlw");
textFont (fontA, 36);
fill(255);
  text ("Game Over",50,70);
  textFont (fontA, 18);
  text ("pages colllected 2/8",45, 110);
  noLoop();
      }
    }



