
size(300, 300);

//top-left rectangle 

fill(88, 87, 162);

rect(0, 0, 150, 150);

//bottom-left rectangle series

fill(110, 109, 155);

translate(width/2.4, height/2.4);

for (int countX=0; countX<width; countX++) {
  for (int countY=0; countY<height;countY++) {
    for (int rectSize=50; rectSize>=5; rectSize-=5) {
      rect(25+(countX*50), 25+(countY*50), rectSize, rectSize);
    }
  }
}


