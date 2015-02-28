
int value = 0;

void setup() {
  size(500, 500);//document size
  smooth();

}

void draw() {
  
  background(64); // background color
  noStroke(); // no stroke declared
  
  //head
  fill(#FFFFFF);
  ellipse(250, 250, 450, 450);//Round head
  
  //eyes
  fill(#000000);//Black
  ellipse(150, 150, 100, 100);//Left Eye
  ellipse(350, 150, 100, 100);//Right Eye
  
  //nose
  fill(#f39a1c);//Orange
  ellipse(250, 250, 70, 70);//x, y, width, height
  
  //mouth
  fill(#000000);
  ellipse(220, 400, 50, 50);
  ellipse(280, 400, 50, 50);
  

}


