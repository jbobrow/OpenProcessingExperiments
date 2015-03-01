
Bar[] barArray;
float grad = 5;

void setup()
{
  size(600,400);
  background(0);
  noStroke();
  
  barArray = new Bar[25];
  
  //Central bar
  barArray[0] = new Bar(0,height/2, 250); 
  
  float offset = 0;
  float col = 250;
  
  for(int i = 1; i < 25; i += 2)
  {
    
    offset += 5;
    col-= 20;
    
    barArray[i] = new Bar(0,(height/2)+offset, col);
    barArray[i+1] = new Bar(0,(height/2)-offset, col);
  }
  
}

void draw()
{
  
  for(Bar bar : barArray)
  {
     bar.update(grad); 
  }
  
}
 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      grad += 1;
    } else if (keyCode == DOWN) {
      grad -= 1;
    }
  } 
} 

class Bar
{
  
  float col;
  PVector pos;
  boolean increment;
  
  Bar(float x, float y, float newCol)
  {
    pos = new PVector(x, y);
    col = newCol;
  }
  
  void update(float val)
  {
    //First check whether the mode should be inc or dec
    if(col <= 0)
    {
      increment = true;
    } else if (col >= 255) {
      increment = false;
    }
    
    //Then update the colour based on the val + increment mode
    if(increment)
    {
      col += val;
    } else {
      col -= val;
    }
    
    //Draw the rect
    fill(col);
    rect(pos.x, pos.y, width, 5);
  }
  
}
