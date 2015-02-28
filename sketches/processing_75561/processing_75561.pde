
void setup()
{
size(1200,1000);
}

void draw()
{
background(random(256),random(256),random(256)); 
fill(random(256),random(256),random(256)); 
rect(random(800),random(600),random(256),random(256));
ellipse(random(800),random(600),random(256),random(256));
line(random(800),random(600),random(256),random(256)); 
for(int k = 0; k<=10; k++)
{
  fill(random(256),random(256),random(256)); 
  rect(0,30*k,30,30);
}
}
