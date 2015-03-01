
  

void setup() {
  size(500, 500);
  background(200);
  noLoop();  // draw() will not loop
  noStroke();
  rectMode(CENTER);
}

float x = 0;

void draw() {
   int s = second();
int sRest = s%2;
 
if(sRest>0) {
 
  fill(200);
rect(width/2, height/2, width, height);
fill(230);
rect(mouseX, mouseY, 60, 60);
}

else { 
  fill(50);
rect(width/2, height/2, width, height);
fill(230);
rect(mouseX, mouseY, 60, 60);
}
}

void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
  fill(200);
rect(width/2, height/2, width, height);
fill(230);
rect(mouseX, mouseY, 60, 60);
}

