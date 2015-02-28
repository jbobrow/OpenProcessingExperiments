
void setup() {
 size(200, 200); 
}

void draw() {
 background(255);
 stroke(0);
 line(100, 0, 100, 200);
 line(0, 100, 200, 100);
 
 noStroke();
 fill(0);
 if( mouseX < 100 && mouseY < 100) {
   rect(0,0,100,100);
   
 } else if (mouseX > 100 && mouseY < 100) {
   rect(100, 0, 100, 100); 
 
   } else if ( mouseX < 100 && mouseY > 100) {
    rect(0, 100, 100, 100);
   
 } else if (mouseX > 100 && mouseY > 100) {
    rect(100,100,100,100);
   } 
   
}
