
FlyingPoint Fly;
FlyingPoint Breeder;
ArrayList Flies;
int numberBF=10;

int meanPopulation=20;
float angle=0;
float scaleFac=1;
float anim=0.1;
float ch=0.1;
PVector mpos;
boolean hasgrabbed=false;
boolean breeding=false;
float lasttime=0;
float lasttime2=0;
float SourceWait,KillWait;
color gray,darkgray;

int animStep;
Gene G;
PFont font;
void setup()
{
   size(800,600,JAVA2D);
   gray = color(200,200,200);
   darkgray = color(120,120,120);
   colorMode(HSB,1,1,1,1);
   SourceWait =1000;
   KillWait  = 400;
   frameRate(20);
   smooth();
   imageMode(CENTER);
   Flies = new ArrayList();
   for (int i=0;i<numberBF;i++)
     {
     Fly = new FlyingPoint(new PVector(random(0,width-120),random(0,height),random(0.2,1)),new PVector(random(-2,2),random(-2,2),random(-0.01,0.01)),200);
     Fly.B.CreateAnimFlapMovie(10);   
     Flies.add(Fly);
     }
   font = loadFont("ArialMT-30.vlw"); 
   textFont(font,30);

}

void draw()
{
  background(gray);
  fill(darkgray);
  noStroke();
  rect(width-120,0,width,120);
  breeding=false;
  for (int i=0;i<Flies.size();i++)
    {
      Fly = (FlyingPoint) Flies.get(i);
      if (!Fly.B.ButterFlyReady) continue;
      if (Fly.breed) 
          {
            breeding=true;
            Breeder=Fly;
          }
        Fly.Move();
        Fly.Draw();
        if (mousePressed) 
        {
          mpos = new PVector(mouseX,mouseY,0.5);
          if (mouseButton==LEFT)
            {
            Fly.accell = PVector.sub(mpos,Fly.pos);
            Fly.accell.normalize();
            Fly.accell.mult(3);
            }
          else
              {
                if (!hasgrabbed) if (mpos.dist(Fly.pos)<50) 
                    {
                      Fly.grabbed=true;
                      Fly.breed=false;
                      hasgrabbed=true;
                    }
              }
        }
       else Fly.accell.mult(0.5);
    }
    if (breeding)
      {
       if ((millis()-lasttime)>SourceWait)
            {
              lasttime=millis();
               Fly = new FlyingPoint(new PVector(width-60,150,0.7),new PVector(random(-4,-2),random(-1,1),random(-0.01,0.01)),0);
               Fly.B.Genom = Breeder.B.CloneGenom();
               for (int j=0;j<10;j++) Fly.B.MutateGenom(0.3);
               Fly.B.CreateAnimFlapMovie(10);
               Flies.add(Fly);
               numberBF++;
            }
      }
   if (Flies.size()>meanPopulation) if ((millis()-lasttime2)>KillWait)
             {
                lasttime2=millis();
                Fly = (FlyingPoint) Flies.get(0);
                if ((!Fly.grabbed)&&(Fly!=Breeder)) Flies.remove(0);
                else Flies.remove(1);
             }
}

void mouseReleased()
  {
    hasgrabbed=false;
      for (int i=0;i<Flies.size();i++)
    {
      Fly = (FlyingPoint) Flies.get(i);
      if (Fly.grabbed)
        {
        Fly.grabbed=false;
        Fly.pos=new PVector(mouseX,mouseY,0.5);
        if (Fly.breed)
          {
            Fly.breed=false;
            Fly.B.CreateAnimFlapMovie(10);
          }
        if (!breeding) if (Fly.pos.dist(new PVector(width-60,60))<60)
            {
              // mutating & breeding
              Fly.breed=true;
              Fly.pos=new PVector(width-60,60,1);
            }
        }
    }
  }

