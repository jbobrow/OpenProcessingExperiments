
void setup(){
size(400,400);
smooth();
background(599,74,789);
frameRate(90);
}
void draw(){
stroke(mouseX, 360 , mouseY); //puedo hacer esto mejor?
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 300;
strokeWeight(maxStroke - constrain(distance, 180, maxStroke));
line(pmouseX, pmouseY, mouseX, mouseY);
}
void mouseClicked(){
//dibuja un rectangulo donde el mouse fue clickeado
ellipseMode(CENTER);
fill(mouseY, 27790, mouseX);
noStroke();
ellipse(mouseX, mouseY, 80, 30);
}
void keyPressed(){
//presiona tecla para borrar el Background
background(2290,649,367);
}

