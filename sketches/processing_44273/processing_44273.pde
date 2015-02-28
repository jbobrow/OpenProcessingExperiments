

void setup(){ 
size (300,400);
smooth();
}
void draw (){
line (mouseX, mouseY, mouseX, mouseY);
line (mouseY, mouseX, mouseY, mouseY*1.5);
line (mouseX*2, mouseX, mouseX*2, mouseY*2);
line (mouseY*2, mouseX, mouseY*2, mouseY*2.5);
line (mouseX*4, mouseX, mouseX*4, mouseY*3);
line (mouseY*4, mouseX, mouseY*4, mouseY*3.5);
}

