
// Exercise 4-4: RECREATE SCREENSHOTS
// "Learning Processing" by Daniel Shiffman
// Three screenshots in one Processing sketch

float centerX = width;
float centerY = height;
float circleW = 50;
float circleH = 50;

float x1 = width/2;
float y1 = height/2;
float x2 = width * 1.5;
float y2 = height/2;
float x3 = x1;
float y3 = height * 1.5;
float x4 = x2;
float y4 = y3;
int counter = 0;
int alpha = 255;
int alpha2 = 0;
int puntoX = width;
int puntoY = height;

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  
background(255);   
ellipseMode(CENTER);
  
  stroke(0,alpha);
  fill(175,20,20,alpha);
// ellipse1
   ellipse(x1,y1,circleW,circleH);

// ellipse2
   ellipse(x2,y2, circleW, circleH);

// ellipse3
ellipse(x3,y3, circleW, circleH);

// ellipse4
ellipse(x4,y4, circleW, circleH);
 

if ((x1 < centerX) || (y1 < centerY)) {
x1 ++;
    y1 ++;
    x3 ++;
    y3 --;
    x2 --;
    y2 ++;
    x4 --;
    y4 --;
    alpha = alpha - 5;
}
else {

// Rectangulo que hace de fondo gris
fill(230, alpha2 * 4);
rect (0, 0, width, height); 

alpha2 ++;
}

// Ellipse 5
counter ++;
if (counter >= 55) {
fill(100,200,255,alpha2);
ellipse(centerX, centerY, circleW, circleH);
circleW ++; 
circleH ++; }


if ( circleW >= width + 100 ) 
{
// Dibujar lí­neas que se unen al centro y que puedes mover al arrastrar con el mouse

  stroke(0,100);
  line(width/2,0,puntoX,puntoY);
  line(puntoX,puntoY,0,height);
  line(puntoX,puntoY,width,height);
  
  noStroke();
  
// quad izquierdo
  fill(20,20,200,25);
  quad (0, 0, width/2, 0, puntoX, puntoY, 0, height);
  
// quad derecho  
  fill(0,0,200,50);
  quad (width/2, 0, width, 0, width, height, puntoX, puntoY);
  }
}

// Para arrastrar las líneas que se unen al centro
void mouseDragged()
{
 if (true) { 
puntoX = pmouseX;
puntoY = pmouseY;
}
}

// Regresar puntoX y puntoY a sus posiciones originales
void keyPressed() {
puntoX = width/2 ;
puntoY = height/2 ;
}
