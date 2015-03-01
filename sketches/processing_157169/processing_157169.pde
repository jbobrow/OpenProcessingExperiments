
//learning processing example
Cell[][] grid;
int cols = 10;
int rows = 10;

void setup()
{
    size(200, 200);
    
    grid = new Cell[cols][rows];
    
    for(int i = 0; i < cols; i++)
    {
        for(int j = 0; j < rows; j++)
        {
            grid[i][j] = new Cell(i * 20, j * 20, 20, 20, i + j);
            println(i + j);
        }
    }
}

void draw()
{
    for(int i = 0; i < cols; i++)
    {
        for(int j = 0; j < rows; j++)
        {
            grid[i][j].oscillate();
            grid[i][j].display();
        }
    }
}
class Cell
{
    float x, y;
    float w, h;
    float angle;
    
    Cell(float _x, float _y, float _w, float _h, float _angle)
    {
        x = _x;
        y = _y;
        w = _w;
        h = _h;
        angle = _angle;
    }
    
    void oscillate()
    {
        angle += 0.02;
    }
    
    void display()
    {
        stroke(255);
        fill(127 + sin(angle) * 127);
        rect(x, y, w, h);
    }
}
