
/*

This is the basis for my monster sketch
matt richard 2013 February

*/

void setup(){
  size( 600, 600);
  smooth();
  rectMode(CENTER);
}

void draw(){
  background(255);
  
  //shoulders
  // style
  rect(280, 500, 500, 700);
  
  //beard
  // style
  triangle(width/2 - 150, height/2 - 50, width/2 + 150, height/2 - 50, width/2, height - 40);
  
  //head
  // style
  ellipse(width/2, height/2 - 50, 300, 300);
  
  //left eye
  // style
  ellipse(240, 200, 50, 50);
  
  //right eye
  // style
  ellipse(360, 200, 50, 50);
  
  //nose
  // style
  triangle(width/2, 210, 330, 280, width/2, 280);
  
  //mouth
  // style
  ellipse(width/2, 340, 10, 30);
  
  
  println(mouseX +"   "+ mouseY);
}
