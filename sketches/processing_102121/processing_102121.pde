
void setup () {
 size(500,500);
 frameRate(30); 
}

void draw() {
  background(100);
  stroke(255);
  fill(frameCount/10);
  rectMode(CENTER);
  rect(width/2, height/2, mouseX + 10, mouseY + 10);
  rect(0, 0, mouseX + 30, mouseY + 30);
  ellipse(width/2, height/2, mouseX + 30, mouseY + 30);
  line(width/2, height/2, mouseX + 30, mouseY + 30);
}

void keyPressed () {
 println(key); 
}
