
void setup(){
   size(400,400);
   colorMode(HSB,100);
   background(99);
   frameRate(10);
}

void draw(){
   fill(random(100), 40, 99);
   noStroke();
   smooth();
   ellipse(mouseX, mouseY, pmouseX/2, pmouseX/2);
}


