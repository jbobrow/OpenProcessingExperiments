

final int NB_SYMETRIES = 6;
float R;//length of the triangles hypotenuse
float h, l, theta;//height, length, angle of the triangles
float rot = 0;//rotation of the texture-mapping triangle
PVector c;
PVector[] p = new PVector[4];
float sizeCoeff = 1;


MyNoise myNoise = new MyNoise();

void setup()
{
  size(700, 850, P3D);
  background(0);
  noStroke();
  initialize();
}

void initialize()
{
  R = random(max(width, height)/100, max(width, height)/2);

  theta = TWO_PI / NB_SYMETRIES;
  l = R*cos(theta/2);
  h = R*sin(theta/2);
  for (int i = 0; i < 3; i++)
  {
    p[i] = new PVector(width/2, height/2);
  }
  c = new PVector(width/2, height/2);

  myNoise.init();
}

void draw()
{
  background(0);

  myNoise.update();
  sizeCoeff = map(mouseX, 0, width, min(1, min(width, height)/2/max(h, l)), min(min(width, height)/2/max(h, l), 3));
  rot = map(mouseY, 0, height, 0, TWO_PI);

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  p[0].x = c.x;
  p[0].y = c.y;
  p[1].x = c.x - sizeCoeff * h * sin(rot);
  p[1].y = c.y - sizeCoeff * h * cos(rot);
  p[2].x = c.x + sizeCoeff * l * cos(rot);
  p[2].y = c.y - sizeCoeff * l * sin(rot);
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  noStroke();
  for (int v = 0; v < width / (2*h); v++)
  {
    for (int w = 0; w < height / (2*l) + 1; w++)
    {
      pushMatrix();
      translate(v * 3 * h, ((v % 2 == 0) ? 0 : l) + w * 2 * l);
      beginShape(TRIANGLES);
      texture(myNoise.myPg);
      for (int i = 0; i < NB_SYMETRIES; i++)
      {
        vertex(0, 0, p[2].x, p[2].y);
        vertex(R*cos(i*TWO_PI/NB_SYMETRIES), R*sin(i*TWO_PI/NB_SYMETRIES), p[1].x, p[1].y);
        vertex(l*cos(i*TWO_PI/NB_SYMETRIES-theta/2), l*sin(i*TWO_PI/NB_SYMETRIES-theta/2), p[0].x, p[0].y);

        vertex(0, 0, p[2].x, p[2].y);
        vertex(R*cos((i+1)*TWO_PI/NB_SYMETRIES), R*sin((i+1)*TWO_PI/NB_SYMETRIES), p[1].x, p[1].y);
        vertex(l*cos((i+1)*TWO_PI/NB_SYMETRIES+theta/2), l*sin((i+1)*TWO_PI/NB_SYMETRIES+theta/2), p[0].x, p[0].y);
      }
      endShape();
      popMatrix();
    }
  }
  /*
  //draw the triangle that is used for the texturing
   noFill();
   stroke(120);
   beginShape(TRIANGLES);
   //texture(myNoise.myPg);
   for (int i = 0; i < 3; i++)
   {
     vertex(p[i].x, p[i].y);//, p[i].x, p[i].y);
   }
   endShape();
   */
}

void mousePressed()
{
  initialize();
}


