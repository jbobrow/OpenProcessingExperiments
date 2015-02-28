
void setup(){
size (200,200); // Set the size of the window
smooth(); // Enable anti aliasing
frameRate(30); // set framerate
}

void draw(){
background (255); // Draw a white background.
stroke(0); // Make lines black
fill(255); // Fill in shapes White.

ellipse(mouseX,mouseY-20, 80, 50); // Create an ellipse.
fill(220);
triangle(mouseX+40,mouseY-13,mouseX+40,mouseY+20,mouseX+60,mouseY-13);
triangle(mouseX-40,mouseY-13,mouseX-40,mouseY+20,mouseX-60,mouseY-13);

fill(200);
rectMode(CENTER);
rect(mouseX,mouseY+40,20,70);

fill(mouseX,0,mouseY);
ellipse(mouseX+20,mouseY-20,30,30);
ellipse(mouseX-20,mouseY-20,30,20);
}

void mousePressed(){
  println("Help me.");
}



