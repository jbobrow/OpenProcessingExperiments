
float carWidth;
float carHeight = 50;
float wheelSize;
 
void setup()
{
  size(500, 600);
  background(255, 255, 255);
  smooth();
   
  carWidth = carHeight * 2;
  wheelSize = carHeight / 2;
}
 
void draw()
{
  background(255, 255, 255);
 
  noStroke();
  fill(255, 0, 0);
  
  
  // earth 
  fill(131,43,0);
  rect(0,200,200,500);

  //earth two
  fill(131,43,0);
  rect(300,200,200,500);
  
   //draw water
  fill(9,151,188);
  rect(200,199,100,600);
  
   noStroke();
  // Draw car top:
  fill(255,0,0);
  ellipse(mouseX, 490-carHeight/2, carHeight, carHeight/2);
 
  // Draw car body:
  ellipse(mouseX, 490, carWidth, carHeight); 
  fill(255, 255, 255);
  rect(mouseX-carWidth/2, 490, carWidth, carHeight);
 
  // Draw wheels:
  fill(0, 0, 0);
  ellipse(mouseX-carWidth/4, 490, wheelSize, wheelSize);
  ellipse(mouseX+carWidth/4, 490, wheelSize, wheelSize);
 
   // draw road
   stroke(175,175,175);
  strokeWeight(5);
  line(0,500,500,500);
  
     // draw bridge
  fill(30,30,30);
  rect(0,500,width,100);
  
  
  //draw bridge circle
  fill(255,255,255);
  ellipse(250,625,450,220);
  
  
}
