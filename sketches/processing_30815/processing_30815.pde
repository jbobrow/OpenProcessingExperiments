
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

Circulito [] array_circulos; //array que define cantidad de círculos dibujados.
int contador_circulos, circulos_a_caer;
PImage arbolito,otonio; 

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
   arbolito = loadImage("arbolito.png"); //imagen del arbol
   otonio = loadImage("otonio.png"); //boton de otoño
   
   smooth();
   noStroke();
   //creacion objetos
   verde_1 = new Cuadradito(10,20,30,30); 
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
   
   activo=color(0,0,0);
   
   array_circulos = new Circulito [50000]; // Se limita el programa para que dibuje hasta 50.000 circulos
   contador_circulos = 0; //contador de círculos dibujados, comienza en 0
   
   for (int i = 0;i < 50000;i++) {
     array_circulos[i] = new Circulito();  //instrucción que cuenta cantidad de círculos dibujados y los crea como objetos.
   }
   
}


void draw() {
  background(255); 
  image(arbolito,110,110); // encuadre arbol
  image(otonio,640,60); // encuadre boton otoño
    
//paleta
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
  
   
    
   if (mousePressed) {
    if (mouseX > 640 && mouseX < 755 && mouseY > 60 && mouseY < 114) {
       circulos_a_caer = contador_circulos; //cantidad de círculos dibujados  
    } else {
    if (mouseX > 50 && mouseY <= 730) //delimitación del àrea de dibujo
    {  
     array_circulos[contador_circulos].crear(mouseX,mouseY,activo); //mientras el mouse está presionado y dibuja, genera un circulo a partir del array
     contador_circulos++; //por cáda círculo creado se actualiza la cantidad de círculos y se guarda en el contador.
    }
    }
      
  }
  
  if (mouseX < 50)
    {
     cursor(HAND); //cursor manito cuando está sobre selector color
    }
    else
    {
     cursor(ARROW); //flecha en el resto de la pantalla
    }
    
  for (int i = 0;i < circulos_a_caer;i++) { // se guarda en la variable el numero de circulos que están creados hasta el momento
    array_circulos[i].caer(); 
  }
    
  for (int i = 0;i < contador_circulos;i++) { //revisa todos los circulos creados y los muestra, actualiza todo el tiempo los circulos. 
    array_circulos[i].mostrar();
  }
}


void mousePressed() {
     
  //asignacion de colores presionando en el área del color
  if (mouseX>10 && mouseX<30) {
    if (mouseY>20 && mouseY<40) {
      activo=verde1;
    }
    if (mouseY>60 && mouseY<80) {
      activo=verde2;
    }
    if (mouseY>100 && mouseY<120) {
      activo=verde3;
    }
    if (mouseY>140 && mouseY<160) {
      activo=verde4;
    }
    if (mouseY>180 && mouseY<200) {
      activo=verde5;
    }
    if (mouseY>220 && mouseY<240) {
      activo=amarillo1;
    }
    if (mouseY>260 && mouseY<280) {
      activo=amarillo2; 
    }
    if (mouseY>300 && mouseY<320) {
      activo=amarillo3; 
    }
    if (mouseY>340 && mouseY<360) {
      activo=amarillo4;
    }
    if (mouseY>380 && mouseY<400) {
      activo=naranja1;
    }
    if (mouseY>420 && mouseY<440) {
      activo=naranja2;
    }
    if (mouseY>460 && mouseY<480) {
      activo=naranja3;
    }
    if (mouseY>500 && mouseY<520) {
      activo=naranja4;
    }
    if (mouseY>540 && mouseY<560) {
      activo=naranja5;
    }
    if (mouseY>580 && mouseY<600) {
      activo=naranja6; 
    }
    if (mouseY>620 && mouseY<640) {
      activo=rosado1;
    }
    if (mouseY>660 && mouseY<680) {
      activo=rosado2;
    }
    if (mouseY>700 && mouseY<720) {
      activo=rosado3;
    }
    if (mouseY>740 && mouseY<760) {
      activo=rosado4;
    }
    if (mouseY>780&& mouseY<800) {
      activo=rosado5;
    }
  }

}

 /* if (keyPressed == true) 
    { //si se presiona una tecla, se borra el contenido, resetea la aplicación.
    setup();
    }*/
    
//clase de rectángulos que conforman la paleta
class Cuadradito {
  
  float x, y, alto, ancho;
  
  Cuadradito(float posx, float posy, float altt, float anch) {
    x = posx;
    y = posy;
    alto = altt;
    ancho = anch;
  }
                                      
   void mostrar() {
    rect(x, y, alto, ancho);
  }
}


//clase círculos dibujados

class Circulito {
  
  float x, y;
  color color_propio;
  float nivel_caida=0;
  boolean no_caer_mas = false;
  
  Circulito() {
    
  }
   
   
   //función que crea cáda circulo                                    
  void crear(float posx, float posy, color colo) {
    x = posx;
    y = posy;
    color_propio = colo;
  }
  
  void mostrar() {
    if (no_caer_mas == false) {
    fill (color_propio); //pinta los círculos del color seleccionado.
    // dibuja pequeños círculos con el mouse. Los círculos adoptarán el color seleccionado, de no seleccionar un color al principio, serán negros por defecto
    ellipse(x + random(2),y + random(5),10,10); //la posición de X e Y no es constante entonces crea movimiento en cada actualización, si se modifican los parámetros random altera velocidad movimiento en las hojas
    }
  }
  
  void caer() {
    if (y<730) //delimita círculos dibujados que caeran (aquellos que se encuentren dibujados sobre los 730 px)
    {
    fill (color_propio,random(70,90)); //agrega transparencia random al color 
    ellipse(x + random(10),y + random(10)-12, 7, 7); //círculos más pequeños que acompañarán la caída de los dibujados, creando un efecto de barrido 
    y = y + nivel_caida; // va bajando el nivel en y 
    x = x + random(-10,10); //nivel de X hace un random para que se mueva
    nivel_caida+=0.2; //velocidad caída
    } else {
    no_caer_mas = true;
    }
  }
}


