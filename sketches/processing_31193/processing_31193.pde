
int counter;

void setup ()
{

  size(500,500);
  background(125);

  fill(255,228,75);
  strokeWeight(5);

  triangle(250,225,150,500,350,500);
  ellipse(255,255,250,250);
  fill(0);
  ellipse(200,225,50,50);
  ellipse(300,225,50,50);
  bezier(200,300,250,350,250,350,300,300);
 
fill(255,228,75);
  bezier(150,180,80,50,80,50,200,150);
  bezier(300,140,420,50,420,50,350,180);
  fill(0);
   triangle(105,80,160,120,130,140);
   triangle(397,75,335,120,370,140);
  fill(255,105,75);
  ellipse(150,275,50,25);
  ellipse(350,275,50,25);
  fill(0);
 int x = 0;
 while (x<6)
 {
   ellipse(50+(x*60),450,40,40);
   x= x + 1;
 }
    
}
void draw ()
{
  //DO NOT PUT ANYTHING HERE YET
}

