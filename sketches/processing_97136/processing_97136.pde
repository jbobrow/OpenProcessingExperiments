
void setup (){
size (200,200);
background (24,10,160);
}

void draw (){
  int x= mouseX;
  int y= mouseY;
noStroke ();
fill (250,167,0);
rect (80,80,40,40);
{
if (x>=80 && x<=120 && y>=80 && y<=120)
background (255);
}
}
