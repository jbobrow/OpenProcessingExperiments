
Column col[];

void setup()
{
  size(300, 250);
  colorMode(HSB);
  noStroke();
  smooth();
  initColumns();
  
}

void draw()
{
  background(0);
  for(int i = 0; i < col.length; i++)
  {
    col[i].toCanvas();
  }
}

void initColumns()
{
  col = new Column[10];
  int current_x = 0;
  for(int i = 0; i < col.length; i++)
  {
    col[i] = new Column(current_x + 2, 0, 26, height);
    current_x += 30;
  }
}

class Column
{
  int w;
  int h;
  int xPos;
  int yPos;
  int rect_h;
  int rect_yPos;
  color rect_c;

  public Column(int _xPos, int _yPos, int _w, int _h)
  {
    this.xPos = _xPos;
    this.yPos = _yPos;
    this.w = _w;
    this.h = _h;
    this.rect_h = this.h / 25;
    this.rect_yPos = this.h / 2;
    this.rect_c = color(106, 45, 97);
  }

  public void toCanvas()
  {

    fill(updateBackgroundColor());
    rectMode(CORNER);
    rect(xPos, yPos, w, h);
    addInteractiveRectangle();

  }

  private void addInteractiveRectangle()
  {
    updateRectPosition();
    fill(rect_c);
    rectMode(CENTER);
    rect(xPos + w/2, rect_yPos, w, rect_h); 
  }

  public boolean mouseIsOn()
  {
    if(mouseX >= this.xPos && mouseX <= this.xPos + this.w
      && mouseY >= this.yPos && mouseY <= this.yPos + this.h)
    {
      return true;
    } 

    return false;
  }

  private void updateRectPosition()
  {
    if(this.mouseIsOn())
    {
      if(abs(mouseY- this.rect_yPos) > 8)
      {
        if(mouseY > this.rect_yPos)
          this.rect_yPos += 8;
        else
          this.rect_yPos -= 8; 
      }

    }
    else
    {
      if(abs(this.h / 2  - this.rect_yPos) > 2)
      {
        if(this.h / 2 > this.rect_yPos)
          this.rect_yPos += 1;
        else
          this.rect_yPos -= 1; 
      }
      else
        this.rect_yPos = this.h / 2;
    } 
  }

  private color updateBackgroundColor()
  {
    int c = (int) map(this.rect_yPos, 0, this.h, 0, 359);
    return color(c, 94, 96);
  }
}









