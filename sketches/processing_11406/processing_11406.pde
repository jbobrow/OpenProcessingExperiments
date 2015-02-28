
void setup(){
size(550,700);
smooth();
background(255);
frameRate(34);
}
void draw(){
stroke(mouseY, 20 , mouseX);
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 45;
strokeWeight(maxStroke - constrain(distance, 20, maxStroke));
triangle(pmouseX, pmouseY,100, mouseX, 233, mouseY);
}
void mouseClicked(){
//dibuja un rectangulo donde el mouse fue clickeado
rectMode(CENTER);
fill(mouseY, 255, mouseX);
noStroke();
rect(mouseX, mouseY, 30, 30);
}

void keyPressed(){
//presiona tecla para borrar el Background
size(800,234);
}

