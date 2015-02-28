
size(300, 300);
noStroke();
background(0);

for (int i=0; i<360; i+=20) {  //Blue Circes
  fill(0, 0, 255, 50);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(i));
  translate(100, 0);
  ellipse(0, 0, 20, 20);
  popMatrix();
}
for (int i=5; i<360; i+=20) {  //Red circles
  fill(255, 0, 0, 50);
  pushMatrix();
  translate(width/3, 2*height/3);
  rotate(radians(i));
  translate(100, 0);
  ellipse(0, 0, 20, 20);
  popMatrix();
}

for (int i=10; i<360; i+=20) {  //Green Circles
  fill(0, 255, 0, 50);
  pushMatrix();
  translate(2*width/3, height/3);
  rotate(radians(i));
  translate(100, 0);
  ellipse(0, 0, 20, 20);
  popMatrix();
}

for (int x=0; x<360; x+=10) {  //Radiating Lines about the top left corner
  pushMatrix();
  rotate(radians(x+5));
  stroke(255);
  line(0, 0, width, height); 
  popMatrix();
}


