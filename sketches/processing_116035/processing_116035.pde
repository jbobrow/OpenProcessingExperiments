
float prevX;
float prevY;
int currentBrush = 0;
color brushColor = color(0);
float s = 1;
float angle = 0;
 
 
void setup ()
{
   
  size(600,600);
  smooth();
}
void draw()
{
  if (mousePressed) {
        
      // Color pick with right click
      if (mouseButton == RIGHT) {
        brushColor = get(mouseX, mouseY);
      }
    }
      
    // Draw color wheel palette
    for (int angle = 0; angle < 360; angle = angle + 1) {
      colorMode(HSB, 360, 100, 100, 100);
      pushMatrix();
      translate(30, 30);
      rotate(radians(angle));
      scale(2);
      stroke(angle, 100, 100, 100);
      line(0, 0, 30, 0);
      popMatrix();
        
    }
    // Set back to RGB
    colorMode(RGB);
 
 if (mousePressed == true)
  {
    if (mouseButton == LEFT)
     {
        if (currentBrush == 0)
           {
             fill(red(brushColor), green(brushColor), blue(brushColor));
              noStroke();
              //stroke(random(255),random(255),random(255));
              pushMatrix();
              translate(mouseX, mouseY);
              scale(s);
              rotate(angle);
              triangle(-25, 25, 0, -25, 25, 25);
              popMatrix();
           }
         if (currentBrush == 1)
         {
            fill(red(brushColor), green(brushColor), blue(brushColor));
            rectMode(CENTER);
            rect(mouseX,mouseY,40,40);
         }
        if (currentBrush == 2)
        {
           fill(red(brushColor), green(brushColor), blue(brushColor));
           noStroke();
           ellipseMode(CENTER);
           strokeWeight(1);
           pushMatrix();
           ellipse(mouseX, mouseY, mouseX, mouseY);  
         
           popMatrix();       
           //ellipse(mouseX, mouseY, 30,30);

        }
     }
  }
  prevX = mouseX;
  prevY = mouseY;
}
 
void keyReleased()
{
  if (keyCode == '1')
  {
    currentBrush=1;
  }
  if (keyCode == '2')
  {
    currentBrush =2;
  }
  if (key == '0')
  {
   currentBrush = 0;
  }   
}



