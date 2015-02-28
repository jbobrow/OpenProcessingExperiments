
void setup () {
  size (400,400);
  rectMode (CENTER);

background (200);}

void draw () {

if (mousePressed){ // gibt Konditionen an, was passiert wenn Maus gedrückt
  fill (255,0,0);
  rect (mouseX,mouseY, 50,50);
}else{
  fill (0,250,0);
  ellipse(mouseX,mouseY, 50,50);
}}
