
int counter;

void setup(){
size(1000, 1000);
smooth();
}

void draw(){
if(mousePressed){
fill (0);
}else{
fill(225);
}
ellipse(mouseX, mouseY, 90,90);
}
