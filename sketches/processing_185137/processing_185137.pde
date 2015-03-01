
int rojo = 255;
int tiempo = 0;
int diametro = 50;
void setup() {
  size(400, 400);
background(225, 200, 100);
}
 
void draw() {
  
  rojo = rojo - 1; 
   if (rojo < 0) rojo = 255; 
   tiempo = tiempo + 1;  
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20))); 
 diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 5)));

  
  fill(25, rojo, mouseX);    
  ellipse(mouseX, mouseY,diametro, diametro);
 }
