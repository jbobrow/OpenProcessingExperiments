
/* @pjs preload="microbial.jpg"; */
ArrayList Larven, Algae;
LARVE tempLARVE;
ALGA tempALGA;
PImage BACK;

public void setup() 
{
  size(600,600,P2D);
  smooth();
  frameRate(30);
  noCursor();
  BACK = loadImage("microbial.jpg");
  background(255);
  Larven = new ArrayList();
  Algae = new ArrayList();
  for(int i=0;i < 40;i++)
  {
    Larven.add(new LARVE()); 
  }
  for(int i=0;i<5;i++)
  {
    Algae.add(new ALGA());
  }
}

public void draw()
{
  background(255);
  image(BACK.get(mouseX,mouseY,600,600),0,0);
  pushStyle(); 
  strokeWeight(3);
  stroke(120,50);
  noFill();
  ellipse(mouseX,mouseY,15,15);
  popStyle();
  for(int i=0;i<Algae.size() && Algae.size()<400;i++)
  {
    tempALGA = (ALGA) Algae.get(i);
    tempALGA.GROW(Algae);
  }
  for (int i =0;i <Larven.size();i++)
  {
    tempLARVE  = (LARVE) Larven.get(i);
    tempLARVE.CRAWL(Larven,Algae);
  }
  for(int i=0;i<Algae.size();i++)
  {
    tempALGA = (ALGA) Algae.get(i);
    tempALGA.RENDER();
  }
  for (int i =0;i <Larven.size();i++)
  {
    tempLARVE  = (LARVE) Larven.get(i);
    tempLARVE.EAT(Larven,Algae);
    tempLARVE.RENDER();
  }
}
public class ALGA
{
  VEC2D ROOT;
  int MASS, COLOR;
 
  ALGA()
  {
    MASS = 1;
    ROOT = new VEC2D(int(random(0,1199)/20)*20+10,int(random(0,1199)/20)*20+10);
    COLOR = int(random(65,155));
  }
  
  ALGA(float X,float Y)
  {
    MASS = 1;
    ROOT = new VEC2D(X,Y);
    COLOR = int(random(70,121));
  }
  
  public void GROW(ArrayList tempL)
  {
    ALGA TA1;
    boolean changed = false;
    int modX = int(random(-1.99,1.99))*20;
    int modY = int(random(-1.99,1.99))*20;
    if(random(0,35)<1)
    {
      for(int i=0;i<tempL.size() && !changed;i++)
      {
        TA1 = (ALGA) tempL.get(i);
        if(TA1.ROOT.X==ROOT.X+modX && TA1.ROOT.Y==ROOT.Y+modY)
        {
          changed = true;
          if(TA1.MASS<10)
          {
            TA1.MASS++;
          }
        }
      }
      if(!changed && ROOT.X+modX>0 && ROOT.X+modX<1200 && ROOT.Y+modY>0 && ROOT.Y+modY<1200)
      {
        tempL.add(new ALGA(ROOT.X+modX,ROOT.Y+modY));
      }
    }
  }
  
  public void RENDER()
  {
    noStroke();
    fill(0,COLOR,0,10+MASS*5);
    rect(ROOT.X-10-mouseX,ROOT.Y-10-mouseY,20,20); 
  }
}
public class LARVE 
{
  VEC2D HEAD, HINTERN, DIRECTION;
  int render_count,LARVE_SIZE,FOOD,escapeD,pupate;

  LARVE()
  {
    LARVE_SIZE = int( random(-1,7) );
    HEAD = new VEC2D(random(-50,1200+50),random(-50,1200+50));
    DIRECTION = new VEC2D(random(1),random(1));
    DIRECTION.NORMALIZE2D();
    render_count=int(random((LARVE_SIZE/2)*2));
    HINTERN = new VEC2D(DIRECTION.X*-1*LARVE_SIZE,DIRECTION.Y*-1*LARVE_SIZE);
    FOOD = 0;
    escapeD = 80;
  }

  LARVE (int tempSIZE,VEC2D temp){
    LARVE_SIZE = tempSIZE;
    HEAD = new VEC2D(temp);
    DIRECTION = new VEC2D(random(1),random(1));
    DIRECTION.NORMALIZE2D();
    render_count=int(random((LARVE_SIZE/2)*2));
    HINTERN = new VEC2D(DIRECTION.X*-1*LARVE_SIZE,DIRECTION.Y*-1*LARVE_SIZE);
    FOOD = 0;
    escapeD = 80;
  }

