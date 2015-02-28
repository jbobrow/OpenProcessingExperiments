
void setup() 

{ // Set the size of the window
size(400,400);
smooth();
frameRate(30);
}

void draw() { 
  
  // Draw a white background 
  background(mouseX,0,0);
  
// Set ellipses and rects to CENTER mode 
ellipseMode(CENTER); 
rectMode(CENTER);

// cuadro
strokeWeight(4);
stroke(0);
fill(255); 
rect(mouseX,mouseY,200,200);

// colmillos
fill(0);
triangle(mouseX-50,mouseY+40,mouseX-34,mouseY+40,pmouseX-42,pmouseY+63);
triangle(mouseX+50,mouseY+40,mouseX+34,mouseY+40,pmouseX+42,pmouseY+63);

// ojos
fill (0);
ellipse(mouseX-66,mouseY-50,16,16); 
ellipse(mouseX+66,mouseY-50,16,16);

}
void mousePressed() 


{ 
  println("Latostadorano!");
}

