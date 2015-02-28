
void setup(){
size (1000,1000);
background (0);
colorMode(HSB);
}
 
 
 void draw(){
   float vt = dist(mouseX,mouseY,pmouseX,pmouseY);
   strokeWeight(vt/20);
   stroke (random(120),random(250),250,120);
   line(mouseX, mouseY, 800, 500);
 
 }
