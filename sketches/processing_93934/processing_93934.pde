
/* Surface of revolution
 */
PShape rev;
PShape s;
PImage img;
void setup()
{
  size(200, 200, P3D);
  textureMode(NORMAL); /* texture coordinates 0..1 */
  s = createShape();
  //s.beginShape();
  s.vertex(0, -50);
  s.bezierVertex(50, 50, 50, 50, 0, 100);
  s.end();

  img = loadImage("shape_1.png");
  rev = revolve(s, img);
  //rev = revolveStrip(s, 0);
  println(rev);
  println(rev.getChildCount());
}
int Segments = 64;
PShape revolve(PShape c, PImage tex)
{
  PShape r = createShape(GROUP);
  for (int a=0 ; a<Segments ; a++) 
    r.addChild(revolveStrip(c, a, tex));
  //r.end();
  return r;
}
PShape revolveStrip(PShape c, int n, PImage tex)
{
  float angle = map(n, 0, Segments, 0, TWO_PI);
  float cosa = cos(angle);
  float sina = sin(angle);

  float angleb = map(n+1, 0, Segments, 0, TWO_PI);
  float cosb = cos(angleb);
  float sinb = sin(angleb);

  PShape strip = createShape(QUAD_STRIP);
  strip.texture(tex);
  strip.tint(200, 200);
  //strip.noStroke();
  for (int s = 0 ; s<c.getVertexCount() ; s++)
  {
    float x, y;
    x = c.getVertexX(s);
    y = c.getVertexY(s);
    strip.vertex(x*cosa, y, x*sina, angle/TWO_PI, float(s)/c.getVertexCount());
    strip.vertex(x*cosb, y, x*sinb, angleb/TWO_PI, float(s)/c.getVertexCount());
  }
  strip.end();
  return strip;
}
float roll=0;
float pitch=0;
void draw()
{
  background(204);
  roll = map(mouseY, 0, height, -PI, +PI);
  pitch = map(mouseX, 0, width, -PI, +PI);
  lights();
  translate(width/2, 50, 0);
  rotateX(roll);
  rotateY(pitch);
  shape(s);
  box(100, 10, 10);
  shape(rev);
}



