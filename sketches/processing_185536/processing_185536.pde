
int w = 10;
int h = 10; 

void setup() {
  size(400,400);
  background(255);
  ellipseMode(CENTER);
  smooth();
}

void draw() {
}

//when you click
void mouseClicked() {
   
  int x = mouseX-2*w;
  while (x <= mouseX+2*w) {
    ellipse(x, mouseY, w, h);
    x = x + w;

   }
}




