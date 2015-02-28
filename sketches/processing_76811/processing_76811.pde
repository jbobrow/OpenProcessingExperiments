
//AUTOR: ARANTXA PAVIA LOPEZ DE FELIPE
int fondo=(#FFFFFF);

 void setup(){

   //CARA
size(300,400);
smooth();
 }
 


void draw(){

  


  background(119,245,168);
  if (mousePressed){
     background(224,41,87);
  }
//CONTORNO

fill (245,186,124);
ellipse (100,100,299,399);
 
//OJOS
//IZQUIERDO
fill(214,246,255);
ellipse (80,100,100,100);
fill(0,0,0);
rect(100,90,30,mouseY/15);
if (mousePressed){
fill(74,234,43);
ellipse (80,100,100,100);
fill(108,19,113);
rect(100,90,30,mouseY/15);
}
 
//DERECHO
fill(214,246,255);
ellipse (210,100,100,100);
fill(0,0,0);
rect(230,90,30,mouseX/15);
fill(0,255,0);
 if (mousePressed){
 fill(254,255,18);
ellipse (210,100,100,100);
fill(255,133,18);
rect(230,90,30,mouseX/15);
fill(0,255,0);
 }
//CEJAS

fill(100,22,22);
//IZQUIERDA
rect(20,20,100,20);
//DERECHA
rect(160,20,100,20);
 
//NARIZ
stroke(167,102,17);
fill (245,187,111);
arc(150,190,80,80,3.14,6.28);
 

 
 
//BOCA
fill (255,0,0);
ellipse(150,250,80,80);
fill (0,0,0);
ellipse(150,250,70,70);

   //MICROFONO
 fill(255,255,255);
rect(mouseX-30,mouseY-20,10,100);
fill(255,0,0);
ellipse(mouseX-25,mouseY-15,50,50);
if (mousePressed){
  fill(234,43,216);
  rect(mouseX-30,mouseY-20,10,100);
  fill(0);
  ellipse(mouseX-25,mouseY-15,50,50);
}
}
void mousePressed(){


}
  void mouseReleased(){



  }


