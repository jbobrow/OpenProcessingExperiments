
//Actividad 01-2. //Paola Barragán Acevedo. //Enero 2013. 
void setup(){ 
size(600, 600);
background(0);
smooth(0);
frameRate(5);
} 
void draw() {
fill(random(255), random(231), 100, 150);
stroke(255);
float diametro=random(100);
ellipse(mouseX,mouseY,diametro,diametro);
}
