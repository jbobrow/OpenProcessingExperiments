

class Square
{
   
    boolean filled = false;
    color fillColour;
    int xcoord, ycoord;
    
    Square(color colour, int x, int y)
    {
        fillColour = colour;
        xcoord = x;
        ycoord = y;
        render();
        filled=true;
    }

   
    void render()
    {
        fill(fillColour);
        rect(xcoord*10, ycoord*10, 10, 10);
    }
    
    void setColour(color shade)
    {
        fillColour=shade;
    }
    
    color getColour()
    {
        return fillColour;
    }
    
    boolean getFilled()
    {
        return filled;
    }
    
    void setFilled(boolean trueorfalse)
    {
        filled=trueorfalse;
    }
}

