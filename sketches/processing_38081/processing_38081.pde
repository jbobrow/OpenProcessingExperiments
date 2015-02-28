
int ellipseSize = 10; 
void setup (){
  size(500, 500);
  background(0, 0, 0);
  smooth();
  noStroke();
}
 
void draw (){
  background(0, 0, 0);

  //declaring variables
  float xPos = 10;
  float yPos = 10;
  float coloring;
  //nested for loops 
  //defines the x coordinate
  for (int x = 0; x<= 10 ; x++) 
  {
    //defines y coordinate
      for (int y=0 ; y<=10; y++) 
      {
        //concentric ellipses
        //for (int ellipseSize = 50; ellipseSize >= 10; ellipseSize -=5) 
        //{
          //determining position by grid
          //xPos = x;
          //yPos = y;
          //somewhat random color change from left to right
          //coloring = map(255, 0, mouseX, 0, 0);
          fill(0, 255, 255);
          
          ellipse(xPos, yPos, ellipseSize, ellipseSize);
          yPos += 10;
        //}
      }
    yPos = 10;
    xPos +=10;  
  }
}


                
                                
