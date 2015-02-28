
void setup(){
size (480,120);
smooth();
}

void draw(){
if (mouseX > 200) {
for (int y = 0; y <= height; y +=40) {
for (int x = 0; x <= width; x +=40) {
fill (250,130,240);
ellipse (x,y,40,40);
}
}
}
else {
line (20,20,20,300);
}
}
                
                
                
                
                
                
