
//*Proyecto Final LC0

//Título: Bamboleo

//Autor: Tomas Aguilar

//Definición básica de funciones:
//float: Convierte un tipo de datos primitivos, de cadena, 
//o una matriz en la representación de punto flotante.
//strokeWeight: Define la anchura de los tiempos utilizados 
//para las líneas, puntos, y el borde alrededor de las formas. 
//Todos los anchos se establecen en unidades de píxeles.
//line: Dibuja una línea (una ruta directa entre dos puntos) 
//a la pantalla. La versión de línea () con cuatro parámetros 
//traza la línea en 2D.
//ellipse: Dibuja una elipse (óvalo) en la ventana de visualización.
//Una elipse con una misma anchura y la altura es un círculo.

//Descripción: Consiste en un conjunto de figuras geométricas 
//sujetas a lineas, que en su afán de safarse van aumentando 
//la velocidad. Mientras una esfera crece y se aleja del lugar.


float raiz;  
float negra;  
 
float peluo;  
float peluo_feo;  
float peluo_lindo;  
  
void setup() {  
  size(500,500);  
  smooth();  
    
  raiz = 54.0;  
  peluo = 2.0;  
  peluo_feo = 0.0;  
  peluo_lindo = 0.0003;  
    
  negra = 200.0;  
  peluo = 0.0000001;  
  peluo_feo = 0.00009;  
  peluo_lindo = 0.0001;  
   
}  
  
void draw() {  
  background(random(0,345));  
  translate(width/2,height/2);  
    
  float x = raiz * cos(peluo);  
  float y = raiz * sin(peluo);  
    
  float x1 = negra * cos(peluo);  
  float y1 = negra * sin(peluo);  
    
      
  ellipseMode(CENTER);  
  strokeWeight(10+peluo/3);  
  stroke(noise(38));  
  fill(random(255),random(255),random(255),random(300));  
  line(0,-450,x1,y1);  
  line(x1,y1,0,450);  
  rect(x1,y1,mouseX,mouseY);  
   peluo_feo += peluo_lindo;  
  peluo += peluo_feo;  
    
    
  strokeWeight(10);  
  stroke(255);  
  fill(255-peluo);  
  line(200,-300,x+200,y-170);  
  line(x+200,y-170,200,300);  
  rect(x+200,y-170,16+x,16+x);  
    
    
    
  strokeWeight(10);  
  stroke(255);  
  fill(255-peluo);  
  
  line(-170,-300,x-170,y+50);  
  line(x-170,y+50,-170,300);  
  rect(x-170,y+50,16+x,16+x);  
 ellipse(peluo,peluo,peluo,peluo); 
    
    
  strokeWeight(10);  
  stroke(255);  
  fill(random(255),random(255),random(255),100);  
  line(-100,-300,x-100,y-200);  
  line(x-100,y-200,-100,300);  
  ellipse(x-100,y-200,16+x,16+x);  
    
    
    
  strokeWeight(10);  
  stroke(255);  
  fill(random(255),random(255),random(255),200);  
  line(150,-300,x+150,y+170);  
  line(x+150,y+170,150,300);  
  ellipse(x+150,y+170,16+x,16+x);  
    
    
    
 
}  


