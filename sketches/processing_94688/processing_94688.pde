
void setup() {
   size(350, 350);
   background(0);
}

void draw() {
   stroke(255);
   if(mousePressed) {
      line(mouseX, mouseY, pmouseX, pmouseY);}
   
   if(keyPressed) { 
      background (0);}
   
}


