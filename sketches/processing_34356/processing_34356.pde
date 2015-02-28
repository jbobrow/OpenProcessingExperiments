
void setup(){
size(400,400);
smooth();
background(0);
frameRate (30);
}

void draw (){
stroke(mouseX,0,mouseY);
float distance= dist (pmouseX,pmouseY,mouseX,mouseY);
float maxStroke = 15;
strokeWeight (maxStroke-constrain(distance,0,maxStroke));
line(pmouseX,pmouseY,mouseX,mouseY);
}

void mouseclicked (){
rectMode(CENTER);
fill(100,100,mouseX,mouseY);
}

void KeyPressed() {
background (255);
}
void mousePressed (){
background (0,118,18);
}

