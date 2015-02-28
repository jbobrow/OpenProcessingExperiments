
// ************************************************************
// * Alumno: Nombre y apellido del alumno: María Kocsis       *
// * Ejercicio Nro: 17                                        *
// * Asignatura: Informática Aplicada I			      *
// * Carrera: Artes Multimediales			      *  
// * Institución: IUNA                                        *
// * Año: 2011                 Cuatrimestre: 1º               *
// ************************************************************




Cuadradito verde_1, verde_2, verde_3, verde_4, verde_5, amarillo_1, amarillo_2, amarillo_3, amarillo_4, naranja_1,
naranja_2, naranja_3, naranja_4, naranja_5, naranja_6, rosado_1, rosado_2, rosado_3, rosado_4, rosado_5, color_activo; //declaración objetos

//colores de paleta
color verde1=color(49,62,5);
color verde2=color(61,93,3);
color verde3=color(111,126,9);
color verde4=color(148,188,28);
color verde5=color (201,220,45);

color amarillo1=color(219,188,31);
color amarillo2=color(230,213,26);
color amarillo3=color(247,230,91);
color amarillo4=color(255,239,157);

color naranja1=color(233,122,47);
color naranja2=color(229,116,2);
color naranja3=color(213,130,0);
color naranja4=color(229,138,46);
color naranja5=color(214,162,110);
color naranja6=color(255,206,135);

color rosado1=color(201,20,84);
color rosado2=color(217,91,85);
color rosado3=color(252,99,130);
color rosado4=color(255,153,173);
color rosado5=color(255,188,201);
color activo;


void setup() {
   size(820,820);
   PImage arbolito;
   background(255);
   arbolito = loadImage("arbolito.png"); //imagen del arbol
   image(arbolito,110,110); // encuadre arbol
   smooth();
   noStroke();
   verde_1 = new Cuadradito(10,20,30,30); //creacion objeto
   verde_2 = new Cuadradito(10,60,30,30);
   verde_3 = new Cuadradito(10,100,30,30);
   verde_4 = new Cuadradito(10,140,30,30);
   verde_5 = new Cuadradito(10,180,30,30); 
   amarillo_1 = new Cuadradito (10,220,30,30);
   amarillo_2 = new Cuadradito (10,260,30,30);
   amarillo_3 = new Cuadradito (10,300,30,30);
   amarillo_4 = new Cuadradito (10,340,30,30);
   naranja_1 = new Cuadradito (10,380,30,30);
   naranja_2 = new Cuadradito (10,420,30,30);
   naranja_3 = new Cuadradito (10,460,30,30);
   naranja_4 = new Cuadradito (10,500,30,30);
   naranja_5 = new Cuadradito (10,540,30,30);
   naranja_6 = new Cuadradito (10,580,30,30);
   rosado_1 = new Cuadradito (10,620,30,30);
   rosado_2 = new Cuadradito (10,660,30,30);
   rosado_3 = new Cuadradito (10,700,30,30);
   rosado_4 = new Cuadradito (10,740,30,30);
   rosado_5 = new Cuadradito (10,780,30,30);
   color_activo = new Cuadradito (750,760,50,30);
   
   
    
}


void draw() {
  
  fill(verde1);
  verde_1.mostrar();
  fill(verde2);
  verde_2.mostrar();
  fill(verde3);
  verde_3.mostrar();
  fill(verde4);
  verde_4.mostrar();
  fill(verde5);
  verde_5.mostrar();
  
  fill(amarillo1);
  amarillo_1.mostrar();
  fill(amarillo2);
  amarillo_2.mostrar();
  fill(amarillo3);
  amarillo_3.mostrar();
  fill(amarillo4);
  amarillo_4.mostrar();
  
  fill(naranja1);
  naranja_1.mostrar();
  fill(naranja2);
  naranja_2.mostrar();
  fill(naranja3);
  naranja_3.mostrar();
  fill(naranja4);
  naranja_4.mostrar();
  fill(naranja5);
  naranja_5.mostrar();
  fill(naranja6);
  naranja_6.mostrar();
  
  
  fill(rosado1);
  rosado_1.mostrar();
  fill(rosado2);
  rosado_2.mostrar();
  fill(rosado3);
  rosado_3.mostrar();
  fill(rosado4);
  rosado_4.mostrar();
  fill(rosado5);
  rosado_5.mostrar();
  fill(activo);
  color_activo.mostrar();
  
  
  
   //asignacion de colores presionando en el área del color
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>20 && mouseY<40) {
    activo=verde1;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>60 && mouseY<80) {
    activo=verde2;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>100 && mouseY<120) {
    activo=verde3;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>140 && mouseY<160) {
    activo=verde4;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>180 && mouseY<200) {
    activo=verde5;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>220 && mouseY<240) {
    activo=amarillo1;
  }
 if (mousePressed && mouseX>10 && mouseX<30 && mouseY>260 && mouseY<280) {
    activo=amarillo2; 
  }

 if (mousePressed && mouseX>10 && mouseX<30 && mouseY>300 && mouseY<320) {
    activo=amarillo3; 
  }
  
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>340 && mouseY<360) {
    activo=amarillo4;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>380 && mouseY<400) {
    activo=naranja1;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>420 && mouseY<440) {
    activo=naranja2;
  }
 if (mousePressed && mouseX>10 && mouseX<30 && mouseY>460 && mouseY<480) {
    activo=naranja3;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>500 && mouseY<520) {
    activo=naranja4;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>540 && mouseY<560) {
    activo=naranja5;
  }
 if (mousePressed && mouseX>10 && mouseX<30 && mouseY>580 && mouseY<600) {
    activo=naranja6; 
  }
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>620 && mouseY<640) {
    activo=rosado1;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>660 && mouseY<680) {
    activo=rosado2;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>700 && mouseY<720) {
    activo=rosado3;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>740 && mouseY<760) {
    activo=rosado4;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>780&& mouseY<800) {
    activo=rosado5;
  }
  
  
  
  
  if (mousePressed)
     
     if (mouseX > 50) //delimitación del àrea de dibujo
  {  
     ellipse(mouseX + random(10),mouseY + random(10),10,10);  // dibuja pequeños círculos con el mouse. Los círculos adoptarán el color seleccionado, de no seleccionar un color al principio, serán negros por defecto
  }
    if (mouseX < 50) 
    {
    
     cursor(HAND); //cursor manito cuando está sobre selector color
    }
    else
    {
      cursor(ARROW); //flecha en el resto de la pantalla
    }

if (keyPressed == true) 
  { //si se presiona una tecla, se borra el contenido, resetea la aplicación.
  setup();
  } 
 }






class Cuadradito {
  
  float x, y, alto, ancho;
  
  Cuadradito(float posx, float posy, float alt, float anc) {
    x = posx;
    y = posy;
    alto = alt;
    ancho = anc;
  }
                                      
   void mostrar() {
    rect(x, y, alto, ancho);
  }
}


