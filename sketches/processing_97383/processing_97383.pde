
ArrayList<PVector> pts = new ArrayList<PVector>();
PVector[][] p  =  new PVector[4][5];
tripoint[] faces = new tripoint[25];
void setup()
{
  size(500, 500, P3D); 
  int count = 0;
  for (int i = 0 ;i<4;i++)
  {
    float y = cos(PI/3.0*i);
    for (int j = 0;j<5;j++)
    {

      float x = cos((2.0*PI/5.0*j)+(PI/5.0*i))*sin(PI/3.0*i);
      float z = sin((2.0*PI/5.0*j)+(PI/5.0*i))*sin(PI/3.0*i); 
      p[i][j] = new PVector(x*100, y*100, z*100);
      pts.add(new PVector(x*100, y*100, z*100));
      //println(p[i][j]);
    }
  }
  for (int i = 0 ;i<4;i++)
  {

    for (int j = 0;j<5;j++)
    {
      int im = (i-1);

      if (im ==-1)
      {
        im =3;
      }

      if (i ==0)
        faces[count] =  new tripoint(p[i][j], p[(i+1)][j], p[(i+1)][(j+1)%5]);
      if (i == 1)
        faces[count] =  new tripoint(p[i][j], p[(i)][(j+1)%5], p[(i+1)][j]);
      if (i ==2)
      {
        faces[count] =  new tripoint(p[i][j], p[i][(j+1)%5], p[i-1][(j+1)%5]);
        count++;
        faces[count] =  new tripoint(p[i][j], p[i][(j+1)%5], p[i+1][(j+1)%5]);
      }
      count++;
    }
  }
    int tesscount =3;
  for (int j =0;j<tesscount;j++)
  {
      for (int i = 0;i<20;i++)
  {
    faces[i].tessellate(100);
  }
  }
}
void draw()
{
  background(255);
  //strokeWeight(10);
  translate(250, 250);
  //noFill();
  //fill(255,100);
  lights();
  rotateX(mouseX/PI/10.0);
  rotateY(mouseY/PI/10.0);

  for (int i = 0;i<20;i++)
  {
    faces[i].display();
  }
}

class tripoint
{
  float m;
  boolean tessed;
  tripoint tp0, tp1, tp2, tp3, tp4, tp5;
  float[][] points;
  tripoint() {
    tessed = false;
  }
  tripoint(PVector p1, PVector p2, PVector p3)
  {
    m = p1.mag();
    this.tessed = false;
    points = new float[3][3];
    arrayCopy(p1.array(), points[0]);
    arrayCopy(p2.array(), points[1]);
    arrayCopy(p3.array(), points[2]);
  }
  tripoint(float p1[], float p2[], float p3[])
  {



    this.tessed = false;
    points = new float[3][3];
    arrayCopy(p1, points[0]);
    arrayCopy(p2, points[1]);
    arrayCopy(p3, points[2]);
  }
  void display()
  {

    if (this.tessed)
    {

      tp0.display();
      tp1.display();
      tp2.display();
      tp3.display();
    }
    else {

      beginShape();
      vertex(points[0][0], points[0][1], points[0][2]);
      vertex(points[1][0], points[1][1], points[1][2]);
      vertex(points[2][0], points[2][1], points[2][2]);
      endShape(CLOSE);
    }
  }
  void tessellate(float mag)
  {
    if (!this.tessed)
    {

      this.tessed = true;

      PVector t1, t2, t3;
      PVector pt1 = new PVector(points[0][0], points[0][1], points[0][2]);
      //0 1
      PVector pt2 = new PVector(points[1][0], points[1][1], points[1][2]);
      //2 1
      PVector pt3 = new PVector(points[2][0], points[2][1], points[2][2]);
      //0 2
      m = pt1.mag();
      pt1.normalize();
      pt2.normalize();
      pt3.normalize();

      t1 = PVector.div(PVector.add(pt1, pt2), 2.0);
      t2 = PVector.div(PVector.add(pt2, pt3), 2.0);
      t3 = PVector.div(PVector.add(pt1, pt3), 2.0);


      t1.normalize();
      t2.normalize();
      t3.normalize();

      t1.mult(m);

      t2.mult(m);

      t3.mult(m);

      pt1.mult(m);
      pt2.mult(m);
      pt3.mult(m);
      tp0 = new tripoint(t1, t3, t2 );
      tp1 = new tripoint(pt2, t1, t2 );
      tp2 = new tripoint(pt1, t1, t3 );
      tp3 = new tripoint(pt3, t3, t2 );
    } 
    else {

      tp0.tessellate(m);
      tp1.tessellate(m);
      tp2.tessellate(m);
      tp3.tessellate(m);
    }
  }
}
