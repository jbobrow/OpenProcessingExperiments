
void setup() {
  size(300, 300);
}
 
 
void draw() {
  background(138,138,138);
 
  stroke(255);
  fill(57, 199, 204);
  rectMode(CENTER);
  rect(mouseX-10, mouseY+50, 5, 25);
 
  stroke(255);
  fill(57, 199, 204);
  rectMode(CENTER);
  rect(mouseX+10, mouseY+50, 5, 25);
 
 
  noStroke();
  fill(57, 199, 204);
  rectMode(CENTER);
  rect(mouseX, mouseY, 60, 100); 

   stroke(180);
  fill(255);
  rectMode(CENTER);
  rect(mouseX-10, mouseY-20, 20, 20);
 
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(mouseX-10,mouseY-20, 10, 10);
 
   stroke(180);
  fill(255);
  rectMode(CENTER);
  rect(mouseX+10, mouseY-20, 20, 20);
 
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(mouseX+10,mouseY-20, 10, 10);
 
  
  stroke(0);
  fill(50);
  rectMode(CENTER);
  rect(mouseX, mouseY+20, 30, 22);
}

