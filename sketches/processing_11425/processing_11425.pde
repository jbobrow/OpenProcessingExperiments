
//si copias este codigo en Processing, veras como funciona la foto
void setup(){
smooth();
background(0);
frameRate(8); 
size (500, 700);
background(0);
stroke(5,248,222); //borde negro
strokeWeight(30); //borde grueso
}


void draw(){

stroke(mouseX, 0, mouseY); //puedo hacer esto mejor?
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 20;
strokeWeight(maxStroke - constrain(distance, 0, maxStroke));
line(pmouseX, pmouseY, mouseX, mouseY);
line (pmouseX, pmouseY, mouseX, mouseY);
if (mousePressed) {

}

ellipse(mouseX, mouseY, 50, 50);
line(500,20,0,height);
line(700,80,0,height);
line(900,100,0,height);
int x = 60;
line(300,10,0,height);
x = x + 20;
line(1100,200,0,height);

rectMode(CENTER);
fill(mouseY, 0, mouseX);
noStroke();
rect(mouseX, mouseY, 40, 40);
}
void keyPressed(){
//presiona tecla para borrar el Background
background(0);

}


