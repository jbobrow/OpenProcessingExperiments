
PImage img;
PImage photo;
void setup() {
  size(1700, 850);
  img = loadImage("clouds-fresh-hd-wallpaper copy.jpg");
  photo= loadImage("negative clouds.jpg");
}

void draw() {
if (mouseY>800) {
  image(img, 0,0);
}
if (mousePressed) {
image(photo,0,0);
}
if (mouseX>1700) {
  stroke(0,0,0,0);
  fill(0, 30, 0,50);
  ellipse(mouseX, mouseY-70, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(255,0,250,50);
  ellipse(mouseX, mouseY-70, 30, 30);
}
  
 if (mouseY>650) { 
stroke(0,0,0,0);
  fill(0,0,0,0);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(250,93,0,50);
  ellipse(mouseX, mouseY, 30, 30);
  }
  
  if (mouseY>1700) {
  stroke(0,0,0,0);
  fill(0,250,28,50);
  ellipse(mouseX-70, mouseY-70, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(217,250,0,50);
  ellipse(mouseX-70,mouseY-70, 30, 30);
  }
if (mouseY>1700) {
  stroke(0,0,0,0);
  fill(217,250,0, 50);
  ellipse(mouseX+70, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(0,250,28, 50);
  ellipse(mouseX+70, mouseY,30,30);
  }
  
  if (mouseY>400) {
  stroke(255);
  fill(255);
   line(500, 400, mouseX, mouseY);
  } else {
  fill (255);
   line(500, 400, mouseX, mouseY);
  }
}


