
void setup(){
size (480,120);
smooth(); 
}
void draw() {
if (mouseX > 400) {
for (int y = 0; y <= height; y += 40){
for (int x = 0; x <= width; x += 40){       
fill (255,140,220,220); //fillin arvot on red, green, blue ja alpha
ellipse (x,y,40,40); 
}
}
}
else {
strokeWeight (8);
line (mouseX,20,120,300)
}
}
