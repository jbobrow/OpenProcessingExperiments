
void setup() {
  size(500,500);
  strokeWeight(3);
}

void draw() {
  
  // Paint background
  background(209,255,255);
  fill(255,234,0);
  
  // Save world reference point here.
  pushMatrix();
  
  // Move world reference point in response to mouse cursor.
  int targetX = mouseX-150;
  int targetY = mouseY-150;
  if (targetX > 50)
    targetX = 50;
  translate(targetX, targetY);
  
  // Paint monster's head
  triangle(50,50,250,50,150,200);
  fill(0,93,42);
  
  // Paint monster's mouth
  smooth();
  ellipse(135,135,32,16);
  fill(255,255,255);
  
  // Paint monster's fangs
  triangle(130,131,132,162,136,135);
  triangle(136,131,138,162,142,135);
  
  // Paint monster's left eye
  ellipse(95,80,16,30);   
  fill(0);
  ellipse(95,80,8,15);
  
  // Paint monste's right eye
  ellipse(180,80,16,30);
  fill(255,255,255);
  ellipse(180,80,8,15);
  
  // Paint monster's legs
  line(154,196,158,245);
  line(146,196,142,245);
  
  // Paint monster's ears
  ellipse(50,50,5,5);
  ellipse(250,50,5,5);
  
  // Restore world reference here
  popMatrix();
}

