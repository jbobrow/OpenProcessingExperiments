
void setup()
{
    size(500, 500);
    stroke(0, 5);
    background(222,222,222);
    noFill();
    frameRate(15);
}

void draw()
{
    float rad = 0.0;
    float inc = PI/50;
  
    for (int i=0 ; i < 1000; i+=20)
    {
        ellipse(width/2, height/2, cos(rad)*mouseX, sin(rad)*mouseY );
        rad+=inc;
    }
}

//when mouse is clicked, reset to most recent ellipse
void mousePressed()
{
     background(222, 222, 222);
     stroke(0, 5);
}

void keyPressed()
{
    if( key == '1' )
    {
        stroke(255, 0, 0, 5);
    }
    else if( key == '2' )
    {
        stroke(244, 164, 95, 5);
    }
    else if( key == '3' )
    {
        stroke(255, 255, 0, 5);
    }
    else if( key == '4' )
    {
        stroke(34, 139, 34, 5);
    }
    else if( key == '5' )
    {
        stroke(0, 191, 255, 5);
    }
    else if( key == '6' )
    {
        stroke(0, 0, 255, 5);
    }
    else if( key == '7' )
    {
     stroke(147, 112, 219, 5);
    }
}

