
void setup(){
size(1024,768);
background(255,255,255);
frameRate(1000);
smooth();
}

void draw(){
noFill();
stroke(0,0,0,50);
bezier(1024, 0, mouseX, mouseY, 500, 500,1024, 768);
}





