
void setup() { size(800, 800); noStroke(); }
void draw()
{
background(255,0,0);
float s =100;
for (int y = 0; y < 9; y++)
for (int x = 0; x < 14; x++)
{ if ((x % 2) == (y % 2)) { fill(255); } else  {fill(0);}
rectMode(CENTER);
rect(50 + x * 100 , 50 + y * 100 , s, s);
}
}

