
void setup() {
size(400, 400);
background(255);
smooth();
}

void draw () {
  stroke(1, 1, 1, 20);
  line(mouseX, mouseY, random(400), random(400));
  line(random(400), random(400), mouseX, mouseY);
}            
                
