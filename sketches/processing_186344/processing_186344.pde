
int rojo = 255;
int tiempo = 0;
int diametro = 50;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo - 1;    
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 8)));
   if (diametro > 200) {
  noStroke();            
  fill(rojo, mouseX, 0, mouseY);
  rect(mouseX, mouseY, diametro/2, diametro/2);
} else {
  stroke(mouseX,mouseY,rojo);
  ellipse(mouseX,mouseY,diametro/3,diametro/3);
  tiempo = tiempo + 1;    
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 7)));
}
if (diametro > 100) {
  stroke(mouseX,mouseY,rojo);
  ellipse(mouseX,mouseY,diametro/3,diametro/3);
} else {
  noStroke();            
  fill(rojo, mouseX, mouseY);
  rect(mouseX, mouseY, diametro/2, diametro/2);
  tiempo = tiempo + 1;    
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 5)));
}
}
