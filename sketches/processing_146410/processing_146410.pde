
void setup() {
 size(720, 480);
 background(0);
}


void draw() {
 smooth();
 if (mousePressed && (mouseButton == LEFT)) 
 {
   line(pmouseX, pmouseY, mouseX, mouseY);
   if (keyPressed) {
     if (key == 'p' || key == 'P') {
       triangle(pmouseX, pmouseY, mouseX, mouseY, mouseX, mouseY);
       stroke(255,0,0);
       strokeWeight(random(10));
     }
   } 
   if (keyPressed) {
     if (key == 'o' || key == 'O') {
     triangle(pmouseX, pmouseY, mouseX, mouseY, 360, 240);
       stroke( random(255),random(255),random(255)); 
       strokeWeight(10); 
   }
   } else {
     stroke(255);
     strokeWeight(10);
   }
 }
 if (mousePressed && (mouseButton == RIGHT)) {
   background(0);
 }
}


