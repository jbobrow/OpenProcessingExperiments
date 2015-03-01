
PImage img;
PImage photo;
void setup() {
  size(1000, 1000);
  tint(255,255);
  img=loadImage("corn.jpg");
  tint(255,127);
  img = loadImage("kitten.jpg");
  tint(255,155);
  photo= loadImage("unicorn.jpg");
  

}

void draw() {
if (mousePressed) {
image(photo,0,0);
}

if (mouseY>500) {
  image(img, 0,0);
}

if (mouseX>700) {
  stroke(0,0,0,0);
  fill(90, 100, 90,20);
  ellipse(mouseX, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(255,0,250,50);
  ellipse(mouseX, mouseY-15, 30, 30);
}
  
 if (mouseX>500) { 
stroke(0,0,0,0);
  fill(255,0,250,50);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(250,93,0,50);
  ellipse(mouseX, mouseY, 30, 30);
  }
  
  if (mouseX>500) { 
stroke(0,0,0,0);
  fill(255,0,250,50);
  ellipse(mouseX, mouseY, 90, 90);
  } else {
  stroke(0,0,0,0);
  fill(250,93,0,50);
  ellipse(mouseX, mouseY, 90, 90);
  }
  
  if (mouseY>200) {
  stroke(0,0,0,0);
  fill(0,250,99,50);
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
  
}


