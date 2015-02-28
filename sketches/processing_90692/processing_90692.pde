
void setup(){
size(480,240);
smooth();
}

void draw(){
if (mousePressed){
background(255,120);
fill(21,88,190);
}
else{
ellipse(mouseX,mouseY,30,30);
fill(random(0,255),random(0,255),random(0,255),120);
}
}
