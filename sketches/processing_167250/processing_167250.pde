
Ball myBall;

void setup()
{
    size(500,500);
    smooth();
    myBall=new Ball();
}

void draw()
{
    background(0);
    myBall.display();
}

class Ball
{
    // GLOBAL VARIABLES
    float x = 0;
    float y = 0;
    
    //CONTRUCTOR
    Ball()
    {
    }
    
    // METHODS
    void display()
    {
        ellipse(200,200,20,20)
    }
}
