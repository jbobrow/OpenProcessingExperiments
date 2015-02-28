
int rot = 0;
int distance = 38;
int offset = 0;
void setup() 
{
    size(500,500);
    fill(255);
    noStroke();
    smooth();
    frameRate(30);
}

void draw()
{   
    rot+=10;
    background(0);
    for(int c = 0; c <=11; c++)
    {
        for(int r=0; r<=11; r++)
        {
            offset=r*30 + c*30;
            arc(distance+r*distance, distance + c*distance, 30, 30, radians(offset+rot), radians(rot+180+offset));
            
        }
    }
}
