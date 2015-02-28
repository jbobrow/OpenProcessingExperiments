
void setup()
{
  size(600, 600);
  background(#216C93);
  smooth();

  fill(255, 255, 255, 60);
  
   //noFill(); //center circle
  strokeWeight(2);
  stroke(#F5D085);
  ellipse(300, 300, 300, 300);
  
   //noFill(); //right circle
  ellipse(450, 300, 300, 300);
  
  
   //noFill(); //left circle
  ellipse(150, 300, 300, 300);
  
   //noFill(); //top right circle
  ellipse(375, 175, 300, 300);
  
   //noFill(); //top left circle
  ellipse(225, 175, 300, 300);
  
  
   //noFill(); //bottom right circle
  ellipse(375, 435, 300, 300);
  
   //noFill(); //bottom left circle
  ellipse(225, 435, 300, 300);
  
}

void draw() 
{
 
  

strokeWeight(4);
stroke(#9D2D2A);
line(225, 170, 375, 170); //center hexigon
line(225, 430, 375, 430);
line(225, 170, 150, 300);
line(375, 170, 450, 300);
line(150, 300, 225, 430);
line(450, 300, 375, 430);

strokeWeight (3);
line(225, 430, 225, 585); //inside-outside connectors
line(225, 170, 225, 25);
line(375, 25, 375, 170);
line(375, 430, 375, 585);
line(225, 170, 95, 95);
line(450, 300, 580, 375);
line(17, 225, 150, 300);
line(505,505, 375, 430);
line (375, 170, 505, 95);
line (150, 300, 17, 375);
line( 225, 430, 95, 505);
line(450, 300, 580, 225);

stroke(#BA5646);
line(225, 25, 375, 25);//outter 12-sided hexigon
line(225, 585, 375, 585);
line(375, 585, 505,505);
line(505, 505, 580, 375);
line(580, 375, 580, 225);
line(580, 225, 505, 95);
line(505, 95, 375, 25);
line(225, 25, 95, 95);
line(95, 95, 17, 225);
line(17,225, 17,375);
line(17, 375, 95, 505);
line(95, 505, 225, 585);




}


