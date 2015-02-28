
//HW 5 Stephanie Jeong yujeongj copyright 2014

float x, y, diam, speed;
float x1, y1, diam1, speed1;
color circle, circle1;

void setup()
  {
    size(400,400);
    
    //fig 1
    x=0;
    y=0;
    diam=30;
    speed=6;
    circle= color(237,137,23);
    
    //fig 2
    x1=350;
    y1=350;
    diam1=50;
    speed1=3;
    circle1= color(70,77,87);
  }
  
void draw()
  {
    prepareWindow();
    drawFigures();
    moveFigures();
  }
  
void prepareWindow()
  {
    noStroke();
    fill(0,10);
    rect(0,0,width,height);
  }
  
  
  
void drawFigures()
  {
    ellipseMode(CORNER); 
    figure(x, y, diam);
    figure (x1,y1,diam1,circle1);
  }
  
  void figure (float x, float y, float diam)
    {
      noStroke();
      fill(circle);
      ellipse(x,y,diam,diam);
    }
    
  void figure (float x1, float y1, float diam1, color circle1)
    {
      noStroke();
      fill(circle1);
      ellipse(x1,y1,diam1,diam1);
    }
    
void moveFigures()
  {
   //1
    //top
    if ((x < width - diam) && (y == height - height))
    {
      x += speed;
    }
    //right
    else if ((x >= width - diam) && (y < height - diam))
    {
      y += speed;
    }
    //bottom
    else if ((x > width - width) && (y >= height - diam))
    {
      x -= speed;
    }
    //left
    else if ((x == width - width) && (y > height - height))
    {
      y -= speed;
    } 
   //2
    //bottom
    if ((x1 > width - width) && (y1 >= height - diam1))
    {
      x1 -= speed1;
    }
    //left
    else if ((x1 < width - width) && (y1 > height - height))
    {
      y1 -= speed1;
    }
    //top
    else if ((x1 < width - diam1) && (y1 < height - height))
    {
      x1 += speed1;
    }
    //right
    else if ((x1 >= width - diam1) && (y1 <= height - diam1))
    {
      y1 += speed1;
    }
  }


