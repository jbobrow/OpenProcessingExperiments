
/** 
    <strong> "Color a tres dimensiones" </strong>  
    Proyecto Final de II Trimestre de 2009. LCO. Processing
  
    Basado en 
    <strong> light one de zjz </strong>
    http://www.openprocessing.org/visuals/?visualID=3237
    
    Este proyecto descubre las formas del color, a través de la profundidad.
    Consiste en demostrar la formación 3D, a través de formas sencillas.
    El código está compuesto por rectángulos, que al trasladarse y rotar, forman
    una malla 3D.
    Al presionar las teclas indicadas, ésta cambia de color.
**/

int ancho = 600; // ancho de la "pantalla" donde se mueve la malla
int altura = 400; // altura de la "pantalla"

float radio = ancho/2 ;  
int cenX = ancho/2 ; 
int cenY = altura/2;  
 
 
void setup() {  
  size(800,400,P3D);   
  background(20);  
  
  strokeWeight(20);  
  noFill(); 
  frameRate(100);  
}  
  
void draw() { 
  fill(20,20); 
  noStroke(); 
  rect(0,0,width+1,height+1); 
 
  translate(mouseX-150,mouseY-150, 0);     
  rotateX(float(frameCount%800)/700*PI); 
  rotateY(float(frameCount%800)/700*PI); 

 
  for (int d = 0; d < 150; d+=5) {  
    float r = radians(d);  
 
  if (keyPressed) {  
 /* La malla cambia de color, dependiendo de la tecla
 que se presiona, y luego vuelve a su color original */
    if (key == 'a' || key == 'A') {
// cambia a color amarillo
     stroke (219, 206, 102, 50); 
    }
    if (key == 'c' || key == 'C') {
// cambia a color celeste
     stroke(95, 214, 219, 50);
    }
    if (key == 'm' || key == 'M') {
// cambia a color morado
    stroke(165, 87, 222, 50);
    }
    if (key == 'g' || key == 'G') {
// cambia a color gris (casi blanco)
    stroke(188, 188, 188, 50);
    }
 } else  {
      
    stroke(82, 178, 70, 100);
 }
    bezier( 
    cenX,cenY,cenX, 
    radio / 2 * cos(r), radio / 2 * sin(r) , cenX*2/3, 
    radio * cos(r + PI), radio * sin(r + PI*2), cenX*1/3, 
    radio * cos(r + PI*3), radio * sin(r + PI), 0); 
  }  
}  
 
void mousePressed() {  
  if(mouseButton == LEFT) { 
  noLoop();   
   
/* Al presionar el botón izquierdo del mouse 
   se detiene la animación. Luego al presionar el botón derecho, 
   continúa moviéndose.*/ 
    
  } else if (mouseButton == RIGHT) {  
    loop(); 
  } else { 
    loop(); 
  } 
} 


