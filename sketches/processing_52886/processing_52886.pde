
class Circle
{
    float x;
    float y;
    float rad;
    
    Circle(float x, float y, float rad)
    {
        this.x = x;
        this.y = y;
        this.rad = rad;
    }
    
    float getX()
    {
        return x;
    }
    
    float getY()
    {
        return y;
    }
    
    float getRad()
    {
        return rad;
    }
    
    void setX(float x)
    {
        this.x = x;
    }
    
    void setY(float y)
    {
        this.y = y;
    }
    
    void setRad(float rad)
    {
        this.rad = rad;
    }
    
    void display()
    {
        ellipse(x,y,rad*2,rad*2);
    }
}

