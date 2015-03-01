
color cornflower = (#6A6DC9); 
  color darkBlue = (#22268B); 
  color stormy = (#9A9CD3); 
  int x; 


void setup () { 
  size (800, 200); 
  background (cornflower); 
}

void draw ()  {

  fill (darkBlue);
  noStroke ();
  ellipse (40, 40, 80, 70); 
  
  x+= 20; 
  if (mousePressed) {
    fill(stormy);
  } else {
    fill(darkBlue);
  }
  ellipse(mouseX, mouseY, 80, 70);
  
} 
