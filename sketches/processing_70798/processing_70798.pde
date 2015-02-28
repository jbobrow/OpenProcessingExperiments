
void setup()
{
  //Set total window size to 1200 pixels wide and 800 pixels high
  size(1200, 800);
  
  noCursor();
  
  //Set background colour
  background(128, 128, 128);
  
  //Render grid on background
  for(int x = 0; x < 1200; x += 4)
    {
      for(int y = 0; y < 800; y += 4)
      {
        point(x, y);
      }      
    }
}

void draw()
{
  //Check if screen should be cleared)
  if(keyPressed == true)
  {
    fill(128, 128, 128, 255);
    rect(0, 0, 1200, 800);
    
    //Render grid on background
    for(int x = 0; x < 1200; x   += 4)
    {
      for(int y = 0; y < 800; y += 4)
      {
        point(x, y);
      }      
    }
  }
  
  //Check if mouse is pressed
  if(mousePressed == true)
  {
    fill(    //Call the fill colour function
      random(250, 220),    //Random Red Value
      random(180, 115),   //Random Green Value
      random(100, 50),  //Random Blue Value
      15);        //Set opacity to a super low value
  } else {
    fill(    //Call the fill colour function
      random(30, 70),    //Random Red Value
      random(70, 140),   //Random Green Value
      random(150, 250),  //Random Blue Value
      15);        //Set opacity to a super low value
  }  
    
  ellipse(      //Call the draw elipse function
     mouseX,      //Set x position to that of mouse's X position
     mouseY,      //Set y position to that of mouse's Y position
     random(40, 80),  //Set horizontal width to a random value
     random(40, 80)); //Set the vertical height to a random value
 
     //Draw FPS in top left    
     fill(0, 0, 0);        //Set black box colour
     rect(0, 0, 150, 30);  //Draw black box
     fill(255, 255, 255);  //Set text colour
     text("FPS: "+frameRate, 10, 15);  //Write text
}

