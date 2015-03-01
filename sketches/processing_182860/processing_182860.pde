
void  setup() {
  size(640, 360);
  noStroke();
}

void  draw() {
  background(#5F400D);

  fill(#41B0E5);
  ellipse(220, 144, 172, 172);

fill(#FFFFFF);
  ellipse(220, 144, 72, 72);

  fill(#41B0E5);
  ellipse(420, 144, 172, 172);


  fill(#FF0537);
  rect(90, 281, 465, 10);

  //fill(255);
  text(mouseX +"," + mouseY, 20, 20);

  fill(#FFFCFD);
  rect(100, 247, 43, 33);

  fill(#FFFCFD);
  rect(200, 247, 43, 33);

  fill(#FFFCFD);
  rect(300, 247, 43, 33);

  fill(#FFFCFD);
  rect(500, 247, 43, 33);

  stroke(110);
  triangle(30, 85, 58, 220, 86, 75);
  
  
}

  


