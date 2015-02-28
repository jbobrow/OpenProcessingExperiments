
void setup() {
 size(screen.width, screen.height); 
 smooth();

 colorMode(HSB, 120);
}

void draw() {
  stroke(mouseX,random(150),mouseY,random(30));
  strokeWeight(random(5));
  fill(mouseX-20,random(255),mouseY,random(10));
  triangle( mouseX, mouseY+50,mouseX+30, mouseX+20,mouseX-40, random(600));
 
}

void mousePressed() {
  background(200);     
}



