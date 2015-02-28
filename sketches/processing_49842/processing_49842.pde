
//----------------------------------------------------
// BeanCells_V1
// Draws random dot grids
// Note: This is the 1st prototype of "BeanCells" drawing pattern
//----------------------------------------------------
// Michel Kern  -  22 jan 2012
// License: BSD
// www.terimakasi.com
//----------------------------------------------------
int   GridWidth  = 300;
int   GridHeight = 300;
color Palette[] = { color(240, 240, 220), 
                    color(0, 0, 0), color(255, 255, 255),
                    color(255,0,0), color(0,255,0), color(0,0,255)  
                  };
final int COLOR_BACKGROUND = 0;
final int COLOR_BLACK      = 1;
final int COLOR_WHITE      = 2;
final int COLOR_RED        = 3;
final int COLOR_GREEN      = 4;
final int COLOR_BLUE       = 5;

private SeedGrid _seed_grid = null;

boolean first_display       = true;

void setup() 
{
  size(GridWidth, GridHeight);
  smooth();
  background(0);
  
  int step_count  = 17;
  int seed_size   = 15;
  int grid_margin = 10;
  _seed_grid = new SeedGrid(GridWidth, step_count, seed_size, grid_margin);
} // setup()

void draw() 
{
  noStroke();
  //   color                 alpha
  fill(Palette[COLOR_BLACK], 100);
  rect(0, 0, width, height);

  int seed_size  = 10;
  int seed_count = 30;
  _seed_grid.drawSeeds(seed_size, seed_count);
  if (! first_display)
    delay(1000);
  else
    first_display = false;
} // run


public class SeedGrid
{
  private int  _grid_width  = 0;
  private int  _grid_step   = 0;
  private int  _step_count  = 0;
  private int  _shift_x     = 0;
  private int  _seed_size   = 0;
  private int  _grid_margin = 0;
  
  public SeedGrid(int grid_width, int step_count, int seed_size, int grid_margin)
  {
    _step_count  = step_count;
    _grid_margin = grid_margin;
    _grid_width  = grid_width - (2 * _grid_margin);
    _grid_step   = _grid_width / _step_count;
    _shift_x     = _grid_step / 2;
    _seed_size   = seed_size;
  } // Constructor
  
  void drawGrid()
  {
    stroke(Palette[COLOR_WHITE]);
    for (int i=0; i < _step_count; i++)
    {
      line(i*_grid_step + _grid_margin*1.5 + _shift_x, _grid_margin,
           i*_grid_step + _grid_margin*1.5 + _shift_x, _grid_width);
      line(_grid_margin, i*_grid_step + _grid_margin*1.5 + _shift_x, 
           _grid_width,  i*_grid_step + _grid_margin*1.5 + _shift_x);
    }
  } // drawGrid
  
  void drawSeeds(int seed_size, int seed_count)
  {
    //drawGrid();
    
    int i, cell_x, cell_y;
    int cell_color = 0;
  
    fill(Palette[COLOR_RED]);
    
    Seed s = new Seed(this, _step_count, seed_size);
  
    for (i=0; i < seed_count; i++)
    {
      cell_x = (int)random(_step_count);
      cell_y = (int)random(_step_count);
      s.draw(cell_x, cell_y, cell_color, _grid_margin);
    }
  } // draw()
  
  public int getWidth()
  {
    return _grid_width;
  } // getWidth
  
  public int getStep()
  {
    return _grid_step;
  } // getStep
} // SeedGrid


public class Seed
{
  private int _shift_x    = 0;
  private int _seed_size  = 0;
  
  public Seed(SeedGrid seed_grid, int step_count, int seed_size)
  {
    _shift_x    = seed_grid.getStep() / 2;
    _seed_size  = seed_size;
  } // Constructor
  
  void draw(int cell_x, int cell_y, int cell_color, int grid_margin)
  {
    stroke(Palette[COLOR_WHITE]);
    fill(Palette[COLOR_RED]);
    int grid_step = _seed_grid.getStep();
    ellipse( (cell_x*grid_step) + _shift_x + grid_margin*1.5, 
             (cell_y*grid_step) + _shift_x + grid_margin*1.5, 
             _seed_size, _seed_size);
  } // draw()
} // class Seed