  public void CRAWL (ArrayList tempL, ArrayList tempS) 
  {
    if (LARVE_SIZE ==4)
    {
      //adolesence 
      pupate++;
      if (pupate>random(80,120))
        LARVE_SIZE++ ;
    }
    if (LARVE_SIZE <= 0 && render_count > random(80,120) ) 
    { 
      //pupates
      LARVE_SIZE ++ ;
    } 
    else if (LARVE_SIZE > 0) {
      VEC2D tempVEC = new VEC2D(DIRECTION);
      int TL = LARVE_SIZE*4;
      if(render_count > LARVE_SIZE*7)
      { 
        FIND_FOOD(tempL,tempS);
        render_count = 0; 
      }
      else if (render_count > TL) {
        tempVEC.MULT_VEC(.2f);
        HEAD.ADD_VEC(tempVEC);
      }
      else {
        tempVEC.MULT_VEC(-1);
        HEAD.ADD_VEC(DIRECTION);
      }
      HEAD.X = (HEAD.X > 1200+TL) ? HEAD.X-1200-TL : HEAD.X;
      HEAD.X = (HEAD.X < -TL) ? HEAD.X+1200+TL : HEAD.X;
      HEAD.Y = (HEAD.Y > 1200+TL) ? HEAD.Y-1200-TL : HEAD.Y;
      HEAD.Y = (HEAD.Y < -TL) ? HEAD.Y+1200+TL : HEAD.Y;
    }
    render_count++;
  }

  public void FIND_FOOD(ArrayList tempL,ArrayList tempS)
  {
    VEC2D tempVEC = new VEC2D(mouseX*2,mouseY*2);      
    boolean changed = false;
    LARVE TL1;
    ALGA TA1;
    if (LARVE_SIZE <= 0){
      println("omg");
    }
    else if (LARVE_SIZE < 4 ) 
    {
      for (int i = 0; i < tempL.size() && !changed;i++) 
      {
        TL1 = (LARVE) tempL.get(i);
        if(TL1 != this && TL1.LARVE_SIZE >= 4 && dist(TL1.HEAD.X,TL1.HEAD.Y,HEAD.X,HEAD.Y) < escapeD ) 
        {
          DIRECTION.FROM_TO(TL1.HEAD,HEAD);
          DIRECTION.ADD_VEC(new VEC2D(random(-1,1),random(-1,1)));
          DIRECTION.NORMALIZE2D();
          changed = true;
        } 
      }
      if (!changed) 
      {
        changed = false;
        for (int i = 0; i < tempS.size() && !changed;i++) 
        {
          TA1 = (ALGA) tempS.get(i);
          if(dist(TA1.ROOT.X,TA1.ROOT.Y,HEAD.X,HEAD.Y) < escapeD*1.5) 
          {
            DIRECTION.FROM_TO(HEAD,TA1.ROOT);
            DIRECTION.NORMALIZE2D();
            changed = true;
          }
        }
      }
    }
    else if (LARVE_SIZE == 4 ) 
    {
      for (int i = 0; i < tempL.size() && !changed;i++) 
      {
        TL1 = (LARVE) tempL.get(i);
        if(TL1 != this && TL1.LARVE_SIZE > 6 && dist(TL1.HEAD.X,TL1.HEAD.Y,HEAD.X,HEAD.Y) < escapeD ) 
        {
          DIRECTION.FROM_TO(TL1.HEAD,HEAD);
          DIRECTION.ADD_VEC(new VEC2D(random(-1,1),random(-1,1)));
          DIRECTION.NORMALIZE2D();
          changed = true;
        } 
      }
    }
    else if (LARVE_SIZE > 4) 
    {
      for (int i = 0; i < tempL.size() && !changed;i++) 
      {
        TL1 = (LARVE) tempL.get(i);
        if(TL1.LARVE_SIZE > 0 && TL1.LARVE_SIZE < 4 && dist(TL1.HEAD.X,TL1.HEAD.Y,HEAD.X,HEAD.Y) < escapeD*1.5) 
        {
          DIRECTION.FROM_TO(HEAD,TL1.HEAD);
          DIRECTION.NORMALIZE2D();
          changed = true;
        }        
      }
    }
  }

