
void setup(){
size(600,400);
smooth();
background(192,200,183);
frameRate(80);
}
void draw(){
stroke(mouseX, 80 , mouseY, 90); 
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 60;
strokeWeight(maxStroke - constrain(distance, 6, maxStroke));
rect(pmouseX, pmouseY, mouseX, mouseY, 20,40,60,40);
}
void mouseClicked(){
//dibuja un rectangulo donde el mouse fue clickeado
rectMode(CENTER);
fill(mouseY, 200, mouseX);
noStroke();
rect(mouseX, mouseY, 90, 60);
}
void keyPressed(){
//presiona tecla para borrar el Background
background(192,200,183);
}

