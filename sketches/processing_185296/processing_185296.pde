
int rojo = 255;
int tiempo = 10;
int diametro = 30;
  
void setup() {
  size(500, 500);
 background(250,255,100);
}
 
void draw() {
  tiempo = tiempo + 1;    
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(30 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); 
   
  noStroke();            
  fill(70, 120, 50, 60);  
  ellipse(mouseX, mouseY, diametro, diametro);
  stroke(255,0,0);
  triangle(120,20,80,80,120,80);
  triangle(100,50,180,160,100,140);
  triangle(400,200,150,80,100,300);
  ellipse(70,80,130,80);
  ellipse(200,200,200,200);
}
