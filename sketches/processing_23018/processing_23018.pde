
void setup() {
size (480,120);
smooth();
noStroke(0);
}
void draw(){
if (mouseX < 400) {
for (int y = 0; y <=height; y +=40){ 
for (int x = 0; x <=width; x +=40){
fill (255,140,220,250);
ellipse (x, y, 40, 40);
}
}
}         
else (
line (20,20,120,300);
}
}
