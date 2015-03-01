


void setup()
{
  size(500,500);
  frameRate(60);
  background(232,138,138);
}
Void draw()


{
  
  // **Grid**
  stroke(0);  // color of lines
  
  strokeWeight(5); //thickness of line
  line(width/3, 0, width/3, height); //left vertical line
  line(width*2/3, 0, width*2/3, height); // right vertical line
  line(0, height/3, width, height/3); // top horizontal line
  line(0, height*2/3, width, height*2/3); //bot horizontal line

  
  //**Left Click**
  if (mousePressed && (mouseButton == LEFT))
  {
    //background(50,80,190);
    x = mouseX - 1;
    y = mouseY - 1;
    
  //thickness,color of line  
  strokeWeight(10);
  stroke(21,160,193);
  line(x,y,x+5,y);
  }
  
  //**Right Click**
  else if (mousePressed && (mouseButton == RIGHT)) {
    
    x = mouseX - 1;
    y = mouseY - 1;
    
    //thickness,color of line
    strokeWeight(10);
    stroke(0,10,193);
    line(x,y,x+5,y);
  
  
  }  
  
  }



