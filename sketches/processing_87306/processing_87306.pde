
float w=1;

void setup() {
size (600,400);
background(255);
noStroke();
fill(0,1);
}

void draw() {
if (constrain((20/dist(mouseX,mouseY,pmouseX,pmouseY),20)>w){w++;}
if (constrain((20/dist(mouseX,mouseY,pmouseX,pmouseY),20)<w){w--;}

strokeWeight(w);
stroke(255,0,0);
line(mouseX,mouseY,pmouseX,pmouseY);
noStroke();
}
