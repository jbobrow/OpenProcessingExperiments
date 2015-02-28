
int a, b, c, d, e, f;
int xPos, yPos;
void setup () {
  size (500, 500);
  smooth(); 
}

void draw () {
  stroke(random(255), random(255), random(255), 30);
  line(pmouseX, pmouseY, mouseX, mouseY);
  println(mouseX + ", " + mouseY); 
  background(100); 
  fill (255, 255, 255, 100);
  stroke (random(255), random(255), random(255)); 
  ellipse (mouseX, mouseY, 100, 100);
  fill (random(255), random(255), random(255));
  ellipse (mouseX - 50, mouseY, 10, 10);    
  fill (random(255), random(255), random(255));
  ellipse (mouseX, mouseY - 50, 10, 10);
  fill (random(255), random(255), random(255));
  ellipse (mouseX + 50, mouseY, 10, 10);
  fill (0);
  rect (mouseX - 25, mouseY  + 15, 45, 15);
  fill (255, 255, 255, 100);
  stroke (random(255), random(255), random(255)); 
  ellipse (mouseX, mouseY + 90, 50, 100);
  stroke (random(255), random(255), random(255));
  rect(mouseX + 10, mouseY + 150, 20, 10);
  stroke (random(255), random(255), random(255));
  rect(mouseX + 10, mouseY + 150, 20, 10);
  stroke (random(255), random(255), random(255));
  rect(mouseX -25, mouseY + 145, 20, 10);
  noFill();
  stroke (mouseX, mouseY, mouseX);
  curve(a, b, mouseX + 10, mouseY + 100, c, d, e, f);
  stroke (mouseY, mouseX, mouseY);
  curve(b, a, mouseX + 10, mouseY + 100, d, f, c, e);
  stroke (mouseX, mouseX, mouseY);
  curve(e, c, mouseX + 10, mouseY + 100, a, b, f, e);
  stroke (mouseY, mouseY, mouseX);
  curve(f, e, mouseX + 10, mouseY + 100, d, b, a, c);
  stroke (mouseX, mouseX, mouseX);
  curve(c, f, mouseX + 10, mouseY + 100, a, d, b, e);
  stroke (mouseY, mouseY, mouseY);
  curve(d, d, mouseX + 10, mouseY + 100, a, e, f, b);
  if (mouseX < 250) {
    strokeWeight(7);
  } else {
    strokeWeight(2);
  }  
}

void mousePressed () {     
   a = int(random(500));
   b = int(random(500));
   c = int(random(500));
   d = int(random(500));
   e = int(random(500));
   f = int(random(500));
}

