
PImage img;






void setup() {
  size(666,666);
  noSmooth();
  fill(126);
   img = loadImage("k.jpg"); 
}

void draw() {
  if (mousePressed) {
    stroke(500);
    fill(0);
      image(img, 0, 0);
      
    
  } else {
    noStroke();
    fill(255);
    ellipse(mouseX, mouseY, pmouseX, pmouseY);
     

  }
  ellipse(mouseX, mouseY, 0, mouseY);
  fill(255);
  

    
}



