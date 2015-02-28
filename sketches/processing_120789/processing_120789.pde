
int y = 0;
  
void setup() {
  size(900, 900);
  background(225,200,200);
  smooth();
}
  
void draw() {
  //colores del 1 al 9
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (keyPressed) {
    //empezar de nuevo
    if (key == 'n') {
      background(225,200,200);
    }
    if (key == '1') {
      stroke(255, 100, 0);
    }
    if (key == '2') {
      stroke(255, 56, 67);
    }
    
     if (key == '3') {
      stroke(240,210,17);
    }
    if (key == '4') {
      stroke(29, 230, 30);
    }
    if (key == '5') {
      stroke(54, 145, 178);
    }
     if (key == '6') {
      stroke(255, 255, 255);
    }
     if (key == '7') {
      stroke(109,47,118);
    }
    if (key == '8') {
      stroke(255, 49, 231);
    }
    if (key == '9') {
      stroke(0,0,0);
    }
    //mas grande
    if (key == '+') {
       strokeWeight(y++);
    }
    if (y == 0) {
       y = 0;
       //mas pequeño
    } else if (key == '-'){
      strokeWeight(y--);
    }
    //Figuras 
   if (keyPressed){
     //redondas de colores y tamaños random
     if (key == 'a'){
     frameRate(400);
       strokeWeight (15);
       stroke (random (0,255),random (0,255),random(0,255));
       ellipse (mouseX,mouseY,random (0,70),random (0,70));
     }
  }
   if (keyPressed){
     //quadrados de colores y tamaño random
     if (key == 's'){ 
       frameRate(400);
       fill (random (0,255),random (0,255),random (0,255));
       stroke (random (0,255),random (0,255),random(0,255));
       rect (mouseX,mouseY,random (0,70),random (0,70));
     }
  }
    if (keyPressed){
      //quadrilatero de colores y tamaños random
     if (key == 'd'){ 
       frameRate(400);
       fill (random (0,255),random (0,255),random (0,255));
       stroke (random (0,255),random (0,255),random(0,255));
       quad (random (0,70),random (0,70),mouseX,mouseY, random (0,70),random (0,70),random (0,70),random (0,70));
     }
  }
     if (keyPressed){
       //triangulos de colores y tamaños random desde el punto 0,0
     if (key == 'f'){ 
       frameRate(400);
       fill (random (0,255),random (0,255),random (0,255));
       stroke (random (0,255),random (0,255),random(0,255));
       triangle (random (0,70),mouseX,mouseY, random (0,70),random (0,70),random (0,70));
     }
  }
  }
}



