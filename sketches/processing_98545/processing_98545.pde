
boolean mouseIsDown = false;
  
void setup()
{
  size(1280, 920);
  background(50);
  frameRate(100);
  fill(150);
  textFont(createFont("Arial", 12));
  text("space to clear", 585, 870);
 
}
  
void draw()
{
 
  float lineColor = abs(mouseX*1.25 - pmouseX);
  stroke(lineColor,255-lineColor,200-lineColor);
  float strokeW = round(random(0,3));
  strokeWeight(strokeW);
  //strokeWeight(1);
    
  if (mouseIsDown == true)
  {
      line(mouseX, mouseY, pmouseX, pmouseY);
       
      float randNum = round(random(1,10));
      float randLine = round(random(1,70));
      float randCircleSize = round(random(1,10));
       
      if(randNum == 6)
      {
        line(mouseX,mouseY,mouseX-randLine,mouseY-randLine)
        ellipse(mouseX-randLine, mouseY-randLine, 20, 20);
        ellipse(pmouseX-randLine,pmouseY+randLine,10,10);
      }
       
      else if(randNum == 2)
      {
        line(mouseX,mouseY,mouseX+randLine,mouseY+randLine)
        ellipse(mouseX+randLine, mouseY+randLine, 20, 20);
        ellipse(pmouseX+randLine,pmouseY-randLine,10,10);
      }
       
      else if(randNum == 4)
      {
        line(mouseX,mouseY,mouseX+randLine,mouseY-randLine)
       ellipse(mouseX+randLine, mouseY-randLine, 20, 20);
        ellipse(pmouseX+randLine,pmouseY-randLine,randCircleSize,randCircleSize);
      }
       
      else if(randNum == 9)
      {
        line(mouseX,mouseY,mouseX-randLine,mouseY+randLine)
       
       ellipse(pmouseX+randLine,pmouseY-randLine,randCircleSize,randCircleSize);
        
      }
  }
   
  fill(50);
  
}
 
noStroke();
  textFont(createFont("Arial", 12));
  text("space to clear", 215, 470);
  
void mousePressed()
{
  mouseIsDown = true;
}
 
void mouseReleased()
{
  mouseIsDown = false;
}
 
void keyPressed()
{
  if (key == ' ')
  {
    background(50);
    fill(150);
    textFont(createFont("Arial", 12));
    text("space to clear", 585, 870);
  }
}
