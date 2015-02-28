
void setup() {
size(400,400);
background(255);
smooth();
}

void draw() {
  background(255);
  int x = mouseX/10;
  ellipse(300 + random(-x, x), 200 + random(-x, x), 200, 200);
  
  fill(0);
  ellipse(300 + random(-x, x), 250 + random(-x, x), 200, 100);
  ellipse(250 + random(-x, x), 150 + random(-x, x), 50, 50);
  ellipse(350 + random(-x, x), 150 + random(-x, x), 50, 50);
  
  fill(random(x,255),random(x,255),random(x,255));
  beginShape();
  vertex(mouseX, mouseY);
  vertex(mouseX+70,mouseY-30);
  vertex(mouseX+60,mouseY-35);
  vertex(mouseX+70,mouseY-40);
  vertex(mouseX+70,mouseY-50);
  vertex(mouseX+80,mouseY-40);
  vertex(mouseX+100,mouseY-45);
  vertex(mouseX+90,mouseY-30);
  vertex(mouseX+100,mouseY-10);
  vertex(mouseX+80,mouseY-20);
  vertex(mouseX+75,mouseY-10);
  vertex(mouseX+75,mouseY-20);
  vertex(mouseX,mouseY+10);
 vertex(mouseX,mouseY);
  endShape();
}
