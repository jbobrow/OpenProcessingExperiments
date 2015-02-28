
void setup (){
  size(500, 500);
  background(255, 255, 255);
  smooth();
}
 
void draw (){
  //declaring variables
  float xPos;
  float yPos;
  float coloring;
  //nested for loops 
  //defines the x coordinate
  for (int x = 0; x<= width; x+=70) 
  {
    //defines y coordinate
      for (int y= 0; y<=height; y+=70) 
      {
        //concentric ellipses
        for (int ellipseSize = 70; ellipseSize >= 0; ellipseSize -=10) 
        {
          //determining position by grid
          xPos = x + random(mouseX/70);
          yPos = y + random(mouseX/70);
          //somewhat random color change from left to right
          coloring = map(255, 0, mouseX, 0, 0);
          fill(random(coloring, 255), random(coloring, 255), random(coloring, 255), random(coloring,255));

          //controlled stroke color change from left to right
          stroke(mouseX, 0, 0, 150);
          //increasingly somewhat random stroke weight from left to right
          strokeWeight(random(mouseX/50));
          
          //ellipses with random width increasing left to right
          ellipse(xPos, yPos, random(mouseX/5), ellipseSize);
          
          //ellipses with random length increasing left to right
          ellipse(yPos+35, xPos+35, ellipseSize, random(mouseX/5));
          
        }
      }  
  }
}


