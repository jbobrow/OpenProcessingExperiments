

void setup() {
   size(screen.width, screen.height); 
   colorMode(HSB, 500, 100, 600);
   background(#524F52);
   smooth();
   frameRate(5);
}


void draw() {
  noStroke();
 fill(random(500),100,600,random(120));
  ellipse( mouseX, mouseY, 10, 10); 
  ellipse(mouseX+40, mouseY+200,random(400), random(400));
  triangle( mouseX, mouseY,pmouseX, pmouseY,pmouseX+20, pmouseY+20);
}

