
int morado = 255;
int tiempo = 25;
int diametro = 10;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 1;    
  morado = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(30 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); tiempo
   
  noStroke();            
  fill(125, 0, 125, 75); 
  ellipse(mouseX, mouseY, diametro, diametro);
}
