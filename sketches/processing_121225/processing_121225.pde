

ArrayList<Constellation> sky;
ArrayList<Comet> comets;
int numConstellations=10;
Clouds bg;
void setup()
{
  size(600,400);
  bg=new Clouds();
  comets=new ArrayList<Comet>();
  sky=new ArrayList<Constellation>();
  for(int i=0;i<numConstellations;i++)
  {
    float h=random(50,100);
    float w=random(50,100);
    float x=random(w,width-w);
    float y=random(h,height-h);
    sky.add(new Constellation(x,y,w,h));
  }
}

void draw()
{
  background(0);
  bg.render();
  for(int i=0;i<numConstellations;i++)
  {
    sky.get(i).update();
    sky.get(i).render();
  }
  
  for(int i=0;i<comets.size();i++)
  {
    comets.get(i).update();
    comets.get(i).render();
  }
  
  if(numConstellations==0)
  {
    for(int i=0;i<comets.size();i++)
    {
      if(i<comets.size()-1)
      {
        Comet comet1=comets.get(i);
        Comet comet2=comets.get(i+1);
        stroke(255);
        line(comet1.x,comet1.y,comet2.x,comet2.y);
        noFill();
        ellipse(comet1.x,comet1.y,comet1.r*2,comet1.r*2);
      }
    }
  }
  
  for(int i=0;i<numConstellations;i++)
  {
    for(int j=0;j<comets.size();j++)
    {
    if(sky.get(i).isCollide(comets.get(j).x,comets.get(j).y))
    {
      sky.get(i).a=0;
      numConstellations-=1;
    }
    }
  }
  
  
}

void mouseClicked()
{
  if(numConstellations>0)
  {
    comets.add(new Comet(mouseX,mouseY));
  }
}
  
class Clouds
{
  int[] stars=new int[160];
  
  Clouds()
  {
    for(int i=0;i<160;i=i+4)
    {
     stars[i]= int(random(0,width));
     stars[i+1]=int(random(0,height));
     stars[i+2]=int(random(2,10));
     stars[i+3]=int(random(100,255));
    }
  }
  
  void render()
  {
    noStroke();
   for(int i=0;i<160;i=i+4)
   {
     fill(255,stars[i+3]);
     ellipse(stars[i],stars[i+1],stars[i+2],stars[i+2]);
   }
  }
  
  
}
class Comet
{
  float x;
  float y;
  float r;
  float speed;
  float targetx;
  float targety;
  
  Comet(float tx,float ty)
  {
    targetx=tx;
    targety=ty;
    r=20;
    //Start at the top of the screen
    x=width/2;
    y=r;
  }
  
  void update()
  {
    
    //Illusion of depth, make the comet smaller as it approaches
    /*if(r>0){r-=.1;}
    else{r=0;}*/
    
    //Move the comet towards the target
    x=(0.95*x+0.05*targetx);
    y=(0.95*y+0.05*targety);
  }
  
  void render()
  {
    float a=sin(millis()/100);
    a=map(a,-1,1,50,200);
    fill(255,a);
    ellipse(x,y,r,r);
    ellipse(x,y,r/2,r/2);
    ellipse(x,y,r-2,r-2);
    ellipse(x,y,r-4,r-4);
  }
  
}
    
  
class Constellation
{
  float x;
  float y;
  float w;
  float h;
  float a;
  float r;
  char drawType;
  char[] starForms={'c','a','s'};
  boolean notDead=true;
  
  Constellation()
  {
    x=100;
    y=100;
    w=20;
    h=20;
  }
  Constellation (float ax, float ay,float aw,float ah)
  {
    x=ax;
    y=ay;
    w=aw;
    h=ah;
    a=100;
    r=10;
    int picker=int(random(0,3));
    drawType=starForms[picker];
  }
  
  void update()
  {
    if(a<0)
    {
      notDead=false;
    }
    
    if(notDead)
    {
      if(drawType=='c')
        {
          r=sin(millis()/250);
          r=int(map(r,-1,1,2,5));
        }
      if(drawType=='a')
        {
          r=sin(millis()/700);
          r=int(map(r,-1,1,2,5));
        }
      if(drawType=='s')
        {
          r=sin(millis()/500);
          r=int(map(r,-1,1,2,7));
        }
    }
    
  }
  
  void render()
  {
    stroke(255,a);
    //noFill();
    //rect(x,y,w,h);
    fill(255,a);
    drawStars();
  }
  
  void drawLayers(float px, float py)
  {
   for(int i=0;i<3;i++)
    {
     ellipse(px,py,r-i,r-i);
    } 
  }
  
  void drawStars()
  {
    float posx=x+(((x+w)-x)/2);
    float posy=y+(((y+h)-y)/2);
    float midx=(((posx)-x)/2);
    float midy=(((posy)-y)/2);
    float r2=r*2;
    if(drawType=='c')
    {
      r2=r*1.7;
      ellipse(x,posy,r,r);
      ellipse(x+midx,y+midy-5,r,r);
      line(x,posy,x+midx,y+midy-5);
      ellipse(posx,y,r,r);
      line(x+midx,y+midy-5,posx,y);
      ellipse(posx+midx,posy+midy,r,r);
      line(posx,y,x+w,posy);
      ellipse(x+w,posy,r,r);
      line(x+w,posy,posx+midx,posy+midy);
      ellipse(x+midx,posy+midy,r,r);
      line(posx+midx,posy+midy,posx,y+h);
      ellipse(posx,y+h,r,r);
      line(posx,y+h,x+midx,posy+midy);
      ellipse(posx+midx,y+midy,r,r);
      line(x+midx,posy+midy,x,posy);
      noFill();
      ellipse(x,posy,r2,r2);
      ellipse(x+midx,y+midy-5,r2,r2);
      ellipse(posx,y,r2,r2);
      ellipse(posx+midx,posy+midy,r2,r2);
      ellipse(x+w,posy,r2,r2);
      ellipse(x+midx,posy+midy,r2,r2);
      ellipse(posx,y+h,r2,r2);
      ellipse(posx+midx,y+midy,r2,r2);
      
    }
    if(drawType=='a')
    {
      ellipse(x,y,r,r);
      ellipse(posx,posy,r,r);
      line(x,y,posx,posy);
      ellipse(posx+(midx/2),posy,r,r);
      line(posx,posy,posx+(midx/2),posy);
      ellipse(posx,y+h,r,r);
      line(posx+(midx/2),posy,posx,y+h);
      noFill();
      ellipse(x,y,r2,r2);
      ellipse(posx,posy,r2,r2);
      ellipse(posx+(midx/2),posy,r2,r2);
      ellipse(posx,y+h,r2,r2);
    }
    if(drawType=='s')
    {
      r2=r*2.2;
      ellipse(posx,y,r,r);
      ellipse(x+midx,y+midy,r,r);
      line(posx,y,x+midx,y+midy);
      ellipse(posx+midx,posy,r,r);
      line(x+midx,y+midy,posx+midx,posy);
      ellipse(x+midx,y+h,r,r);
      line(posx+midx,posy,x+midx,y+h);
      noFill();
      ellipse(posx,y,r2,r2);
      ellipse(x+midx,y+midy,r2,r2);
      ellipse(posx+midx,posy,r2,r2);
      ellipse(x+midx,y+h,r2,r2);
      
    }
    
  }
  
  boolean isCollide(float cx,float cy)
  {
   if(cx>=x && cx<=x+w)
   {
     if(cy>=y && cy<=y+h)
     {
       return true;
     }
   }
   return false;
  }

  
}
  


