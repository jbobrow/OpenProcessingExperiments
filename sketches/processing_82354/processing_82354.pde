
void setup()
{
  size(200,200);
  frameRate(10);
}
void draw()
{
background(int(random(255)),int(random(255)));
int x = 1;
while(x<49)
 {
   fill(int(random(255)),int(random(255)));
   rect(int(random(200)),int(random(200)),20,20);
   fill(int(random(255)),int(random(255)));
   ellipse(int(random(200)),int(random(200)),20,20);
x=x+1;
 }
}



