
PVector start;
PVector end;

void setup() {
  size(600, 200);
  smooth();

  start = new PVector (random (width), random (height));
  end = new PVector (random (width), random (height));

  frameRate (30);
}


void draw()
{
  background (#57385c);


  float m = map (mouseX, 0, width, 0, 1);

  PVector current = new PVector (lerp (start.x, end.x, m), lerp (start.y, end.y, m));

  strokeWeight (2);
  fill (#ffedbc);
  stroke (#A75265);
  line (start.x, start.y, end.x, end.y);

  ellipse (start.x, start.y, 10, 10);
  ellipse (end.x, end.y, 10, 10);

  fill (#ffffff);
  ellipse (current.x, current.y, 20, 20);
}

void mousePressed ()
{
  start = end.get();
  end.set (random (width), random (height), 0);
}

