
void setup(){
size (600,600);
background (random(50),20,255);
}
 
 
 void draw(){
   fill(mouseX/2,100,100,100);
   stroke (155,252,0);
   line(mouseX, mouseY, 50, 50);
   line(width-mouseX, height/2-mouseY, 100, 180);
   ellipse(mouseX, mouseY, 50, 50);
 }

