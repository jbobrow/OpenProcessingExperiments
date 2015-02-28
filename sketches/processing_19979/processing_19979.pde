
int value = 0;

void setup() {
  size(500, 500);//document size
  smooth();

}

void draw() {
  
  background(64); // background color
  noStroke(); // no stroke declared
  
  //head
  fill(#0707ec);
  ellipse(250, 250, 450, 450);//Round head
  
  //eyes
  fill(#FFFFFF);//White
  ellipse(150, 150, 150, 150);//Left Eye
  rect(280, 150, 150, 50);//Right Eye
  
  //eye pupils
  fill(#000000);//Black
  ellipse(150, 150, 100, 100); //Left eye pupil
  rect(300, 150, 100, 50); //right eye puple
  
  //mouth
  triangle(150,257,400,257,250,425);//mouth shape
  
  //teeth
  fill(#FFFFFF);//White
  rect(170,257,200,25);//Teeth Shape
}


