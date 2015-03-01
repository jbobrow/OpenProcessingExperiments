
int rojo = 100;
int azul = 255;
int tiempo = 0;
int diametro = 50;
   
void setup() {
  size(400, 400);
}
  
void draw() {
  tiempo = tiempo + 1;    
  rojo = int(125 * (1 + sin(tiempo * 2 * PI / frameRate / 5)));
  azul = int(125 * (1 + sin(tiempo * 2 * PI / frameRate / 10)));
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 15)));
    
  noStroke();            
  fill(rojo, 0, azul, 50);
  ellipse(mouseX, mouseY, diametro, diametro);
}
