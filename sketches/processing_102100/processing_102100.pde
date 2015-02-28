
void setup(){
size(500,500);
smooth();
stroke(170,230,120);
background(150,10,70);
}

void draw(){
strokeWeight(abs((pmouseX-mouseY)/5));
line(pmouseX,mouseY,mouseX,mouseY);
}
