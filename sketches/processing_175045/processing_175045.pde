
//variables RGB
float colorLapiz1 = 0;
float colorLapiz2 = 0;
float colorLapiz3 = 0;
//variable grosor de la linea
int grosorLinea = 2;


void setup(){
size(1000, 800);
background(255, 255, 255);

}

void draw(){
  if (mousePressed && mouseX > 205 && mouseY > 1 && mouseY < 799) {
      strokeWeight(grosorLinea);
      stroke(colorLapiz1, colorLapiz2, colorLapiz3);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
 
  //tamaño de las lineas
  if (keyPressed){
    if (key == '+' && grosorLinea < 50) {
      grosorLinea = grosorLinea +1;//para aumentar el grosor de la linea pulsar la tecla "+"
    }
    if (key == '-' && grosorLinea > 2) {
      grosorLinea = grosorLinea -1;//para disminuir el grosor de la linea pulsar la tecla "-"
    }}

strokeWeight(1);
//cuadro de opciones
fill(210, 210, 210);
rect(10, 10, 200, 780);

//cuadrados de colores

fill(255, 255, 255);//blanco
rect(20, 20, 20, 20);

fill(0, 0, 0);//negro
rect(45, 20, 20, 20);

fill(125, 125, 125);//gris oscuro
rect(70, 20, 20, 20);

fill(225, 225, 225);//gris claro
rect(95, 20, 20, 20);

fill(150, 50, 0);//marrón oscuro
rect(120, 20, 20, 20);

fill(155, 100, 0);//marron claro
rect(145, 20, 20, 20);

fill(200, 0, 0);//rojo oscuro
rect(170, 20, 20, 20);

fill(255, 0, 0);//rojo
rect(20, 45, 20, 20);

fill(255, 125, 225);//rosa 
rect(45, 45, 20, 20);

fill(225, 0, 225);//rosa barbie
rect(70, 45, 20, 20);

fill(195, 125, 295);//lavanda
rect(95, 45, 20, 20);

fill(125, 125, 225);//lila
rect(120, 45, 20, 20);

fill(0, 0, 225);//azul marino
rect(145, 45, 20, 20);

fill(25, 125, 225);//azul claro
rect(170, 45, 20, 20);

fill(0, 225, 225);//turquesa
rect(20, 70, 20, 20);

fill(150, 225, 55);//verde claro
rect(45, 70, 20, 20);

fill(0, 225, 0);//verde oscuro
rect(70, 70, 20, 20);

fill(255, 255, 0);//amarillo
rect(95, 70, 20, 20);

fill(255, 255, 160);//amarillo claro
rect(120, 70, 20, 20);

fill(225, 100, 0);//naranja oscuro
rect(145, 70, 20, 20);

fill(225, 150, 0);//naranja claro
rect(170, 70, 20, 20);

fill(random(255), random(255), random(255));
rect(20, 95, 170, 20);

fill(255, 255, 255);//goma
rect(20, 150, 40, 40);

fill(255, 255, 255);//reset
rect(70, 150, 40, 40);
fill(0);
strokeWeight(5);
stroke(255, 0, 0);
line(79, 159, 102, 181);//cruz
line(79, 181, 102, 159);//cruz
println(mouseX, mouseY);
stroke(0, 0, 0);

textSize(10);
  text("Goma", 25, 172);
textSize(30);
  text("XVpaint.1.0", 29, 696);

}


void mousePressed(){
  //blanco
 if(mouseX > 20 && mouseX < 40 && mouseY > 20 && mouseY < 40 ){
    colorLapiz1 = (255);
    colorLapiz2 = (255);
    colorLapiz3 = (255);
 }
//negro
if(mouseX > 45 && mouseX < 65 && mouseY > 20 && mouseY < 40 ){
    colorLapiz1 = (0);
    colorLapiz2 = (0);
    colorLapiz3 = (0);
 }
 //gris oscuro
 if(mouseX > 70 && mouseX < 90 && mouseY > 20 && mouseY < 40 ){
    colorLapiz1 = (125);
    colorLapiz2 = (125);
    colorLapiz3 = (125);
 }
 //gris claro
 if(mouseX > 95 && mouseX < 115 && mouseY > 20 && mouseY < 40 ){
    colorLapiz1 = (225);
    colorLapiz2 = (225);
    colorLapiz3 = (225);
 }
 //marrón oscuro
 if(mouseX > 120 && mouseX < 140 && mouseY > 20 && mouseY < 40 ){
    colorLapiz1 = (150);
    colorLapiz2 = (50);
    colorLapiz3 = (0);
 }
 //marron claro
 if(mouseX > 145 && mouseX < 165 && mouseY > 20 && mouseY < 40 ){
    colorLapiz1 = (155);
    colorLapiz2 = (100);
    colorLapiz3 = (0);
 }
 //rojo oscuro
 if(mouseX > 170 && mouseX < 190 && mouseY > 20 && mouseY < 40 ){
    colorLapiz1 = (200);
    colorLapiz2 = (0);
    colorLapiz3 = (0);
 }
 //rojo
 if(mouseX > 20 && mouseX < 40 && mouseY > 45 && mouseY < 65 ){
    colorLapiz1 = (255);
    colorLapiz2 = (0);
    colorLapiz3 = (0);
 }
 //rosa 
 if(mouseX > 45 && mouseX < 65 && mouseY > 45 && mouseY < 65 ){
    colorLapiz1 = (255);
    colorLapiz2 = (125);
    colorLapiz3 = (225);
 }
 //rosa barbie
 if(mouseX > 70 && mouseX < 90 && mouseY > 45 && mouseY < 65 ){
    colorLapiz1 = (225);
    colorLapiz2 = (0);
    colorLapiz3 = (225);
 }
 //lavanda
 if(mouseX > 95 && mouseX < 115 && mouseY > 45 && mouseY < 65 ){
    colorLapiz1 = (195);
    colorLapiz2 = (125);
    colorLapiz3 = (295);
 }
 //lila
 if(mouseX > 120 && mouseX < 140 && mouseY > 45 && mouseY < 65 ){
    colorLapiz1 = (125);
    colorLapiz2 = (125);
    colorLapiz3 = (225);
 }
 //azul marino
 if(mouseX > 145 && mouseX < 165 && mouseY > 45 && mouseY < 65 ){
    colorLapiz1 = (0);
    colorLapiz2 = (0);
    colorLapiz3 = (225);
 }
 //azul claro
 if(mouseX > 170 && mouseX < 190 && mouseY > 45 && mouseY < 65 ){
    colorLapiz1 = (25);
    colorLapiz2 = (125);
    colorLapiz3 = (225);
 }
 //turquesa
 if(mouseX > 20 && mouseX < 40 && mouseY > 70 && mouseY < 90 ){
    colorLapiz1 = (0);
    colorLapiz2 = (225);
    colorLapiz3 = (225);
 }
 //verde claro
 if(mouseX > 45 && mouseX < 65 && mouseY > 70 && mouseY < 90 ){
    colorLapiz1 = (150);
    colorLapiz2 = (225);
    colorLapiz3 = (55);
 }
 //verde oscuro
 if(mouseX > 70 && mouseX < 90 && mouseY > 70 && mouseY < 90 ){
    colorLapiz1 = (0);
    colorLapiz2 = (225);
    colorLapiz3 = (0);
 }
 //amarillo
 if(mouseX > 95 && mouseX < 115 && mouseY > 70 && mouseY < 90 ){
    colorLapiz1 = (255);
    colorLapiz2 = (255);
    colorLapiz3 = (0);
 }
 //amarillo claro
 if(mouseX > 120 && mouseX < 140 && mouseY > 70 && mouseY < 90 ){
    colorLapiz1 = (255);
    colorLapiz2 = (255);
    colorLapiz3 = (160);
 }
 //naranja oscuro
 if(mouseX > 145 && mouseX < 165 && mouseY > 70 && mouseY < 90 ){
    colorLapiz1 = (225);
    colorLapiz2 = (100);
    colorLapiz3 = (0);
 }
 //naranja claro
 if(mouseX > 170 && mouseX < 190 && mouseY > 70 && mouseY < 90 ){
    colorLapiz1 = (225);
    colorLapiz2 = (150);
    colorLapiz3 = (0);
 }
 //random
 if(mouseX > 20 && mouseX < 180 && mouseY > 95 && mouseY < 115 ){
   colorLapiz1 = random (255);
   colorLapiz2 = random (255);
   colorLapiz3 = random (255);
 }
 
 //goma
 if(mouseX > 20 && mouseX < 60 && mouseY > 150 && mouseY < 190 ){
    colorLapiz1 = (255);
    colorLapiz2 = (255);
    colorLapiz3 = (255);
  }
  
  if (mouseX > 70 && mouseX < 110 && mouseY > 150 && mouseY < 190) {   
    background(255, 255, 255);
  }

}
 
 
 
 













