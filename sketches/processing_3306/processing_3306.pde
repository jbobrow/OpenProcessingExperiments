
// basado en  "Gold Threads" by Lib4tech

float a = 5; 
float b = 5; 
 
void setup() { 
  size(600, 600); 
  background(0); 
  smooth(); 
  loop(); 
  frameRate(20); 
} 
 
void draw() { 
  translate(width/2, height/2); 
  rotate(radians(a+b)); 
  strokeWeight(2);       // espesor del borde de la elipse
  stroke(201, 45, 131);  // color del borde de la elipse
  fill(random(a,b)); 
  ellipse(a, b, a/b, a/b); // elipse/círculo
  
  a += 4; 
  b -= 00.5; 
  
  if (a > width/2 ) { 
    a = random(width); 
    a = -a; 
    b = a / b; 
  } 
  if (b > height/2) { 
   a = 10; 
   b = a / b; 
 } 
} 
 

void mousePressed() { 
  if(mouseButton == LEFT) {
  noLoop();  
  
/* Al presionar el botón izquierdo del mouse
   se detiene la animación.*/
   
  } else if (mouseButton == RIGHT) { 
    loop();
  } else {
    loop();
  }
}
/* Al presionar el botón derecho del mouse,
   continúa moviéndose. */

