
int colorForma1, colorForma2, colorForma3;
int grosorLinea = 3;


void setup() {
  size(800, 800);
  background(255);
}
void draw() {
  println(mouseX + "," + mouseY);
  //cuadro paleta de colores
  stroke(0);
  strokeWeight(1);
  smooth();
  fill(204,255,229);
  rect(0, 0, 90, height);


  //interfaz
  
  fill(0);//negro
  rect(19, 251, 40, 40);
  fill(255, 0, 0);//rojo
  rect(19, 336, 40, 40);
  fill(0, 255, 0);//verde
  rect(19, 424, 40, 40);
  fill(0, 0, 255);//azul
  rect(19, 507, 40, 40);
  fill(255, 255, 51);//Amarillo
  rect(19, 172, 40, 40);
  fill(255, 102, 255);//rosa
  rect(19, 98, 40, 40);
  fill(160);//gris
  rect(19, 32, 40, 40);
  
  //texto
  fill(0);
  text(" + aumenta",19, 593 );
  text(" - disminuye",19, 613);
  
  //goma
  fill(255, 102, 255);
  rect(20, 671, 40, 20);
  fill(255);
  rect(60, 671, 10, 20);



 
  //line(mouseX,mouseY,pmouseX,pmouseY);
 if(keyPressed) {
    if(key == '+' && grosorLinea < 100){
     grosorLinea = grosorLinea + 1;
    } 
    if(key == '-' && grosorLinea > 3){
     grosorLinea = grosorLinea - 1; 
   }  

}
  

  if (mousePressed) {
    strokeWeight(grosorLinea);
    stroke(colorForma1, colorForma2, colorForma3);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }

}

void mousePressed() {

  if (mouseX > 19 && mouseX <60 && mouseY > 172 && mouseY < 212 ) {
    //amarillo
    colorForma1 = 255;
    colorForma2 = 255;
    colorForma3 = 51;
  }
  if (mouseX > 19 && mouseX <60 && mouseY > 252 && mouseY < 290) {
    //negro
    colorForma1 = 0;
    colorForma2 = 0;
    colorForma3 = 0;
  } 
  if (mouseX > 19 && mouseX <60 && mouseY > 337 && mouseY < 377) {
    //rojo
    colorForma1 = 255;
    colorForma2 = 0;
    colorForma3 = 0;
  }
  if (mouseX > 19 && mouseX <60 && mouseY > 424 && mouseY < 463) {
    //verde
    colorForma1 = 0;
    colorForma2 = 255;
    colorForma3 = 0;
  }
  //azul
  if (mouseX > 19 && mouseX <60 && mouseY > 508 && mouseY < 547) {
    colorForma1 = 0;
    colorForma2 = 0;
    colorForma3 = 255;
  }

  if (mouseX > 19 && mouseX <60 && mouseY > 98 && mouseY < 138) {
    colorForma1 = 255;
    colorForma2 = 102;
    colorForma3 = 255;
  }
  if (mouseX > 19 && mouseX <60 && mouseY > 672 && mouseY < 692) {
    colorForma1 = 255;
    colorForma2 = 255;
    colorForma3 = 255;
  }
   if (mouseX > 19 && mouseX <60 && mouseY > 32 && mouseY < 71) {
    colorForma1 = 160;
    colorForma2 = 160;
    colorForma3 = 160;
  }

}



