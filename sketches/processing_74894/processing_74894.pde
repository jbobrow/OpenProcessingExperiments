
//Joe Liang, Mods 14-15, Hudnred Random Shapes
void setup()
{
  size(900,600);
  frameRate(10);
}
void draw()
{
  circle();
}
void circle()
{
  background(0);
  
  int x = 1;
  
  while(x<100)
  {
    fill(int(random(20)),int(random(255)),int(random(20)));
    ellipse(150,int(random(400)),int(random(30)),20);
    x++;
    ellipse(int(random(20,150)),400,20,int(random(30)));
    ellipse(300,int(random(50,400)),int(random(30)),20);
    ellipse(int(random(300,500)),400,int(random(30)),20);
    ellipse(500,int(random(50,400)),int(random(30)),20);
    ellipse(int(random(300,500)),30,int(random(30)),20);
    ellipse(int(random(600,850)),30,int(random(30)),20);
    ellipse(600,int(random(50,400)),int(random(30)),20);
    ellipse(int(random(600,850)),400,int(random(30)),20);
    ellipse(int(random(600,850)),200,int(random(30)),20);
  }
  
  }
