
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
  background(0);
  
  //shoulders
  fill(60, 100, 50);
  rect(280, 500, 500, 700);
  
  //left breast
  fill(60, 100, 50);
  ellipse(width/2 - 120, height - 50, 240, 300);
  
  //right breast
  fill(60, 100, 50);
  ellipse(width/2 + 100, height - 50, 200, 300);
  
  // cover clevage
  fill(60, 100, 50);
  noStroke();
  rect(width/2 - 20, height - 170, 460, 150);
  
  //beard
  fill(225, 170, 140, 128);
  strokeWeight(2);
  stroke(45, 40, 25, 128);
  triangle(width/2 - 145, height/2 - 50, width/2 + 145, height/2 - 50, width/2, height - 40);
  
  //head
  fill(150, 140, 100);
  stroke(15, 14, 10, 128);
  ellipse(width/2, height/2 - 50, 300, 300);
  
  //left eye
  fill(40, 35, 30);
  stroke(10, 90, 100);
  strokeWeight(20);
  ellipse(240, 200, 50, 50);
  
  //right eye
  fill(40, 35, 30);
  stroke(10, 90, 100);
  strokeWeight(20);
  ellipse(360, 200, 50, 50);
  
  //nose
  // style
  fill(165, 155, 115);
  noStroke();
  triangle(width/2, 210, 330, 280, width/2, 280);
  
  //mouth
  fill(60, 35, 30);
  stroke(80, 50, 45, 128);
  strokeWeight(4);
  ellipse(width/2, 340, 180, 30);
 
}
