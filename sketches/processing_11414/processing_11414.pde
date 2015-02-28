

//programa simple de dibujo
//click en mouse para dibujar una recta
//aprieta cualquier tecla para borrar
void setup(){
size(600,600);
smooth();
background(255,255,255);
frameRate(20);
}
void draw(){
stroke(mouseX, 0 , mouseY); //puedo hacer esto mejor?
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 10;
strokeWeight(maxStroke - constrain(distance, 0, maxStroke));
rect(pmouseX, pmouseY, mouseX, mouseY);
}
void mouseClicked(){
//dibuja un rectangulo donde el mouse fue clickeado
rectMode(CENTER);
fill(mouseY,244, mouseX);
noStroke();
rect(mouseX, mouseY, 10, 10);
}
void keyPressed(){
//presiona tecla para borrar el Background
background(255,255,255);
}


