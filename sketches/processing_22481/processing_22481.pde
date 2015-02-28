
//KYLE LLESES
//PROBLEM SET 2 - 3
//BRUSH PATTERN 1 SHOWS WHEN MOUSE IS DRAGGED
//WHILE PATTERN 2 SHOWS WHEN ANY KEY IS PRESSED

void setup() {
  size(500,500);
  background(255);
  smooth();
}

//brush actions
void draw() {
  if (mousePressed) {
    brushpatternone(mouseX, mouseY);
  } 
  else if (keyPressed) { 
    brushpatterntwo (mouseX, mouseY);
  }
 
}

//PATTERN 1
void brushpatternone(int x, int y) {     
  noStroke();

  fill(random (139), random (34), 82);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,80,5);
  ellipse (mouseX,mouseY,5,80);
  fill (205, 50, 120);
  ellipse (mouseX,mouseY,45,45);
  fill(139,34, 82);
  ellipse (mouseX,mouseY,40,40);
  fill(255, 62, 150);
  ellipse (mouseX,mouseY,35,35);
  fill(139, 28, 98);
  ellipse (mouseX,mouseY,30,30);
  fill(205, 41, 144);
  ellipse (mouseX,mouseY,25,25);
  fill(139,34, 82);
  ellipse (mouseX,mouseY,20,20);
  fill (255, 62, 150);
  ellipse (mouseX,mouseY,15,15);
  fill(random (205), random (50), 120);
  ellipse (mouseX,mouseY,10,10);
  fill(139,34, 82);
  ellipse (mouseX,mouseY,5,5);
}

//PATTERN 2
void brushpatterntwo (int x, int y) {
   fill(random (139), random (34), 82);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,80,5);
  ellipse (mouseX,mouseY,5,80);

}


