
Spine[] spine = new Spine[10];
PVector[] p1 = new PVector[spine.length];
PVector[] p2 = new PVector[spine.length];
PVector[] c1 = new PVector[spine.length];
PVector[] c2 = new PVector[spine.length];
int[] cl = new int[spine.length];

void setup()
{
  size(600, 600, P3D);

  for (int i = 0; i<spine.length; i++)
  {
      cl[i] = color(random(128, 256));
      spine[i] = new Spine(50, cl[i]);
      p1[i] = new PVector(random(-width, width), random(-height, height), random(-width));
      p2[i] = new PVector(random(-width, width), random(-height, height), random(-width));
      c1[i] = new PVector(random(-width / 2, width), random(-height / 2, height), random(-width / 2, width));
      c2[i] = new PVector(random(-width / 2, width), random(-height / 2, height), random(-width / 2, width));   
  }
}

void draw()
{
  background(0, 32, 32);

  translate(width/2, height/2);

  for (int i = 0; i<spine.length; i++)
  {
    spine[i].run(p1[i].x, p1[i].y, p1[i].z, c1[i].x, c1[i].y, c1[i].z, c2[i].x, c2[i].y, c2[i].z, p2[i].x, p2[i].y, p2[i].z);
  }
}

void mousePressed()
{
    for (int i = 0; i<spine.length; i++)
    {
      p1[i].x = random(-width, width);
      p1[i].y = random(-height, height);
      p1[i].z = random(-width);
      p2[i].x = random(-width, width);
      p2[i].y = random(-height, height);
      p2[i].z = random(-width);
      c1[i].x = random(-width / 2, width);
      c1[i].y = random(-height / 2, height);
      c1[i].z = random(-width / 2, width);
      c2[i].x = random(-width / 2, width);
      c2[i].y = random(-height / 2, height);
      c2[i].z = random(-width / 2, width);
    }
}

// void mouseMoved()
// {
//   p1.x = mouseX + random(width);
//   p1.y = mouseY + random(height);
//   p2.x = mouseX + random(width);
//   p2.y = mouseY + random(height);
//   c1.x = mouseX + random(-width / 2, width);
//   c1.y = mouseY + random(-height / 2, height);
//   c2.x = mouseX + random(-width / 2, width);
//   c2.y = mouseY + random(-height / 2, height);
// }

class Spine
{
  PVector p1;
  PVector p2;
  PVector c1;
  PVector c2;
  int num;
  int col;

  Spine(int num, int col)
  {
    this.p1 = new PVector();
    this.p2 = new PVector();
    this.c1 = new PVector();
    this.c2 = new PVector();
    this.num = num;
    this.col = color(col);
  }

  void run(float x1, float y1, float z1, float cx1, float cy1, float cz1, float cx2, float cy2, float cz2, float x2, float y2, float z2)
  {
    update(x1, y1, z1, cx1, cy1, cz2, cx2, cy2, cz2, x2, y2, z2);
    draw();
  }

  void update(float x1, float y1, float z1, float cx1, float cy1, float cz1, float cx2, float cy2, float cz2, float x2, float y2, float z2)
  {
    this.p1.x += (x1 - this.p1.x) * 0.1f;
    this.p1.y += (y1 - this.p1.y) * 0.1f;
    this.p1.z += (z1 - this.p1.z) * 0.1f;
    this.p2.x += (x2 - this.p2.x) * 0.1f;
    this.p2.y += (y2 - this.p2.y) * 0.1f;
    this.p2.z += (z2 - this.p2.z) * 0.1f;
    this.c1.x += (cx1 - this.c1.x) * 0.1f;
    this.c1.y += (cy1 - this.c1.y) * 0.1f;
    this.c1.z += (cz1 - this.c1.z) * 0.1f;
    this.c2.x += (cx2 - this.c2.x) * 0.1f;
    this.c2.y += (cy2 - this.c2.y) * 0.1f;
    this.c2.z += (cz2 - this.c2.z) * 0.1f;
  }

  void draw()
  {
    noFill();
    strokeWeight(0.5f);
    // stroke(255, 100);
    for (int i = 0; i<num; i++)
    {
        float sc = i * 0.025f;
        stroke(col, 100 * sc);
        bezier(p1.x, p1.y, p1.z, c1.x * sc, c1.y * sc, c1.z * sc, c2.x * sc, c2.y * sc, c2.z * sc, p2.x, p2.y, p2.z);
    }
  }
}
