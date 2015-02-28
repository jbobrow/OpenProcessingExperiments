
void setup() { 
  
size(500, 500); 
smooth();
background(245,13,63);
}
void draw() { 
if (mousePressed) {

fill(178,0,124);
} else {
fill(233,96,126); 
}
ellipse(mouseX, mouseY, 20, 20);}


