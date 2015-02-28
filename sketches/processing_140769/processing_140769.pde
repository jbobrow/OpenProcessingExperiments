
void setup()
{
    size(255, 255);
    i=0;
}
 
void draw()
{
    background( 255 );
    fill(0);
    stroke(255, 0, 0);
    ellipse(225, 225, 20,20);
    x=mouseX;
    y=mouseY;
    fill(mouseX, mouseY, i);
    if (mouseX-40<0)
    {
        x=40;
        y=mouseY;
      
    }
    if (mouseX+40>255)
    {
        x=215;
        y=mouseY;
      
    }
    if (mouseY-40<0)
    {
        x=mouseX;
        y=40;  
    }
    if (mouseY+40>255)
    {
        x=mouseX;
        y=215;  
    }
    if (mouseX-40<0 && mouseY-40<0)
    {
        x=40;
        y=40;
    }
    if (mouseX+40>255 && mouseY+40>255)
    {
        x=215;
        y=215;
    }
    if (mouseX-40<0 && mouseY+40>255)
    {
        x=40;
        y=215;
    }
    if (mouseY-40<0 && mouseX+40>255)
    {
        x=215;
        y=40;
    }
    if (i==255)
    {
        i=0;
    }
    ellipse(x,y,60,60);
    i++;
    println("The colors is:"+ " R: "+ mouseX+ " G: " + mouseY+ " B:"+ i);
}
