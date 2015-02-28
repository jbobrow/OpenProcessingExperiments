
void setup(){
size(480,120);
smooth();
}
void draw(){   
line(mouseX,mouseY,mouseX,mouseY);
line(mouseY,mouseX,mouseY,mouseX);
line(mouseX,mouseX,mouseX,mouseY);
line(mouseY,mouseY,mouseX,mouseY);
line(mouseY,mouseY,mouseX,mouseY);
line(mouseX,mouseY,mouseY,mouseX);

}

