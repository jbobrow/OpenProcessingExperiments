
void setup(){
size(900,400);
smooth();
background(255);
frameRate(80);
}
void draw(){
stroke(mouseX, 100 , mouseY, 60); 
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 120;
strokeWeight(maxStroke - constrain(distance, 5, maxStroke));
quad(pmouseX, pmouseY, mouseX, mouseY, 40, 40, 10, 10);
}
//se crean fractales
void mouseClicked(){
line(pmouseX, pmouseY, mouseX, mouseY);
fill(mouseY, 25, mouseX, 30);
noStroke();
line(mouseX, mouseY, 10, 50);
}
void keyPressed(){
background(255);
//el fondo vuelve a blanco al apretar una tecla
}


