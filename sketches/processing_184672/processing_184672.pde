
int verde = 100;
int tiempo = 0;
int diametro = 30;


   
void setup() {
  size(500, 500);
  background(115, 75, 30);
}
 
void draw() {
  tiempo = tiempo + 1;     
  verde = int(100 * (1 + sin(tiempo * 5 * PI / frameRate / 20))); 
  diametro = int(30 * (1 + sin( tiempo * 1 * PI / frameRate / 5))); 
   
  
  noFill();             
  fill(0, verde, 0, 150);  
  ellipse(mouseX, mouseY, diametro, diametro);  
}
