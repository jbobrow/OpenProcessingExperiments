
void setup()
{
  size(250, 250);
}
 
void draw()
{
    background(255);
    noStroke();
    
    if(mouseX > 100 && mouseX < 150 && mouseY > 100 && mouseY < 150 && mousePressed == true)
    {
        fill(255, 100, 0);
        rect(100, 100, 50, 50);
        }
    else
    {
        fill(100);
        rect(100, 100, 50, 50);
    }
}
