
int raton = 10;
void setup() {
noCursor();
background(0);
size(1000,1000);}
void draw() { 
stroke(255);
strokeWeight(2);
ellipse(mouseY, mouseX,mouseX,mouseY);
fill(random(255),random(255),random(255),random(255));}
void mousePressed(){ 
background(6);}
void mouseDragged(){ 
  float aleatorioX= random(90,40);
  float aleatorioY= random(50,580);
  float tamano= random(92,50);
rect(mouseX+aleatorioX,mouseY+aleatorioY,tamano,tamano);}

