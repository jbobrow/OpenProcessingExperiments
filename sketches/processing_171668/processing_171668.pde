
//Crear una animació amb el personatge crear.
 
// ------------ INICIO CÓDIGO ------------ //
 void setup()  {
size(600, 600);
 }
 //VARIABLES
int colorOjoIzq1 = 0;//color ojo izquierdo
int colorOjoIzq2 = 0;
int colorOjoIzq3 = 0;

int colorPico1 = 239; //color pico
int colorPico2 = 185; 
int colorPico3 = 23; 

int bordePico1 = 220;//color borde pico
int bordePico2 = 173;
int bordePico3 = 21;

int valorX = 400;//posicion X del parche
int valorY = 170;//posicion Y del parche

 void draw()  {//Inicio DRAW
 
background(255);
 
println(mouseX+ " " +mouseY); //Mostrar por terminal las coordenadas de los ejes X  Y
// ------ ALA IZQUIERDA ------
fill(32, 32, 32);//gris oscuro.
strokeWeight(3);
stroke(0);
arc(248, 290, 300, 230, PI, PI+QUARTER_PI);
line(100, 290, 130, 290);
 
// ------ ALA DERECHA ------
arc(460, 290, 160, 180, PI, TWO_PI);
line(510, 290, 540, 290);
 
// ------ REFLEJO ALA IZQUIERDA ------
noStroke();
fill(255, 255, 255, 30);//30 = opacidad.
arc(238, 280, 280, 210, PI, PI+QUARTER_PI);
 
// ------ REFLEJO ALA DERECHA ------
arc(490, 280, 100, 135, PI, TWO_PI);
 
// ------ CUERPO ------
strokeWeight(3);
stroke(0);
fill(32, 32, 32);
ellipse(320, 280, 380, 420);//x, y, anchura x, altura y.
 
// ------ OJO DERECHO DEL PARCHE ------ METERLO DEBAJO DEL PARCHE
noSmooth();//borde sin nitidez
strokeWeight(2);
stroke(255,0,0);
fill(255);
ellipse(385, 180, 45, 45);//OJO sangriento
smooth();//bordes nítidos

// ------ OJO DERECHO ------
noFill();
strokeWeight(8);
stroke(132, 129, 122);
arc(320, 140, 275, 30, 0, PI);//CUERDA parche
fill(0);
strokeWeight(5);
/*ellipse(valorX, valorY-mouseX/5, 90, 105); //PARCHE*/
ellipse(valorX, valorY, 90, 105);

if(mouseX > 300){ //Si el ratón en la coordenada X llega 300, el parche se eleva
  if(valorY > 110){//Limitar el parche para que no se salga del sketch
 valorY = valorY - mouseX/80; // /50 es la velocidad a la que se eleva
  }
}

if(mouseX < 300 || mouseX > 500){ //Si el ratón en la coordenada X es menor que 300 o mayor que 500, el parche vuelve a su altura original
  valorY = 170; 
}

// ------ OJO IZQUIERDO ------
fill(255);
noStroke();
arc(260, 170, 90, 90, 0, PI+QUARTER_PI); //LÍNIA QUE FALLA AL PONER "CHORD" U "OPEN".
triangle(229, 138, 305, 170, 230, 170);
fill(colorOjoIzq1, colorOjoIzq2, colorOjoIzq3);
ellipse(270, 180, 45, 45);
strokeWeight(10);
stroke(0);
line(230, 120, 310, 170);
 
// ------ BARRIGA ------
fill(255);//blanco
noStroke();
ellipse(325, 350, 280, 260);
 
// ------ EFECTO BARRIGA ------
fill(232, 232, 232, 90);//80 = opacidad.
ellipse(325, 327, 260, 210);

// ------ PICO ------
strokeWeight(2);
stroke(bordePico1, bordePico2, bordePico3);
fill(colorPico1, colorPico2, colorPico3);
triangle(325, 280, 270, 220, 370, 220);//x1, y1, x2, y2, x3, y3.
 
// ------ PATA IZQUIERDA ------
noStroke();
fill(220, 173, 21);//amarillo oscuro
arc(230, 500, 160, 140, PI, TWO_PI);//semicircunferencia mitad arriba.
 
// ------ REFLEJO PATA IZQUIERDA ------
fill(255, 255, 255, 60); //60 = opacidad.
arc(230, 470, 110, 70, PI, TWO_PI);
 
// ------ PATA DERECHA ------
fill(220, 173, 21);
arc(400, 500, 160, 140, PI, TWO_PI);//semicircunferencia mitad arriba.
 
// ------ REFLEJO PATA DERECHA ------
fill(255, 255, 255, 60); //60 = opacidad.
arc(400, 470, 110, 70, PI, TWO_PI);

 } // Final DRAW

 void mousePressed(){//Cambio de color HACER CLICK
// COLOR DEL OJO IZQ
  if(colorOjoIzq1 == 0)  {
    colorOjoIzq1= 222;
    colorOjoIzq2 = 42;
    colorOjoIzq3 = 42;
  }else{
     colorOjoIzq1 = 0;
     colorOjoIzq2 = 0;
     colorOjoIzq3 = 0;
  }
//COLOR DEL PICO Y DEL BORDE DEL PICO
  if(colorPico1 == 239 && bordePico1 == 220){
  colorPico1 = 40;
  colorPico2 = 240;
  colorPico3 = 100;
  
  bordePico1 = 0;//color del borde del pico
  bordePico2 = 0;
  bordePico3 = 0;
  
  }  else{
  colorPico1 = 239;
  colorPico2 = 185;
  colorPico3 = 23;
  
  bordePico1 = 220;
  bordePico2 = 173;
  bordePico3 = 21;
  }
 } //fin de mousePressed
 
// ------------ FINAL CÓDIGO ------------ //



