
PImage img;






void setup() {
  size(400,400);
  noSmooth();
  fill(126);
   img = loadImage("see.jpg"); 
}

void draw() {
  if (mousePressed) {
    stroke(500);
    fill(255);
      image(img, 0, 0);
    
  } else {
    stroke(0);
    fill(250);

  }
  ellipse(mouseX, mouseY, 0, mouseY);
  fill(0);
  

    
}



