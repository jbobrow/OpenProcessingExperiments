
void setup(){
size(480,120);
smooth();

}
void draw(){

if (mouseX > 240) {
for (int y = 0; y <= height; y +=40){
for (int x = 0; x <= width; x += 40){
fill (250,140,220,220); //fillin arvot red, green, blue ja alpha
ellipse (x, y, 40, 40);
 }
 }
 }
 else {
 strokeWeight(8);
 line (mouseX,mouseY,240,mouseY+60);
 for (int y = 0; y <= height; y +=40){
for (int x = 0; x <= width; x += 40){
fill (120,140,220,220); //fillin arvot red, green, blue ja alpha
ellipse (x, y, 40, 40);
}
}

 
 if (mouseX > 240){
  strokeWeight(8);
 fill(229,29,33);
 line (mouseX,mouseY,240,60);
 }              
 else{
  strokeWeight(8);
 fill(100,29,255);
 line (mouseX,mouseY,240,60);
 }
 }
 }
