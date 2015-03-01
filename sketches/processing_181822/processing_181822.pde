
/* Precarga de imágenes */
  /* @pjs preload= "MCDONALDS.png" */


void setup() {
  size(255, 255);
  noCursor();
}

void draw() {

 
  float mida = 5;
scale(2);
noStroke();



pushMatrix();
translate(-30,0);


//LLAVI SUPERIOR
fill(mouseY*10,mouseX,mouseY);
//fila1
rect(85,5,10,5);
rect(100,5,10,5);
//fila2
rect(80,10,35,5);
//fila3
rect(75,15,45,5);

if (mouseY < 90){
   rect(80,30,35,5);
   rect(90,35,15,5);
  //forat boca
  fill(0);
   rect(80,25,35,5);
   rect(75,20,45,5);
    }else {
   //LLAVI INFERIOR
rect(80,20,35,5);
rect(90,25,15,5);
  }

popMatrix();



scale(0.5);
  //****************DIBUIX HAMBURGUESA****************//
  //pa
  fill(#f3ac6c);
  noStroke();
  rect(mouseX, mouseY-20, mida+25, mida);
  rect(mouseX-5, mouseY-15, mida+35, mida);
  rect(mouseX-10, mouseY-10, mida+45, mida);
  //enciam
  fill(#139809);
  rect(mouseX-10, mouseY-5, mida+45, mida);
  rect(mouseX-10, mouseY, mida+45, mida);
  //formatge
  fill(#fff101);
  rect(mouseX-10, mouseY, mida, mida);
  rect(mouseX+5, mouseY, mida+5, mida);
  rect(mouseX+20, mouseY, mida+5, mida);
  //carn
  fill(#3e0002);
  rect(mouseX-10, mouseY+5, mida+45, mida);
  //tomaquet
  fill(#da0606);
  rect(mouseX-10, mouseY+10, mida+45, mida);
  //pa
  fill(#f3ac6c);
  rect(mouseX-10, mouseY+15, mida+45, mida);
  rect(mouseX-5, mouseY+20, mida+35, mida);
  
  
   //fons de color vermell+estela 
  fill(random(150,255),random(40,50),random(40,50),50);
  noStroke();
  rect(0,0,255,255);
   
   //foto
   PImage img;
  if (mousePressed)
  {
  img = loadImage("MCDONALDS.png");
  image(img,0,0);
  }

}


