
/*
Futurismo 16a

A simple sketch inspired by:
http://www.flickr.com/photos/simoncpage/4285309163/in/set-72157623099901702/lightbox/

Made by @ramayac
*/
 
void setup(){
  size(350, 500);
  smooth();
  
  noLoop();
}
 
void draw(){
  background(#182C4A);
 
  stroke(255);
  text("FUTURISM", 240, 171);
  noStroke();
 
  float x1, y1, anch, alt;
  x1 = 50; y1 = 200; anch = 250; alt = 250;
  
  cuadro(x1, y1, anch, alt);
  cuadro(x1+anch*.50, y1+anch*.50, anch/2, alt/2);
  cuadro(x1+anch*.748, y1+anch*.748, anch/4, alt/4);
  cuadro(x1+anch*.872, y1+anch*.875, anch/8, alt/8);
   
}
 
void cuadro(float x1, float y1, float ancho, float alto){
   
  float x2 = ancho/4;
   
  fill(#BDB6A5);
  rect(x1, y1, x2, alto);
  fill(#7B797B);
  rect(x1+x2, y1, x2, alto);
  fill(#5A5D6B); 
  rect(x1+x2*2, y1, x2, alto);
  fill(#42495A);
  rect(x1+x2*3, y1, x2, alto);
}

