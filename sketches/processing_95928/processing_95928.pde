
  //variables controlling the background colour
  int r = 255;
  int g = 255;
  int b = 255;
  //mouse controlled variables - used to colour the square
  int x = mouseX;
  int y = mouseY;
  int z = (x + y)/2;
  //this moves the smaller squares as it increments
  int i =0;
  
void setup() {
  //window size
  size(500,500);;
}


void draw() {
  background(r,g,b);    
  rectMode(CENTER);    
  //stroke and fill change depending on the mouse location
  stroke(x-200,y-200,-z+200);
  fill(x,y,-z);
  rect(x,y,50,50);
  x = mouseX;
  y = mouseY;  
  background(x,y);
  
  //when the mouse is pressed, smaller squares move away from the main one
  if (mousePressed == true) {    
      rect(x+i,y+i,25,25);
      rect(x-i,y-i,25,25);
      rect(x+i,y-i,25,25);
      rect(x-i,y+i,25,25);
      //changes background colour when the squares meet the edge of the screen.
      background(x+i,y+i);
      background(x-i,y-i);
      background(x+i,y-i);
      background(x-i,y-i);
      
  }else{ 
    //when the mouse isn't pressed, this resets the movement
    i=0;
    }
    //move the smaller squares
    i+=2;
   
  
}

//changes the colour of the background when the squares meet certain edges
void background(int x, int y) {  
  //background changes to yellow when the square hits the left edge
  if (x<25) {
    r = 255;
    g = 255;
    b = 0; 
    //background changes to green when the square hits the top edge
  } else if (y<25) {
    r = 0;
    g = 255;
    b = 0;
    //background changes to red when the square hits the right edge
  } else if (x>475) {
    r = 255;
    g = 0;
    b = 0; 
    //background changes to blue when the square hits the bottom edge
  } else if (y>475) {
    r = 0;
    g = 0;
    b = 255;   
  }
}



  


