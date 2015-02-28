
float randomSize;
float randomSize2;
void setup() {
   size(300, 300);
   background(255);
   smooth();
}
void draw() {}
void mousePressed() {
   noStroke();
   randomSize=random(10,50);
   randomSize2=random(10,50);
   fill(0,0,0);
   rect(mouseX+2,mouseY+2,randomSize,randomSize2);
   fill(random(255),random(255),random(255));
   rect(mouseX,mouseY,randomSize,randomSize2);
 
   
}
void keyPressed() {
   background(255);
}

