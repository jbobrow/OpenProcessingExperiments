
void setup()
{
  size(800, 800);
  background(204, 167, 247);
}


void draw()
{
  // for finding the coordinates of the spaces
  /*
  print("x: ");
  println(mouseX);
  print("y: ");
  println(mouseY);
*/
  
  //body 
  fill(72, 5, 80);
  smooth();
  noStroke();
  ellipse(360, 700, 300, 440);

   //rectangles for the hair on left
pushMatrix();                //START OF TRANSLATION & ROTATION LOCK
  noStroke();
  fill(54, 165, 30, 100);
  translate(width/2.5, height/2.3);  
  rotate(PI/6.0);
  rect(-100, -30, 50, 350);
  translate(-40, 40);
  fill(104, 234, 76, 80);
  rect(-100, -26, 50, 350);
  translate(30, 10);
  fill(24, 103, 7, 80);
  rect(-100, -26, 50, 200);
  translate(-20, -40);
//  fill(67, 173, 44, 90);
  fill(242, 29, 282, 90);
  rect(-100, -26, 50, 350);
  translate(60, -20);
  fill(132, 193, 119, 100);
  rect(-100, -26, 50, 350);
  translate(30, 30);
  fill(80, 191, 56, 100);
  rect(-100, -26, 50, 200);
  translate(-70, -60);
  fill(114, 175, 101, 100);
  rect(-100, -26, 50, 200);
popMatrix();                //END OF TRANSLATION & ROTATION LOCK


      
   //rectangles for the hair on right
pushMatrix();                //START OF TRANSLATION & ROTATION LOCK
  noStroke();
  fill(54, 165, 30, 100);
  translate(width/1.4, height/3);  
  rotate(PI/-6.0);
  rect(-100, -30, 50, 350);
  translate(-40, 40);
  fill(104, 234, 76, 80);
  rect(-100, -26, 50, 350);
  translate(30, 10);
  fill(24, 103, 7, 80);
  rect(-100, -26, 50, 200);
  translate(-20, -40);
//  fill(67, 173, 44, 90);
  fill(242, 29, 282, 90);
  rect(-100, -26, 50, 350);
  translate(60, -20);
  fill(132, 193, 119, 100);
  rect(-100, -26, 50, 350);
  translate(30, 30);
  fill(80, 191, 56, 100);
  rect(-100, -26, 50, 200);
  translate(-70, -60);
  fill(114, 175, 101, 100);
  rect(-100, -26, 50, 200);
popMatrix();                //END OF TRANSLATION & ROTATION LOCK

// circles for the head
pushMatrix();                  //START OF TRANSLATION LOCK
  noStroke();
  smooth();
  fill(195, 36, 240);
  ellipse(330, 308, 180, 180);
  translate(-50, 40);
  fill(215, 111, 245, 100);
  ellipse(330, 308, 180, 180);
  translate(-20, 40);
  fill(112, 6, 142, 80);
  ellipse(330, 308, 180, 180);
  translate(30, 50);
  fill(11, 183, 12, 120);
  ellipse(330, 308, 180, 180);
  translate(20, 30);
  fill(33, 250, 34, 80);
  ellipse(330, 308, 180, 180);
  translate(20, 10);
  fill(80, 203, 81, 80);
  ellipse(330, 308, 180, 180);
  translate(40, 0);
  fill(212, 80, 240, 80);
  ellipse(330, 308, 180, 180);
  translate(40, -10);
  fill(51, 61, 229, 80);
  ellipse(330, 308, 180, 180);
  translate(40, -10);
  fill(149, 154, 242, 100);
  ellipse(330, 308, 180, 180);
  translate(15, -30);
  fill(50, 57, 183, 100);
  ellipse(330, 308, 180, 180);
  translate(20, -10);
  fill(232, 28, 93, 80);
  ellipse(330, 308, 180, 180);
  translate(10, -20);
  fill(41, 28, 232, 150);
  ellipse(330, 308, 180, 180);
  translate(-10, -30);
  fill(119, 119, 121, 100);
  ellipse(330, 308, 180, 180);
  translate(-20, -30);
  fill(84, 232, 129, 100);
  ellipse(330, 308, 180, 180);
  translate(-30, -30);
  fill(84, 232, 223, 100);
  ellipse(330, 308, 180, 180);
  translate(-40, -30);
  fill(129, 196, 250, 100);
  ellipse(330, 308, 180, 180);
popMatrix();                //END OF TRANSLATION LOCK

  //face circle
  fill(216, 202, 39, 200);
  ellipse(365, 378, 230, 230);
  
  //eyes & glasses
  fill(101, 126, 175);
  ellipse(319, 376, 60, 40);  //left lens
  ellipse(415, 376, 60, 40);  //right lens
//  fill(17, 96, 147);
  fill(242, 186, 29);
  ellipse(318, 377, 40, 20);  //left eye
  ellipse(414, 377, 40, 20);  //right eye
  fill(124, 52, 19);
  ellipse(318, 377, 15, 15);  //left pupil
  ellipse(414, 377, 15, 15);  //right pupil
  fill(250, 10, 18);
  triangle(345, 376, 387, 363, 387, 390);  //bridge
  fill(255);
  quad(373, 408, 338, 432, 387, 436, 355, 428); //nose
  
  //smile
  stroke(3, 156, 225);
  strokeWeight(3);
  noFill();
  bezier(310, 446,    310, 500,    413, 500,    416, 456);

  
}
