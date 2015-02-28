
void setup()
{
  size(800, 500);
background(#522B2B);
  
  fill(116, 116, 116, 200);
  ellipse(2, 3, width*.8, height*2);
  fill(211, 0, 0, 180);
  triangle(0, 0, width*.6, 0, 0, height*.9);
  fill(211, 207, 207, 230);
  ellipse(0, 322, width*.6, height*.8);
  noFill();
  rect(480, 0, width*2, height*2);
  fill(3, 3, 3);
  triangle(482, 0, 799, 0, 645, 171);
  fill(191, 50, 50);
  triangle(481, 0, 480, 300, 645, 171);
  fill(165, 13, 13, 120);
  triangle(799, 0, 799, 292, 645, 171);
  fill(255, 255, 255);
  triangle(480, 301, 800, 296, 645, 171);
  
  fill(227, 0, 0);
  ellipse(555, 420, width*.5, height*.45);
  fill(139, 0, 0);
  ellipse(500, 415, width*.5, height*.45);
  fill(49, 48, 48);
  triangle(481, 274, 481, 500, 195, 500);
  fill(3, 3, 3);
  triangle(481, 276, 300, 278, 300, 418);
 

}
 
void draw()
{
  println("x: " + mouseX + " y: " + mouseY);
}






