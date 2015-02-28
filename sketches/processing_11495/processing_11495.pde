
//programa simple de dibujo
//click en mouse para dibujar una recta
//aprieta cualquier tecla para borrar
void setup(){
size(600,400);
smooth();
background(10);
frameRate(300);
}
void draw(){
stroke(mouseX, 250 , mouseY); //puedo hacer esto mejor?
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 400;
strokeWeight(maxStroke - constrain(distance, 100, maxStroke));
line(pmouseX, pmouseY, mouseX, mouseY);
}
void mouseClicked(){
//dibuja un rectangulo donde el mouse fue clickeado
rectMode(CENTER);
fill(mouseY, 500, mouseX );
noStroke();
rect(mouseX, mouseY, 300, 300);
background(1);
frameRate(500);
strokeWeight(300);
stroke(100,10,100);
}
void keyPressed(){
//presiona tecla para borrar el Background
background(50);
strokeWeight(10);
frameRate(30);}






