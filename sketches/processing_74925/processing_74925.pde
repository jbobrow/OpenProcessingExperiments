
//Benjamin Z.; Block 6; CP1
void setup()
{
  size(600, 600, P3D);
  frameRate(5);
  background(0);
}

void draw()
{
  int q=0;
  background(0);
  lights();
  while (q<=100)
  {
    float a=int(random(10, 50));
    float b=int(random(10, 50));
    int x=int(random(-451, 451));  
    int y=int(random(-451, 451));  
    int z=int(random(-21, 21)); 
    translate(250+x, 250+y, z);  
    fill(random(255), random(255), random(255), 110);
    box(a,b, 50);
    fill(random(255), random(255), random(255), 30);
    box(a-5,b-5, 45);
     fill(random(255), random(255), random(255), 10);
     box(a+5,b+5, 55);
    translate(-(250+x), -(250+y), z);
    q++;
  }
}
