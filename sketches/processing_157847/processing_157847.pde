
// mp corcuff août 2014
// galanis: discussion de l'entropie de segments aléatoires
// constitution d'un arraylist de segments aléatoires
// puis réarrangement par rotation des segments qui intersectent chaque segment

ArrayList<Segment> s;
float l=75;
int nmax=1000;

void setup()
{
  size(500,500);
  background(0);
  colorMode(HSB);
  strokeWeight(2);
  smooth(8);
  s=new ArrayList<Segment>();
  while(s.size()<=nmax)
  {
    s.add(new Segment(new PVector(random(width),random(height)),random(0,PI)));
  }
  rendu();
}

void draw()
{
 if (mousePressed)
 {
   update();
   rendu();
 }
}

void rendu()
{
  background(0);
  for(int i=0;i<s.size();i++)
  {
    float ang=s.get(i).angle;
    float x=s.get(i).milieu.x;
    float y=s.get(i).milieu.y;
    float x1=x+(l/2)*cos(ang);
    float y1=y+(l/2)*sin(ang);
    float x2=x+(l/2)*cos(ang+PI);
    float y2=y+(l/2)*sin(ang+PI);
    float c=map(ang,0,PI,0,255);
    stroke(c,255,255);
    line(x1,y1,x2,y2);
  }
}

void update()
{
  for(int i=0;i<s.size();i++)
  {
    for(int j=0;(j<s.size());j++)
    {
      float d=PVector.dist(s.get(i).milieu,s.get(j).milieu);
      if (d<=l)
      {
        // on teste si j intersecte i et on change sa pente si oui
        boolean test=false; 
        float xa=(s.get(j).milieu).x;
        float ya=(s.get(j).milieu).y;
        float xb=(s.get(i).milieu).x;
        float yb=(s.get(i).milieu).y;
        float pa=tan(s.get(j).angle);
        float pb=tan(s.get(i).angle);
        float x_inter=(yb-ya+pa*xa-pb*xb)/(pa-pb);
        float y_inter=ya+pa*(x_inter-xa);
        PVector inter=new PVector(x_inter,y_inter);
        if (PVector.dist(s.get(i).milieu,inter)<=l/2){test=true;}
        if (test)
          {
            float ang_i=s.get(i).angle;
            float ang_j=s.get(j).angle;
            if (ang_j>ang_i)
            {
              if (ang_j-ang_i>PI/2){s.get(j).angle=(ang_j+.05+PI)%PI;}
              else {s.get(j).angle=(ang_j-.05+PI)%PI;}
            }
            else
            {
              if (ang_i-ang_j>PI/2){s.get(j).angle=(ang_j-.05+PI)%PI;}
              else {s.get(j).angle=(ang_j+.05+PI)%PI;}
            }
         }
       }
     }
  }
}

class Segment
{
  PVector milieu;
  float angle;
  // Constructor
  Segment(PVector tempMilieu,float tempAngle)
  {
    milieu=tempMilieu;
    angle=tempAngle;
  }
}




