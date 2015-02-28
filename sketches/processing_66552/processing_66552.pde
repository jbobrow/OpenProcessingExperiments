
void setup() {
  size(500, 500);
  background(244);
}
 
void draw() {
  fill(244);
  stroke(0);
  strokeWeight(9);
  rect(127, 112, 175, 165);
 
  fill(244);
  stroke(0);
  strokeWeight(9);
  rect(127, 280, 175, 145);
   
  //black
  fill(0);
  stroke(0);
  strokeWeight(9);
  rect(127, 430, 175, 145);
   
  //blue
  fill(71, 56, 115);
  stroke(0);
  strokeWeight(9);
  rect(27, 280, 100, 145);
   
  //red
  fill(255,0,0);
  stroke(0);
  strokeWeight(10);
  rect(304, 10, 175, 145);
  
  fill(244);
  stroke(0);
  strokeWeight(9);
  rect(302, 162, 140, 219);
   
  //yellow
  fill(255,255,0);
  stroke(0);
  strokeWeight(9);
  rect(302, 382,80, 80);
   
  //triangle top left
  fill(255);
  noStroke();
  triangle(0,0,0,250,250,0);
   
  //triangle bottom left
  fill(255);
  noStroke();
  triangle(0,250,0,500,250,500);
   
  //triangle top right
  fill(255);
  noStroke();
  triangle(250,0,500,0,500,250);
   
  //triangle top right
  fill(255);
  noStroke();
  triangle(500,250,500,500,250,500);
}
