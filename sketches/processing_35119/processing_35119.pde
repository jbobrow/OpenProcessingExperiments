

                
      void setup() {
size(480,100);
smooth();
background (#CC66CC);
}

void draw() {
if(mousePressed) {
fill(#00CC00);
} else {
fill(#CC0033);
}
rect(mouseX, mouseY, 80,80);
}
          
