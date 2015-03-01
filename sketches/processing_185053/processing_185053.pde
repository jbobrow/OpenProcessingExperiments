
int rojo = 255;
int tiempo = 0;
int diametro = 10;
  
void setup() {
  size(500,500);
 background(0,25,255);
 noStroke();
 ellipse(100,50,100,100);
 ellipse(170,50,150,150);
 ellipse(230,30,170,170);
 ellipse(450,50,150,150);
 fill(0,200,0);
 rect(0,400,600,400);
}
 
void draw() {
  
  tiempo = tiempo + 1;    
  
  diametro = int(10 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Modifica el diametro del circulo con el paso del tiempo
 
  noStroke();            
  fill(255, 255, 255,50);  // Añade un 50% de transparencia al color
  ellipse(mouseX, mouseY, diametro, diametro);
}
