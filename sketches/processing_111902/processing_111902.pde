
rando[] rx = new  rando[50];
void setup()
{
  size(700, 300);
  smooth();
  frameRate(5);
  for (int i=0;i<rx.length;i++)
  {
    rx[i] = new rando(color(random(255), random(255), random(255)));
  }
}

void draw()
{
  background(0);
  for (int j=0;j<rx.length;j++)
  {
    rx[j].run();
  }
}




class rando {
  color c;
  rando(color _c) {
    c =_c;
  }

  void run()
  {
    int x = (int)random(0, width);
    int y = (int)random(0, height);
    int x1 = (int)random(0, width);
    int y1 = (int)random(0, height);
    int l=10;
    float x2 = x1+l*sin(PI/4)*random(-1, 1);
    float y2 = y1+l*cos(PI/4);
    int i = (int) random(0,2);
    if (i==1) {
      fill(c);
    }
    else
    {
      noFill();
    }
    stroke(c);
    rect(random(0, width), random(0, height), 8, 8);

    beginShape();
    { 
      fill(c);
      vertex(x, y);
      vertex(x+8, y);
      vertex(x+8, y+8);
      vertex(x, y);
    }
    endShape();
    line(x1, y1, x2, y2);
    stroke(random(0, 255));
    point(random(0, width), random(0, height));
  }
}

