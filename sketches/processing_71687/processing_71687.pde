
// Armando Rocha

PFont Letra1, Letra2;
 
int i=65;
int k=97; 
int ancho=0;

void setup(){
   
  size(800, 260);
  smooth();
  background(0);
  frameRate(6);
  Letra1 = createFont("Algerian",30);    // crear letra1
  Letra2 = createFont("Brush Script MT",40);  // crear letra2
}
void draw(){
 
 fill(0,255,255);
 if (i<=90)
 {
   textFont(Letra1);
   text(char(i),ancho, 60);
 }
 if(k<=122)
 {
  textFont(Letra2);
  text(char(k),ancho,120);
 }
 i++;
 k++;
 ancho+=30;
}
