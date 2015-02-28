
void setup() {
  size(400,400);
  background(0);
}



void draw() {
 if (mousePressed){
line(mouseX, mouseY, pmouseX, pmouseY);}
   fill((mouseY-mouseX)/.5, mouseX/5, mouseX/.9);
   stroke((mouseY-mouseX)/.5, mouseX/5, mouseX/.9);
   strokeWeight(2);
  
   
   
}

void mouseReleased(){
  background(0);}

