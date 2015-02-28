
int x= 350;
int y= 350;
int i = 100;


void setup()
{
size(700, 700);
smooth();
noStroke();
}

void draw()
{
fill(255, 20); 
rect(0,0,width,height);

float d= dist(mouseX, mouseY, x, y);

if (mousePressed== true)
{
  fill(237, 74, 177);
  ellipse(x, y+100, 50, 50);
  ellipse(x, y-100, 50, 50);
  ellipse(x, y+170, 50, 50);
  ellipse(x, y-170, 50, 50);
  ellipse(x+200, y, 50, 50);
  ellipse(x-200, y, 50, 50);
}

if (d>=i) {
  fill(255,0, 0, 20);
  i++;
}
else 
{
  fill (247, 247, 50, 20);
  i--;
  


}
  
  ellipse (x, y, i, i);
  ellipse (x+100, y, i,i);
  ellipse (x-100, y, i, i);
}



