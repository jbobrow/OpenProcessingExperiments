
int counter;
  
void setup()
{
  size(600, 600);
}
  
void draw()
{
    background(0);
    stroke(205);
    for(int i = 10; i <width;i +=20)
    {
        for(int j = 20; j<height; j+=60)
            {
                //line(i,j,random(width),random(height));
                line(i,j,2*3.1416,3.1416/2);
                //line(i,j,i+35,j +30);
            }
    }
}



