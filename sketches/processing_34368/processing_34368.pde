
void setup(){
size(400,400);
smooth();
background(255);
frameRate(30);
}
void draw(){
stroke(mouseX, 0 , mouseY); //puedo hacer esto mejor?
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 25;
strokeWeight(maxStroke - constrain(distance, 0, maxStroke));
line(pmouseX, pmouseY, mouseX, mouseY);
}
void mouseClicked(){
//dibuja un rectangulo donde el mouse fue clickeadorectMode(CENTER);
fill(mouseY, 255, mouseX);
noStroke();
ellipse(mouseX, mouseY, 30, 30);
ellipse(40,40,mouseX,mouseY);
ellipse(mouseX,mouseY,60,60);
ellipse(pmouseX,pmouseY,mouseX,mouseY);

}
void keyPressed(){
//presiona tecla para borrar el Background
background(0);


}

