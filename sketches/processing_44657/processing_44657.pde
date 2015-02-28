
int d = 25;
void setup( )
{
  size(150, 150);
  background(0);
  smooth();
  stroke(52, 46, 46);
  strokeWeight(10);
  for (int i = 0; i < 150; i = i + 20)
    line (0, i, width, i);
}
void draw () {
  stroke(200, 1, 2);
  strokeWeight(15);
  line(d, d, d, 125);
  line(d, 75, 60, 75);
  line(65, d, 90, d);
  line(65, 125, 90, 125);
  line(90, d, 107, 71);
  line(90, 125, 107, 79);
  line(107, 75, 108, 75);
}


                
                
