
int num = 2;

void setup()
{
frameRate(4);
size(450,450);
background(255);
smooth();
noStroke();
}

void draw()
{   
    num += 1;
    float i=random(5,650);
    if( num % 2 == 0 )
    {
     fill(0,255,255,random(130,240));
     ellipse(width/2,height/2,i,i);
    }
    else
    {
     fill(254,255,255,random(130,240));
     ellipse(width/2,height/2,i,i);
    }
}  

