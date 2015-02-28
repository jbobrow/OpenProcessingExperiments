
void setup(){
 size(500,500); 
 background(10, 15, 50);
 smooth();
}

void draw(){
  
  noStroke();
  rectMode(CORNER);
  ellipseMode(CENTER);
  
  fill(0);
  rect(0, 250, 100, 250);
  fill(0);
  rect(100, 320, 100, 180);
  fill(0);
  rect(200, 150, 100, 350);
  fill(0);
  rect(300, 330, 100, 170);
  fill(0);
  rect(400, 410, 100, 90);

  if (mousePressed) {
    fill(mouseX, mouseY, 0, 255);
   } else {
     fill(0);
   }
  ellipse(mouseX, mouseY, 50, 50);
}

