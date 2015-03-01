
int len = 500;
int step = 30;
int xmin = 50;
int ymin = 50;
int counter =1;
void setup() 
{
    size(600, 350);
    smooth();
}

void draw() 
{ 
    counter = counter +1;
    background(255,200,150);
    for(int i=0;i<len;i=i+step)
    {
        for(int j=0;j<len/2;j = j+step)
        {
            if(i <250)
            {
                float mcr = 255;
            }
            else
            {
                float mcr = 10;
            }
            
            drawEllipse(xmin+i,ymin+j,20,20,mcr);
        }
    }

}

void drawEllipse(float x, float y,float w,float h,float myr)
{
fill(myr,150,150);
ellipse(x,y,w,h);
}
