
void setup()
{
  size(500,500);
}
  void draw()
{
    background(255,255,0);
    ellipseMode(CENTER);
    fill(255);
    ellipse(100,100,300,300);
    ellipse(400,100,300,300);
    fill(0,200,255);
    ellipse(110,110,200,200);
    fill(0,200,255);
    ellipse(410,110,200,200);
    fill(0);
    ellipse(120,120,150,mouseY);
    ellipse(400,120,150,mouseY);
    fill(255,0,0);
    line(30,350,350,350);
    

    
}

