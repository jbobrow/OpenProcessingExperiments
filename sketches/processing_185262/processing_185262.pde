
int verde = 255;
int tiempo = 0;
int diametro = 35;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 10;    
  rojo = int(120 * (1 + sin(tiempo * 2 * PI / frameRate / 10)));
  diametro = int(40 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); 
   
  noStroke();            
  fill(0, verde, 0, 50);  
  ellipse(mouseX, mouseY, diametro, diametro);
}
