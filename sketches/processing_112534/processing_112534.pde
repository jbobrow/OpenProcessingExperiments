
void setup() {
size(500, 500);  
rectMode(CENTER);
noStroke();
fill(241,245,35);
}  void draw() {
background(222,157,157);
rect(width-mouseX, height-mouseY, 50, 50);
rect(mouseX, mouseY, 100, 100); 
}
