
//Image is from link http://fc03.deviantart.net/fs71/i/2010/075/6/d/Abstract__Geometric_by_Kotsuso.jpg
void setup()
{
  //layer 0 - white background
  size(450, 600);
  background(#FFFFFF);
  strokeWeight(5);
}

void draw()
{
  //layer 1 - black
  stroke(#030303);
  fill(#030303);
  rect(0, 0, 150, 160);
  triangle(205, -35, 205, 130, 305, 130);
  ellipse(225, 320, 300, 300);
  rect(0, 500, 150, 100);
  rect(304, 472, 200, 200);
  
  //layer 2 - maroon
  stroke(#932E2E);
  fill(#932E2E);
  rect(25, 30, 140, 315);
  rect(377, 0, 73, 250);
  triangle(0, 388, 0, 474, 180, 388);
  rect(25, 480, 165, 90);
  
  //layer 3 - black
  stroke(#030303);
  fill(#030303);
  rect(365, 199, 82, 130);
  triangle(365, 329, 450, 329, 450, 387);
  ellipse(375, 90, 75, 75);
  ellipse(95, 95, 82, 82);
  ellipse(95, 200, 65, 65);
  ellipse(30, 427, 40, 40);
  ellipse(145, 538, 38, 38);
  ellipse(242, 538, 45, 45);
  
  //layer 4 - maroon
  stroke(#932E2E);
  fill(#932E2E);
  triangle(230, 96, 375, 96, 230, 230);
  triangle(383, 321, 433, 321, 433, 355);
  
  //layer 5 - white
  stroke(#FFFFFF);
  fill(#FFFFFF);
  rect(45, 259, 100, 50);
  ellipse(268, 221, 45, 45);
  rect(387, 169, 45, 104);
  rect(227, 284, 102, 124); 
  ellipse(100, 405, 16, 16);
  ellipse(185, 428, 28, 28);
  ellipse(332, 516, 26, 26);
  ellipse(407, 555, 55, 55);
  triangle(40, 495, 40, 547, 118, 495);
  
  //layer 6 maroon
  stroke(#932E2E);
  fill(#932E2E);
  rect(238, 296, 40, 45);
  ellipse(359, 439, 90, 90);
}



