
int counter;
 
void setup() 
{
  size(600, 600);
}
 
void draw() 
{
    background(0);
    stroke(255);
    for(int i = 10; i <width;i +=40)
    {
        for(int j = 20; j<height; j+=60)
            {
                //line(i,j,random(width),random(height));
                line(i,j,mouseX,mouseY);
                //line(i,j,i+35,j +30);
            }
    }
}
