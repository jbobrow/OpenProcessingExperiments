
// width and height are built in.
int centerX = 600 / 2;
int centerY = 600 / 2;
 
void setup() {
  size(600, 600); // window
  background(255, 0, 40); // color
  
}
 
void draw() {
  background(255,255,255);
  strokeWeight(10); // outline thickness
  stroke(57, 240, 2, 128); // color
  noFill();
  
  
  stroke( 255, 3, 192 ,255);
  triangle(30, 150, 58, 160, 86, 150);
  triangle( 130, 150, 150, 160, 180, 150);
  triangle( 230, 150, 250, 160, 280, 150);
  triangle( 330, 150, 350, 160, 380, 150);
  triangle( 430, 150, 450, 160, 480, 150);
  triangle( 530, 150, 550, 160, 580, 150);
  
  
  
  
  strokeWeight(10);
  stroke( 5, 5, 5, 255);
  line(0, 200, 1000, 200);
  line(0, 95, 1000, 100);
  fill(255, 0, 4, 255);
  rect(300, 200, 550, 550);
  
 
 
  strokeWeight(10);
  stroke( 7, 0, 255, 255);
  fill(7, 0, 255, 255);
  ellipse(40, 46, 55, 55);
  
  stroke( 0, 255, 31, 255);
  fill(0, 255, 31, 255);
  ellipse(120, 46, 55, 55);
  
  stroke( 255, 243, 0, 255);
  fill(255, 243, 0, 255);
  ellipse(200, 46, 55, 55);
  
  stroke( 255, 21, 0, 255);
  fill(255, 21, 0, 255);
  ellipse(280, 46, 55, 55);
  
  stroke( 255, 243, 0, 255);
  fill(255, 243, 0, 255);
  ellipse(360, 46, 55, 55);
  
  stroke( 0, 255, 31, 255);
  fill(0, 255, 31, 255);
  ellipse(440, 46, 55, 55);
  
  stroke( 7, 0, 255, 255);
  fill(7, 0, 255, 255);
  ellipse(520, 46, 55, 55);
  
  rect(30, 300, 55, 55, 3, 6, 12, 18);
  
  stroke( 255, 243, 0, 255);
  fill(255, 243, 0, 255);
  rect(30, 400, 55, 55, 3, 6, 12, 18);
  
  rect(130, 300, 55, 55, 3, 6, 12, 18);
  
 stroke( 0, 255, 31, 255);
  fill(0, 255, 31, 255);
  rect(230, 300, 55, 55, 3, 6, 12, 18);
  
  stroke( 255, 21, 0, 255);
  fill(255, 21, 0, 255);
  rect(230, 400, 55, 55, 3, 6, 12, 18);
  
 
  
  
}


