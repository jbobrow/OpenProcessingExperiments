
float carWidth;
float carHeight = 50;
float wheelSize;
color carColor;
 
void setup()
{
  size(400, 400);
  background(255, 255, 255);
  smooth();
   
  carWidth = carHeight * 2;
  wheelSize = carHeight / 2;

  carColor = color(255, 0, 0);

}
 
void draw()
{
  background(255, 255, 255);
 
  noStroke();
   
  fill(carColor);
  
  // Draw car top:
  ellipse(mouseX, height/2-carHeight/2, carHeight, carHeight/2);
 
  // Draw car body:
  ellipse(mouseX, height/2, carWidth, carHeight); 
  fill(255, 255, 255);
  rect(mouseX-carWidth/2, height/2, carWidth, carHeight);
  
  fill(220, 220, 220);
  arc(mouseX+carHeight/10, height/2-carHeight/5*2, carHeight/5*3, carHeight/5*2, 3*PI/2, TWO_PI);
  arc(mouseX, height/2-carHeight/5*2, carHeight/5*3, carHeight/5*2, PI, 3*PI/2);
  

 
  // Draw wheels:
  fill(0, 0, 0);
  ellipse(mouseX-carWidth/4, height/2, wheelSize, wheelSize);
  ellipse(mouseX+carWidth/4, height/2, wheelSize, wheelSize);
  fill(128, 128, 128);
  ellipse(mouseX-carWidth/4, height/2, wheelSize/2, wheelSize/2);
  ellipse(mouseX+carWidth/4, height/2, wheelSize/2, wheelSize/2);
  fill(100, 100, 100);
  ellipse(mouseX-carWidth/4, height/2, wheelSize/4, wheelSize/4);
  ellipse(mouseX+carWidth/4, height/2, wheelSize/4, wheelSize/4);

 
  // draw road
  strokeWeight(carHeight/8);
  stroke(128, 128, 128);
  line(0, height/2+carHeight/3, width, height/2+carHeight/3);
 
}


void mousePressed()
{
    carColor = color(random(255), random(255), random(255));   
}
