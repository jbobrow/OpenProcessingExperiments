




void setup(){
size(700,300);
smooth();
background(217,231,223);
frameRate(50);
}
void draw(){
stroke(mouseX, 35 , mouseY, 82);
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 20;
strokeWeight(maxStroke - constrain(distance, 20, maxStroke));
triangle(pmouseX, pmouseY, mouseX, mouseY, 15,60);
}
void mouseClicked(){
//dibuja rect. despues del click y cambia de color
rectMode(CENTER);
fill(mouseY, 160, mouseX);
noStroke();
rect(mouseX, mouseY, 90, 60);
}
void keyPressed(){
//presiona tecla para borrar el Background
background(192,200,183);
} 
 
 


