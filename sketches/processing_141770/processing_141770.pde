
PVector[] points;
int n=120;//10 // number of circles to draw
int rad=300;//15  // size or radius of the Bigger Circle
float siz;

void setup()
{
  size(650,650);
  noLoop();
  siz=20;
}

void draw(){
 background(220,100);

 translate(width/2,height/2);
 fill(255,0,0,10);
 points = new PVector[n];

  for(int j=1;j<=31;j++)
  {
    if(j<6 || j>26)//j<8 || j >24)
    {
      for (int i = 0; i < n; i++) 
      {
        float ang = lerp(0, TWO_PI, (float) i/n);
        points[i] = new PVector( rad * cos(ang), rad * sin(ang) );
        ellipse(points[i].x,points[i].y,siz,siz);//20,20);
      }
    }
    rad=rad-20;
    siz=siz-.5;
  }
//ellipse(0,0,20,20);
}
