
void setup() {
size(480, 500);
smooth();
}
void draw() {
  fill(230,200,0);
  
if (keyPressed) {
fill(200,20,200);
} else {
fill(0,156,200);
}
ellipse(mouseX, mouseY, 40, 40);




stroke(mouseX,250 , mouseY); 
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 15;
strokeWeight(maxStroke - constrain(distance, 10, maxStroke));
line(pmouseX, pmouseX, mouseX, mouseX);
triangle(pmouseX, pmouseY, mouseX, mouseY, 10, 10);
}
void mouseClicked(){
//dibuja un rectangulo donde el mouse fue clickeado
rectMode(CENTER);
fill(mouseY, 93, mouseX);
stroke(100);
rect(mouseX, mouseY, 60, 60);
}


