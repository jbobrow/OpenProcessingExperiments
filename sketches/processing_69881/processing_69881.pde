
void setup() {
  background(0);
  size(1000,1000);
}

void draw() {
  smooth();
  noFill();
  
  
  stroke(300,mouseY,mouseX);
  strokeWeight(0.1);
  line(0, 0, mouseX, mouseY);
  line(800, 0, mouseX, mouseY);
  line(0, 600, mouseX, mouseY);
  line(800, 600, mouseX, mouseY);

   }
   
   //I tried to make a work that I can apply to my photography or video work. I had some problems with the red lines that exist from the start, do I need to have a mousePressed action to avoid this?

