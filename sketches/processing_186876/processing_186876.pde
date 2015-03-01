
void setup()
{
size(800,800);
background(255);
frameRate(70);
}
void draw()
{
stroke(random(12,100),0,0);
strokeWeight(10);
point(width/2,height/2);
for (int i=1; i<=100; i=i+5)
{
point(random(width),random(height));
}
}
