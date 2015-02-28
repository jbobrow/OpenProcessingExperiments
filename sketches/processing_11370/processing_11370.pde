
//programa simple de dibujo
//click en mouse para dibujar una recta
//aprieta cualquier tecla para borrar
void setup(){
size(500,500);
smooth();
background(132,206,2);
frameRate(1000);
}
void draw(){
stroke(mouseX, 0 , mouseY); //puedo hacer esto mejor?
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 50;
strokeWeight(maxStroke - constrain(distance, 5, maxStroke));
line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed(){
//presiona tecla para borrar el Background
background(0,30,255);
}
void mouseClicked(){
//dibuja un rectangulo donde el mouse fue clickeado
rectMode(CENTER);
fill(mouseY,255,mouseX);
noStroke();
rect(mouseX, mouseY, 60, 60);
}

