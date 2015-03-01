
class Cell
{
  PVector pos;
  color c;
  Cell(int _x, int _y, color _c)
  {
    pos = new PVector(_x, _y);
    c = _c;
  }
}

ArrayList<Cell> cells = new ArrayList<Cell>();
void setup()
{
  //set the size of wallpaper 
    size(400,300);
     for(int i=0; i< (width+height)/100; i++)
  cells.add(new Cell(int(random(0,height)),int(random(0,width)), color(random(0, 20), random(150, 255), random(150, 255))));

}
void draw()
{
  // Draw the voronoi diagram
  drawVoronoi();   
}

void drawVoronoi()
{
  loadPixels();
  int off = 0;   
  for (int y = 0; y < height; y++)
  {
    for (int x = 0; x < width; x++)
    {
      float min_d = 1E11;
      int index = -1;
      // Search the closest cell
      for (int i = 0; i < cells.size(); ++i)
      {
        Cell cc = cells.get(i);
        float d;        
        // Calculate distance
        d = sq(x-cc.pos.x) + sq(y-cc.pos.y);
        if (d < min_d)
        {
          min_d = d;
          index = i;
        }
      }
      // Set the pixel to the cells color
      pixels[off++] = cells.get(index).c;
    }
  }
  updatePixels();
}

void mousePressed() {
  cells.add(new Cell(mouseX, mouseY, color(random(0, 20), random(100, 255), random(100, 255))));
  print("mouseX:" + mouseX + " ,mouseY:" + mouseY);
} 
void keyPressed()
{
  if (key == ' '){
   save("wallpaper_voronoi.png");
  }
}
