
void setup(){
size(600,600);
smooth();
background(1,91,106);
frameRate(30);
}
void draw(){
stroke(mouseX, 0 , mouseY); //puedo hacer esto mejor?
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 40;
strokeWeight(maxStroke - constrain(distance, 0, maxStroke));
line(pmouseX, pmouseY, mouseX, mouseY);
}
void mouseClicked(){
//dibuja un rectangulo donde el mouse fue clickeado
rectMode(CENTER);
fill(mouseY, 255, mouseX);
noStroke();
rect(mouseX, mouseY, 30, 30);
}
void keyPressed(){

background(0);
}

