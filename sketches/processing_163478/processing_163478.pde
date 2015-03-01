
PImage img;
PImage photo;
void setup() {
  size(400, 400);
  img = loadImage("us-flag.gif");
  photo= loadImage("wafflez2.jpg");
}

void draw() {
if (mousePressed) {
image(photo,0,0);
}

if (mouseY>250) {
  image(img, 0,0);
}

if (mouseX>200) {
  stroke(0,0,0,0);
  fill(250, 93, 0,50);
  ellipse(mouseX, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(255,0,250,50);
  ellipse(mouseX, mouseY-15, 30, 30);
}
  
 if (mouseX>200) { 
stroke(0,0,0,0);
  fill(255,0,250,50);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(250,93,0,50);
  ellipse(mouseX, mouseY, 30, 30);
  }
  
  if (mouseY>200) {
  stroke(0,0,0,0);
  fill(0,250,28,50);
  ellipse(mouseX-15, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(217,250,0,50);
  ellipse(mouseX-15,mouseY-15, 30, 30);
  }
  
  if (mouseY>200) {
  stroke(0,0,0,0);
  fill(217,250,0, 50);
  ellipse(mouseX+15, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(0,250,28, 50);
  ellipse(mouseX+15, mouseY,30,30);
  }
  
  if (mouseY>200) {
  stroke(0);
  fill(0);
  ellipse(200, 200, 100, 100);
  } else {
  stroke (255);
  fill (255);
  ellipse(200, 200, 100, 100);
  }
  

  
}



