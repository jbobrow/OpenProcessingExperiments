
void setup(){
size(400,400);
background(255);
smooth();
}
 
void draw(){
   if (mousePressed) { 
    stroke(255);
    fill(0);
triangle(mouseY, mouseX, mouseX,mouseX, 140, mouseY);
    stroke(0);
  fill(255);
ellipse(mouseY, mouseX, mouseY, mouseX);
  }
else 
background(255);
}

