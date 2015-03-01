
class ant
{
    int px;
    int py;
    
    String dir = "right";
    
    public ant(int xp, int yp)
    {
        px = xp;
        py = yp;
    }
    
    void go()
    {
        //move
        
        if( dir == "right" )
        {
            px+=1;
        }
        else if ( dir == "left")
        {
            px-=1;
        }
        else if ( dir == "up")
        {
            py-=1;
        }
        else if ( dir == "down")
        {
            py+=1;
        }
        
        //turn
        color cp = get(px, py);
        if(cp != color(255,255,255))
        {
            //turn left. make white
            if(dir == "right")
            {
                dir = "up";
            }
            else if(dir == "up")
            {
                dir = "left";
            }
            else if(dir == "left")
            {
                dir = "down";
            }
            else if(dir == "down")
            {
                dir = "right";
            }
            stroke(255);
            point(px, py);
        }
        else
        {
            //turn right. make black
            if(dir == "right")
            {
                dir = "down";
            }
            else if(dir == "up")
            {
                dir = "right";
            }
            else if(dir == "left")
            {
                dir = "up";
            }
            else if(dir == "down")
            {
                dir = "left";
            }
            stroke(0);
            point(px, py);
        }
    }
    
}

var ants = Array();


void setup()
{
    frameRate(200);
    size(500,500);
    background(255);
    for(int i=0; i < 30; i++)
    {
            ants.push(new ant((int)floor(random(width)), (int)floor(random(height))));
    }

}

void draw()
{
    for(ant a : ants)
    {
        a.go();
    }

}
