

int rojo = 255;
int tiempo = 0;
int diametro = 50;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 1;    
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 2)));
  
  noStroke();            
  fill(rojo, 43, 10, 50); 
  ellipse(mouseX, mouseY, diametro, diametro);
}

