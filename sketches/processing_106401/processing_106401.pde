
void setup()    // setup runs at the beginning one time
{
    size(1000,300);
}

void draw()    //loop
{
    fill(255,30,30);
    ellipse(mouseX,mouseY,30,30);
    
    println(mouseY);
}
