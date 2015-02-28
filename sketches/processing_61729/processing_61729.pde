
void setup()
{
size(400,100);

noStroke();
fill(0);
}
void draw(){
  frameRate (30);
background(25);
if(mouseX<width/2) 
{
for(int i=0; i<400; i=i+3) 
{
noStroke();
float r = random(400);
float l = random(130,250);
float m = random(130, 255);
float n = random(0,100); 
fill(l,m,255, 90);
ellipse(i, n, n, i);
}
}
else
{
noStroke();

for(int i=5; i<400; i=i+15) {
float r = random(400);
alpha (10);
ellipse(i, r, 100, 70);
}
}
}

