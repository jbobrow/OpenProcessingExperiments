
int qw=1;
void setup()
{
  size (600, 600, P3D);
  frameRate(1);
}
void draw()
{
  int f=int(random(0, 256));
  int fc=int(random(0, 256));
  int fb=int(random(0, 256));
  int dd=0;
  background(f, fc, fb);
  lights();
  int x=1; 
  int g=int(random(0, 2));
    while (x<=qw)
    {
      if (g==1)
      {
        pushMatrix();
        int p= int(random(0, 600));
        int d= int(random(0, 600));
        int z= int(random(-600, 0));
        int q= int(random(5, 50));
        int c= int(random(0, 256));
        int o=int(random(0, 256));
        int l= int(random(0, 256));
        float w=random(-1, 1);
        noStroke();
        fill(c, o, l);
        translate(p, d, z);
        sphere(q);
        x++;
        popMatrix();
      }
      if (g==0)
      {
        pushMatrix();
        int p= int(random(0, 600));
        int d= int(random(0, 600));
        int z= int(random(-200, 0));
        int q= int(random(5, 50));
        int c= int(random(0, 256));
        int o=int(random(0, 256));
        int l= int(random(0, 256));
        float w=random(-1, 1);
        strokeWeight(2);
        stroke(0, 0, 0);
        fill(c, o, l);
        translate(p, d, z);
        rotateX(w);
        rotateY(w);
        rotateZ(w);
        w++;
        box(q);
        x++;
        popMatrix();
      }
    }
    qw=qw*2;
    if(qw>1800)
    {
      qw=1;
    }
}

