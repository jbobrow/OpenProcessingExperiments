
Color[] colors = new Color[6];
int subDivisions = 6;

void setup() 
{  

  size(500,500);

  redraw();
}

void redraw()
{
  background(255);  //set background white
  Color basecolor = color(50+random(155), 50+random(155), 50+random(155));
  
  for(int i=0; i < colors.length; i++)
  {
      colors[i] = color(min(225, red(basecolor )+i*11),min(225, green(basecolor )+i*11),min(225, blue(basecolor )+i*11));
  }
  
  float blockW = width/subDivisions;
  float blockH = width/subDivisions;
  
  for(int x=0; x<subDivisions; x++)
  {
      for(int y=0; y<subDivisions; y++)
      {
          drawSquare(x*blockW, y*blockH, blockW, blockH);
      }
  }
}

void setRandomColor()
{
    int colIndex = round(random(colors.length-1));
    fill(colors[colIndex]);
    stroke(colors[colIndex]);
}

void drawSquare(float x, float y, float w, float h)
{


    setRandomColor();
    
    
    triangle(x,y,x+w/2,y, x, y+h/2);
    
    setRandomColor();
    triangle(x+w/2,y,x+w,y,x+w, y+h/2);
 
    setRandomColor();
    triangle(x, y+h/2, x, y+h, x+w/2, y+h);

    setRandomColor();
    triangle(x+w/2, y+h, x+w, y+h, x+w, y+h/2);
    
    
    setRandomColor();
    triangle(x+w/2, y, x+w/2, y+h/2, x, y+h/2);
    
    setRandomColor();
    triangle(x+w/2, y, x+w, y+h/2, x+w/2, y+h/2);

    setRandomColor();
    triangle(x+w/2, y+h/2, x+w/2, y+h, x, y+h/2)
    
    setRandomColor();
    triangle(x+w/2, y+h/2, x+w, y+h/2, x+w/2, y+h);
    
}


void keyPressed()
{
    redraw();
}

void draw() {  
    
}
