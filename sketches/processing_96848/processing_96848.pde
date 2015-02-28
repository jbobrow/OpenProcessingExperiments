
int sizes[]= {
  8, 12, 12, 24, 24, 24, 36
};
char shapes[]= {
  '\u2744', '\u2745', '\u2746'
};
class flake
{
  char shape;
  int size;
  float x, y;
  flake ()
  {
    shape=shapes[int(random(shapes.length))];
    size=sizes[int(random(sizes.length))];
    x=random(width);
    y=0;
  }
  void draw()
  {
    textSize(size);
    text(shape, x, y);
    y+=map(size, 10, 30, 1, 0.5);
  }
}
float chance=10;
ArrayList<flake> snow
= new ArrayList<flake>();
void setup()
{
  size(700,500);
}
void draw()
{background(100);
  if(random(100)<chance)
  snow.add(new flake());
  for(flake f : snow) f.draw();
}


