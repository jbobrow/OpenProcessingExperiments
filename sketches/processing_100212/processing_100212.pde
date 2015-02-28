
void setup(){
   size(700,400);
   colorMode(HSB,100);
   background(100);
   frameRate(1000);
}

void draw(){
   fill(random(99), 50, 99);
   noStroke();
   smooth();

   ellipse(mouseX, mouseY, pmouseX/5, pmouseX/5);
} 

void mousePressed(){
   if(mouseButton == LEFT) {
     noStroke();
   fill(99,100);
   rectMode(CORNER);
   rect(0, 0, 700, 400);
   }
}
