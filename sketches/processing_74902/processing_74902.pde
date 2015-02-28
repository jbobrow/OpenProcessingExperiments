
//Stephanie Wong 100 shapes mods: 14-15
void setup()
{
  size(500,500,P3D);
  frameRate(1);
}
void draw()
{
  background(0);
  int i=1;
  while(i<101)
  {
    pushMatrix();
   translate(int(random(0,500)),int(random(500)),0);
   fill(60+int(random(20,50)),255-int(random(-10,30)),195-int(random(1,30)));
    box(int(random(50)));
    popMatrix();
     i++;
     println(i);
  }
}

