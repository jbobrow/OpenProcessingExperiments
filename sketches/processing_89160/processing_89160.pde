
void setup()
{
  size(200, 200);      //size of the screen im going to use
  background(255);      //white background
  smooth();              //to make the circles look nicer and more presentable
  noStroke();            // to make the circles nicer and more presentable
  ellipseMode(CENTER);    // to make things easier for me
}

void draw()
{
  if(mouseX >= width/2 + 10 || mouseX <= width/2 - 10 || mouseY >= height/2 + 10 || mouseY <= height/2 - 10)    // this if statement selets the middle for exploitation in the rest of the code
  {
    background(255);      
    shapes(width/2, height/2);      //the function for the shapes i want showed
  }
  else      //what i want the programm to do when the mouse is in the area in the middle
  {
    background(255);
    fill(0);
    text("Uh Oh", width/2 - 10, height/2);      // a bit of text 
    
  }
}

  
  
  void shapes(int midX, int midY)      //my function for the shapes i want to draw
  {
    fill(255, 0, 0);                  // i seperated each circles by their colour
    ellipse(width/2, height/2, 30, 30);
    
    fill(0, 0, 255);
    ellipse(width/2 - 50, height/2 - 50, 30, 30);
    ellipse(width/2 - 50, height/2 + 50, 30, 30);
    ellipse(width/2 + 50, height/2 - 50, 30, 30);
    ellipse(width/2 + 50, height/2 + 50, 30, 30);
    
    
    fill(0, 255, 0);
    ellipse(width/2 + 50, height/2, 30, 30);
    ellipse(width/2, height/2 - 50, 30, 30);
    ellipse(width/2 - 50, height/2, 30, 30);
    ellipse(width/2, height/2 + 50, 30, 30);
  }
