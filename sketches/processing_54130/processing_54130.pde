
void setup() {
size(450,450);
strokeWeight(5);
smooth();
stroke(0,102);
}

void draw(){
for(int i=0; i<width; i+=10){
stroke(random(255),random(128),random(128));
}
line (mouseX,mouseY,pmouseX,pmouseY);
for(int i=0; i<width; i+=10){
if (mousePressed == true) {
line(mouseX, mouseY, pmouseX, pmouseY);
stroke(random(128),random(255),random(255));
}
}
}