  public void EAT(ArrayList tempL,ArrayList tempS){
    VEC2D tempVEC = new VEC2D(mouseX*2,mouseY*2);
    LARVE TL1;
    ALGA TA1;
    boolean changed = false;   
    if (LARVE_SIZE <= 0 || tempL.size() < 4)
    {
    } 
    else if (LARVE_SIZE < 4 ) 
    {
      for(int i=0;i<tempS.size() && !changed;i++)
      {
        TA1 = (ALGA) tempS.get(i);
        if(dist(TA1.ROOT.X,TA1.ROOT.Y,HEAD.X,HEAD.Y) <= 10)
        {
          if(TA1.MASS == 1)
          {
            tempS.remove(i);
          }
          else
          {
            TA1.MASS--;
          }
          FOOD++;
          changed = true;
        }
      }
    }
    else if (LARVE_SIZE > 4) 
    {
      for (int i = 0; i < tempL.size() && !changed && tempL.size() > 4;i++) 
      {
        TL1 = (LARVE) tempL.get(i);
        if(TL1.LARVE_SIZE < 4 && TL1.LARVE_SIZE > 0 && dist(TL1.HEAD.X,TL1.HEAD.Y,HEAD.X,HEAD.Y) <= (TL1.LARVE_SIZE*3+LARVE_SIZE*3)/3) 
        {
          FOOD += TL1.LARVE_SIZE*4;
          tempL.remove(i);
          changed = true;
        } 
        if(TL1.LARVE_SIZE > 4 && dist(TL1.HEAD.X,TL1.HEAD.Y,HEAD.X,HEAD.Y) != 0 && dist(TL1.HEAD.X,TL1.HEAD.Y,HEAD.X,HEAD.Y) <= 15)
        {
          if (LARVE_SIZE > TL1.LARVE_SIZE) 
          {
            tempL.remove(i);
          }
          else if (LARVE_SIZE == TL1.LARVE_SIZE && FOOD > TL1.FOOD) 
          {
            tempL.remove(i);
          }
          else 
          {
            tempL.remove(this); 
          }
          for (int j =0;j <= TL1.LARVE_SIZE*2 && tempL.size() < 80;j++)
          {
            tempL.add( new LARVE(0,HEAD) );
          }
          changed = true;
        }
      }
    }
    if (FOOD > LARVE_SIZE*30) 
    {
      LARVE_SIZE++;
      FOOD = 0;
    }
  }


  public void RENDER() 
  {
    fill(150,50);
    strokeWeight(2);
    stroke(100,100);
    if (LARVE_SIZE <= 0) 
    {
      ellipse(HEAD.X-mouseX,HEAD.Y-mouseY,2,2);
    } 
    else
    {
      VEC2D tempVEC = new VEC2D(DIRECTION);
      tempVEC.MULT_VEC(LARVE_SIZE*1.5);
      pushMatrix();
      ellipse(HEAD.X-mouseX,HEAD.Y-mouseY,LARVE_SIZE*3,LARVE_SIZE*3); 
      popMatrix();
} } }
class VEC2D
{
  float X,Y;
  int count;

  VEC2D ()
  {
    X = 1;
    Y = 0;
    count = 0;
  }

  VEC2D(VEC2D t)
  {
    X = t.X;
    Y = t.Y;
    count = 0;
  }

  VEC2D (float x1,float y1)
  {
    X= x1; 
    Y = y1; 
    count =0;
  }

  public void ADD_VEC (VEC2D temp)
  {
    X += temp.X;
    Y += temp.Y; 
  }

  public void DIV_VEC (float divid)
  {
    X /= divid;
    Y /= divid; 
  }

  public void MULT_VEC (float divid)
  {
    X *= divid;
    Y *= divid; 
  }

  public void NORMALIZE2D ()
  {
    float d = dist(0,0,X,Y);
    X /= d;
    Y /= d;
  }

  public float DIST2D()
  {
    return dist(0,0,X,Y); 
  }
  
  public void PERP2D()
  {
    float tempX = X;
    X = 0 - Y;
    Y = tempX;
  }
  
  public void FROM_TO(VEC2D FROM,VEC2D TO)
  {
    X = TO.X - FROM.X;
    Y = TO.Y - FROM.Y;
    NORMALIZE2D();
  }
}


