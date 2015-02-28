
size(300, 300);

//top-left circle-in-rectangle 
noFill();

rect(0,0,150,150);
fill(110,109,155);

ellipseMode(CORNER);

ellipse(0, 0, 150, 150);

//horizontal rectangle series

fill(110, 109, 155);

translate(width/2.4, height/185);

for (int countY=0; countY<width; countY++) {
  for (int rectSize=50; rectSize>=5; rectSize-=5) {
    rect(25+(countY*50), width/2, rectSize, rectSize);
  }
}


