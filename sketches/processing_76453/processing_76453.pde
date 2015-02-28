
//Computer Programming Lucky Lui Doubling Shapes
int x = 1;

void setup()
{
  size (600,600);
  frameRate(1);
}
 void draw()

 {
   int z=1;
   background(0);
   while (z<=x)
   {
     fill(int(random(1,600)),int(random(1,600)),int(random(1,600)));
  ellipse(int(random(1,600)),int(random(1,600)),50,50);
    z++;
   }
  
   x=x*2;
 }
