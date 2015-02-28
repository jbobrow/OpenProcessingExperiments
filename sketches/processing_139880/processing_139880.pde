
//A monster named Millie.
//This monster is made up of several geometric shapes, the body 
//of which is a star. 
//The extraneous parts and the eyes are made up of circles
//It will follow the mouse on both axis and will flash different 
//gradients of black when the mouse is pressed.
 
void setup(){//Start a page
 
background(255);//White Background
size(500,500);//Size of window
smooth();
 
frameRate(15);//Slows down reaction time
 
strokeWeight(5);//Thickness of lines
}
 
void draw(){//Start shape
 
  background(255);//White background.
  if (mousePressed) {//If the mouse is pressed,
    fill(random(255));//then fill it with random gradients from white to black
  } else {//If not,
    fill(255); //fill it with white.
 
  
}
  star(mouseX, mouseY, 40, 70, 16);//Make a star that follows the mouse on the X and Y axis
                                   //and has 16 points, radius of 40 and length of 80.
 }
 float a=random(0, 20);//Builds the star.
 void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  
  endShape(CLOSE);//Stop reading code for the star shape.
  fill(255);//Fill the following shape with white.
  ellipse(mouseX-20, mouseY ,30,30);//Eyes: Follow the mouse 20 units left, and have horizontal and vertical radius of 30. 
  ellipse(mouseX+20, mouseY ,30,30);//Eyes: Follow the mouse 20 units right, and have horizontal and vertical radius of 30.
  arc(mouseX, mouseY+20  , 30, 30, 0, PI);//Mouth: Follow the mouce 20 units down and have horizontal and vertical radius of 30.
  fill(0);//Fill the following with black.
  ellipse(mouseX-15, mouseY+6 ,10,10);//Left Pupil:Follow the mouse 15 units left and 6 units down. Have horizontal and vertical radius of 10.
  ellipse(mouseX+15, mouseY+6 ,10,10);//Right Pupil:Follow the mouse 15 units right and 6 units down. Have horizontal and vertical radius of 10.
  ellipse(mouseX-78, mouseY ,20,20);//Left Circle:Follow the mouse 78 units left. Have horizontal and vertical radius of 20.
  ellipse(mouseX+78, mouseY ,20,20);//Right Circle:Follow the mouse 78 units right. Have horizontal and vertical radius of 20.
  ellipse(mouseX-100, mouseY ,10,10);//Far Left Circle:Follow the mouse 100 units left. Have horizontal and vertical radius of 10.
  ellipse(mouseX+100, mouseY ,10,10);//Far Right Circle:Follow the mouse 100 units left. Have horizontal and vertical radius of 10.
  ellipse(mouseX, mouseY-78 ,20,20);//Top Circle:Follow the mouse 78 units up. Have horizontal and vertical radius of 20.
  ellipse(mouseX, mouseY+78 ,20,20);//Top Circle:Follow the mouse 78 units down. Have horizontal and vertical radius of 20.
  
}



