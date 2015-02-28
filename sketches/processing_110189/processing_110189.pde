
void setup()
{
  size(320, 470);
  background(#F5F5F5);
 
  noStroke();
  fill(#24429B, 200);
  quad(145, 68, 260, 100, 210, 392, 25, 349);
  fill(#EDC939, 200);
  quad(164, 328, 236, 348, 216, 443, 144, 427);
  fill(#CE0A0A, 170);
  triangle(187, 110, 147, 272, 244, 296);
  

  fill(#000000);
  ellipse(115, 170, 150, 150);
  fill(#F5F5F5);
  ellipse(115, 170, 95, 95);
  fill(#CE0A0A);
  ellipse(115, 170, 30, 30);
  ellipse(232, 53, 20, 20);
    
  ellipse(61, 382, 15, 15);
  
  fill(#000000);
  triangle(207, 27, 83, 447, 108, 454);

  
  
  stroke(#000000);
  strokeWeight(2);
  strokeCap(SQUARE); 
  line(25, 267, 308, 337);
  line(25, 255, 308, 325);
  line(25, 243, 308, 313);
  line(13, 93, 166, 44);
  line(166, 44, 245, 297);
  strokeWeight(1);
  line(96, 278, 82, 40);
  line(169, 452, 183, 359);
  line(183, 359, 248, 372);
  strokeWeight(2);
  noFill();
  stroke(#CE0A0A);
  arc(82, 45, 15, 30, PI, TWO_PI);

  stroke(#000000);
  fill(#FFFFFF);
  rect(230, 130, 49, 49);
  strokeWeight(1);
  fill(#000000);
  rect(230, 130, 16, 16);
  rect(246, 146, 16, 16);
  rect(262, 130, 16, 16);
  rect(230, 162, 16, 16);
  rect(262, 162, 16, 16);

  strokeWeight(5);
  noFill();
  ellipse(244, 295, 30, 30);
  
  curve(0, 600, 16, 379, 268, 230, 400, 500);
  

  
}
 
void draw()
{
  println("x: " + mouseX + " y: " + mouseY);
}



