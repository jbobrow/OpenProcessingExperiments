
void setup()
{
size(800,600);
background(255);
}
void draw()
{
for(int i=1; i<=40; i=i+1)
{
  strokeWeight(0.2);
  stroke(0,255,0);
  line(100,i*10+80,mouseX,mouseY); 
}
}
