

void setup() {
  size(800, 800);
  
  
  smooth();
  stroke(12, 13, 200, 12);
   strokeWeight(5);
}

void draw() {
  frameRate(30);
  background(mouseX, mouseY, 70);
  int a = (width/2); // sets up variables for ellipses
  int b = (height/2); // to make them scale with size
  for (int c = mouseX; c > 0; c -= 25) {
   for (int d = mouseY; d > 0; d -= 25) {
  
     ellipse(a, b, c, d); 
     fill(mouseY, mouseX, 40);
    }
  }
}
       
        

