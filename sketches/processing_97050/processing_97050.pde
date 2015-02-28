

float x = 100;
float y = 80;
float w = 50;
float h = 50;
 

 
float speedX = 1;
float speedY = 0;
 
 
void setup() {
 
  size(300, 300);
  smooth();
 
  //Alineem la elipse a la cantonada
  ellipseMode(CORNER);
 
}
 
void draw() {
   
  
  background(10, 120, 250);
  strokeWeight(3);
  
  // Posicionem la elipse
  ellipse(x, y, w, h);
 
  // Afegim gravetat perque caigui de forma natural si no fem res
  speedY = speedY + 0.5;
 
  // Afegim la velocitat als eixos
  x = x + speedX;
  y = y + speedY;
 
  // si estem a la dreta o a la esquerra del dibuix
  // la velocitat varia
  
  if ((x > width - w) || (x <= 0)) {
    speedX = -speedX;
  }
 
  // si txoquem contra el terra...
  if (y > height - h) {
    
    // Li diem que la volem al terra
    y = height - h;
    
    // 90% de la velocitat real en léix y
    // Però a la posició contraria
    speedY = speedY * -0.9;
  }
  else if (y <= 0) {
    
    // si la pilota está a dalt
    // la fem rebotar
    speedY = -speedY;
  }
}
 
void mousePressed() {
  // quan el mouse està premut varia la direcció
  // varia la velocitat i també el color de la esfera
 
 fill(random(255,255,255), random(6,168,19));
 
  speedX = random(-20, 20);     
  speedY = -10;
}





