
void setup() {
size (480,120);
smooth();

}
void draw() {
if (mouseX < 200) {
for (int y = 0; y <= height; y +=40){
for (int x = 0; x <= width; x += 40){
fill (250,140,220,220); //fillin arvot red, green blue ja alpha
ellipse (x, y, 40, 40);
 }
 }
 }                 
 else {
 strokeWeight(500);
 line (mouseX);
 }
 }      
