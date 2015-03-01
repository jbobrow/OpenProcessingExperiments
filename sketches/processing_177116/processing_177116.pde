
void setup(){
size(500,500);
smooth();
}

void draw(){
if(mousePressed) {
stroke(255,255,255,0)
fill(mouseX,mouseY,255,mouseX);
}else{
stroke(255,255,255,0)
fill(mouseY,mouseX,255,mouseY);
}
ellipse(mouseX,mouseY,mouseX,mouseY/5);
}
