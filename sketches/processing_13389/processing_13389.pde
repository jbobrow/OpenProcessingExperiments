
void setup()
{
  size(200,200);
}
void draw()
{
//  println("hello");
  ellipse(200,100,mouseX, mouseY);
  int i,j,r,g,b;

size(500,500);
noStroke();

for(i=500;i>0;i-=10)
{
  r=(int)random(255);
  g=(int)random(255);
  b=(int)random(255);

  fill(r,g,b);
  ellipse(250,250,i,i);
}

}

                
                
