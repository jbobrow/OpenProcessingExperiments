

void setup(){
 // Alumno: Lluís Guixà Vergés
 // 1er A.S.I.X.
  
  
  size(500, 500);
}
int color1=0;
int color2=0;
int color3=0;
//int yOJO = 202;
//int xOJO = 254;
int yOJO = 202;
int xOJO = 254;
int value = 60;
int value1 = 8;

void draw() {
  println (mouseX + " " + mouseY);
  background(255, 255, 255) ;
  println ("");
   
   
  //Colores:
  //RGB Simpson: 255,217,15
 
  //RGB Azul Cielo: 12, 183,242
 
  //RGB Blanco: 255, 255, 255
 
 //RGB Camel: 193, 154, 107
  
 //Color al personaje
 fill(255,217,15);
noStroke();
 
 
 triangle(176,170,188,250,290,250);
 rect(177,150,120,30);
 rect(187,160,120,82);
 rect(196,250,70,102);
triangle(206,200,186,365,300,300);
arc(262,340,175,90,8,9);
rect(196,290,80,80);
triangle(250,200,272,390,290,290);
triangle(277, 371, 287, 402, 226, 375);
triangle(250, 385, 276, 420, 287, 401);
rect(240,363,30,10);
fill(193, 154, 107);
rect(285,242,30,40);
rect(320,290,15,13);
rect(304,304,13,12);
rect(308,305,13,3);
fill(255,255,255);
arc(184,364,30,25,4,5);
 
 
 
 
 
 
 
 
 
  //Arco Calva + color (fill)
   
   
  
   /*
   Primer valor: Mueve el arco hacia los lados ( eje x )
  
    Segundo valor: Mueve el arco hacia arriba y abajo ( eje y )
     
    Tercer valor: Ensancha el arco ( Anchura )
     
    Cuarto valor: Estira hacia arriba el arco ( Altura )
     
    Quinto valor: Regula el inicio del arco
    
   Sexto valor: Regula el fin del arco
    
    */
    
  stroke(1);
  fill(255,217,15);
  arc (250,160,150,150,3,6.5);
  
  
 //Línea de la nuca
  
/* Primer valor:Es la cordenada X del primer punto.
  
    Segundo valor:Es la cordenada Y del primer punto.
     
    Tercer valor:Es la cordenada X del segundo punto.
     
    Cuarto valor:Es la cordenada Y del segundo punto.
    */
  
  line(190,270,174,160);
   
  // arco ceja
   
  //(x,y,ancho,alto,inicio,fin);
   
  arc(320,180,30,30,92.7,94.5);
   
  //Escletórica Ojo debajo ceja + color ( fill )
   
  /*
   
  Primer valor: Eje X
   
  Segundo valor: Eje Y
   
  Tercer valor: ANCHO
   
  Cuarto valor: ALTO
   
  RGB Blanco: 255,255,255
  */
   
  fill(255,255,255);
  ellipse(309,202,60,60);
   
   //Escletórica Ojo derecho + color ( fill )
    
     fill(255,255,255);
  ellipse(260,202,60,value);

  
  //Iris ojo debajo ceja + color
   
  //RGB Negro: 0,0,0
   
  fill(0,0,0);
 
     ellipse(309+mouseX/25,202+mouseY/22,8,8);
  
  
  //Iris ojo derecho + color
   
  //RGB Negro: 0,0,0
  
  stroke(color1,color2,color3);
   
    fill(color1,color2,color3);

  ellipse(xOJO+mouseX/25,yOJO+mouseY/20,8,value1);
    
   
  // Arco Pelo delantero
   
   
  
 //noFill(); Sirve para quitar el color de la figura.
  
/*strokeWeight(0); Sirve para regular el grueso en píxeles de las
                   líneas, strokeWeight(2); = Grueso de 2 píxeles.
                   */
  stroke(0);                
  noFill();
  strokeWeight(2);
 arc(250,97,55,55,3.2,6);
  strokeWeight(1);
   
  //Arco Pelo Trasero
   
  noFill();
  strokeWeight(2);
 arc(235,97,55,55,3.1,5.8);
  strokeWeight(1);
   
  //Rectángulo nariz
  fill(255,217,15);
  rect(284,220,30,22);
   
  //Rectángulo para tapar raya nariz
 
noStroke();
fill(255,217,15);
rect(284,220,1,22);
stroke(1);
   
  //Arco nariz
   
  arc(311,232,22,23,5,7.5);
   
   
   
  // Pelo en forma de M
   
 // Empezando de dentro hacia afuera
  
/* Primer valor:Es la cordenada X del primer punto.
  
    Segundo valor:Es la cordenada Y del primer punto.
     
    Tercer valor:Es la cordenada X del segundo punto.
     
    Cuarto valor:Es la cordenada Y del segundo punto.
    */
  
  strokeWeight(2);
   
  line(210,230,198,200);
  line(184,230,198,200);
  line(184,230,168,206);
  line(168,230,168,206);
   
  strokeWeight(1);
   
   
   
  //Arco Oreja
   
 arc(195,260,40,40,7,12);
  
   //Arco interior Oreja Superior
  
 arc(194,255,20,5,3,6.9);
  
  
 //Arco interior Oreja Inferior
  
 arc(203,264,20,15,3.5,5);
  
  
//Arco cercano oreja de la Boca
 
// RGB Camel: 193, 154, 107
 
fill(193, 154, 107);
arc(285,292,100,100,1.6,4.8);
 
// Arco delantero nariz de la Boca
 
 
fill(193, 154, 107);
arc(304,290,60,100,5,6.3);
 
 
//Arco labio superior
 
 
fill(193, 154, 107);
arc(332,297,12,12,4.9,7.5);
 
 
//Arco Barbilla
 
 
fill(193, 154, 107);
arc(280,282,80,120,6.9,7.8);
 
 
//Arco labio inferior
 
fill(193, 154, 107);
arc(315,309,14.5,14.5,6,8);
 
 
//Arco Labio central
 
fill(193, 154, 107);
arc(275,243,330,130,7.49,7.95);
 
 
 
 
// Línea labio central
 
 
/* Primer valor:Es la cordenada X del primer punto.
  
    Segundo valor:Es la cordenada Y del primer punto.
     
    Tercer valor:Es la cordenada X del segundo punto.
     
    Cuarto valor:Es la cordenada Y del segundo punto.
    */
 
 
line(255,312,262,301);
 
//Arco superior cuello camisa
noFill();
 
arc(262,340,180,90,8,9);
fill(255,255,255);
 
//Arco trasero pequeño cuello camisa
noFill();
//fill(255,255,255);
arc(184,364,25,25,4,5);
 
//Línea cuello nuca
 
line(195,280,186,364);
 
 
//Línea cuello barbilla
 
line(280,341,276,370);
 
 
//Línea trasera cuello camisa
 
line(175,354,160,400);
 
 
//Arco inferior cuello camisa
 
arc(248,380,190,100,8,9);
 
 
//Línea delantera cuello camisa
 
line(249,384,234,429);
 
 
//Línea  izquierda pico camisa
 
line(249,384,276,420);
 
//Línea derecha pico camisa
 
line(300,380,276,420);
 
//Línea cuello pequeño camisa superior
 
line(300,380,278,355);
 
//Arco pecho
 
arc(44,780,600,1300,5.6,5.8);
 
//Línea exterior cuello camisa pequeño
 
line(300,380,312,415);
 
//Línea inferior cuello camisa pequeño
 
line(291,412,312,415);
 
//Arco hombro grande
 
//fill(255,255,255);
arc(170,465,100,90,3.8,6.3);
 
//Línea hombro grande con cuello camisa
 
line(160,420,165,404);
 
//Arco hombro pequeño
 
arc(26,504,600,400,5.8,6);

fill(0,0,0);
rect(360,230,130,60);
triangle(361,250,342,286,362,286);
fill(255,255,255);
text("Si me das click",380,250);
text("te guiño el ojo ;)",380,270);
}




void mousePressed(){
  value = 1;
  value1 = 1;
  color1=255;
  color2=217;
  color3=15;
}

void mouseReleased () {
value = 60;
value1 = 8;
color1=0;
  color2=0;
  color3=0;

}



