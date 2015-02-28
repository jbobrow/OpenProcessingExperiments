
/*Proyecto final LC0:
 *¡BLOSSOM!
 *por Vannia Castro Solis
 *La elipses giratorias que provenienten de un punto provocan 
 el esperado efecto de parecer petalos en variedad. Los colores
cambian a medida que el mouse se arrastra sobre el.
Utilizé una nueva funcion, frameRate, que
consiste en modificar la velocidad en que van a apareciendo las
figuras, como si fueran fotos que pasando rapidamente forman una
animacion.*/







float a = 0; 
float b = 0; 
 
void setup() { 
  size(400, 400); 
  background(255); 
  smooth(); 
  frameRate(50); 
} 
 
void draw() { 
  translate(width/4, height/4); 
  rotate(radians(a * b)); 
  stroke(200, 150, 15); 
  fill(random(217)*millis(), 250, 246); 
   ellipse(a, b, a/b, a/b); 
  fill(mouseX, mouseY, mouseX, mouseY);
 
  ellipse(b, a, b, a); 
  fill(random(100)*millis(), 210, 200); 
  ellipse(b, a, a/b, a/b); 
   
  a += 2; 
  b -= 0.05; 
  if (a > width/4) { 
    a = random(width); 
    a = -a; 
    b = a / b; 
  } 
 if (b > height/2) { 
   a = 0; 
   b = a / b; 
 } 
} 
 



