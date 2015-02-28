


class Image
{

  float x;
  float y;

  int picN = 0;
  int xpos, ypos;

  float angle = 0;
  
  boolean isFixed = false;

  Image(float tempX, float tempY, int picN)
  {
    x = tempX;
    y = tempY;

    this.picN = picN;
  }

  void update()
  {
    
  }

  void display() 
  {
    if(isFixed == false)
    {
      background(41,172,203);
      pushMatrix();
      x = mouseX;
      y = mouseY;
      translate(x, y);
         
      rotate(angle);
      
      image(pix[picN], 0, 0);
  
      popMatrix();
  
      angle += 0.01;  
      
    }
    else
    {
      pushMatrix();
      translate(x, y);
      rotate(angle);
      image(pix[picN], 0, 0);
      popMatrix();
    }
  }
}  


