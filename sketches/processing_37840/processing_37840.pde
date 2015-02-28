
size(300, 300);
colorMode(RGB,width);
background(0);

int circSize=10;

translate(width/2, height/2); //sets origin to the center of the composition

for (int i=0; i<360; i+=circSize) { //creates outer set of ellipse (yellow)
  pushMatrix();
  rotate(radians(i)); //causes the ellipse to rotate
  translate(100, 0); //sets the origin 100 pixels from the center of the composition
  fill(width,width,i);
  ellipse (0, 0, circSize, circSize);
  popMatrix();
}

for (int i=0; i<360; i+=circSize) { //creates the middle set of ellipse (blue)
  pushMatrix();
  rotate(radians (i)); //causes the ellipse to rotate
  translate(80, 0); //sets the origin 80 pixels away from the center of the composition
  fill(0,i,width);
  ellipse(0, 0, circSize, circSize);
  popMatrix();
}

for(int i=0;i<360; i+=circSize){ //creates teh last set of ellipse (purple)
  pushMatrix();
  rotate(radians(i));
  translate(60,0); //sets the origin 60 pixels away from the center of the composition
  fill(width,i,width);
  ellipse(0,0,circSize,circSize);
  popMatrix();
}


for (int i=0; i<360; i+=circSize) { //creates teh dividing lines
  pushMatrix();
  rotate(radians(i));
  stroke(255);
  line(0, 0, circSize*10, circSize*5);
  popMatrix();
}


