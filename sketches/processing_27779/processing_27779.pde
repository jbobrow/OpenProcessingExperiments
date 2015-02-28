
int r_inicial=10,muerto=0,inicio=5,pMaximo=0;
float rasa=5;
comida c;
serpiente e=new serpiente(100);
PFont l;  
void setup()
{
  size(450,450);
  background(0);
  l=loadFont("Andy-Bold-100.vlw");
  textFont(l,30);
  c = new comida(random(r_inicial,width-r_inicial),random(r_inicial,height-r_inicial),10,0);
}
void draw()
{
  background(255);
  fill(0,100);
  text("Score: "+muerto+"       Max Score: "+pMaximo,30,30);
  if(keyPressed)
  {
    if(keyCode==38&&e.vy!=rasa)
    {
      e.vy=-rasa;
      e.vx=0;
    }
    if(keyCode==40&&e.vy!=-rasa)
    {
      e.vy=rasa;
      e.vx=0;
    }
    if(keyCode==37&&e.vx!=rasa)
    {
      e.vx=-rasa;
      e.vy=0;
    }
    if(keyCode==39&&e.vx!=-rasa)
    {
      e.vx=rasa;
      e.vy=0;
    }
    if(key==ENTER)
    {
      if(muerto>pMaximo)
        pMaximo=muerto;
      muerto=0;
      e=new serpiente(100);
      inicio=5;
    }
  }
   e.avanzar();
   e.pintar();
   e.choque();
   c.pintar();
   if(c.comido(e))
    {
      muerto+=2;
      e.radio[0]+=1;
      c = new comida(random(r_inicial,width-r_inicial),random(r_inicial,height-r_inicial),10,0);
      inicio++;
      float angulo = atan2(e.segy[inicio-2]-e.segy[inicio-1],e.segx[inicio-2]-e.segx[inicio-1]);
      e.segx[inicio] = e.segx[inicio-1]+(e.radio[inicio]+5)*cos(angulo);
      e.segy[inicio] = e.segy[inicio-1]+(e.radio[inicio]+5)*cos(angulo);
      rasa+=0.5;
    }
}
class serpiente
{
  float[] segx,segy,radio;
  float x,y,vx,vy,angulo;
  color[] col;
  boolean vida;
  serpiente(int s)
  {
    segx=new float[s];
    segy=new float[s];
    radio=new float[s];
    col = new color[s];
    segx[0]=200;
    segy[0]=200;
    radio[0]=r_inicial;
    vx=1;
    vy=1;
    vida=true;
    for(int i=1;i<s;i++)
    {
      segx[i]=segx[i-1]-radio[0]-10;
      segy[i]=segy[i-1]-radio[0]-10;
      radio[i]=radio[i-1];
      col[i]= color(random(255),random(255),random(255));
    } 
  }
  void avanzar()
  {
    if(vida==true)
    {
      segx[0]+=vx;
      segy[0]+=vy;
      for(int i=1;i<=inicio;i++)
      {
        float dxx=segx[i]-segx[i-1];
        float dyy=segy[i]-segy[i-1];
        float ang=atan2(dyy,dxx);
        segx[i]=segx[i-1]+(radio[i]+5)*cos(ang);
        segy[i]=segy[i-1]+(radio[i]+5)*sin(ang);
        radio[i]=radio[i-1]-radio[i-1]/inicio;
      }
      pared();
    }
  }
  void pared()
  {
    for(int i=0;i<=inicio;i++)
    {
      if(segx[i]<0)
        vida=false;
      if(segx[i]>width)
         vida=false;
      if(segy[i]<0)      
        vida=false;
      if(segy[i]>height)
        vida=false;
    }
    
  }
  void pintar()
  {
    if(vida!=true)
    {
      fill(255,0,0);
      textFont(l,50);
      text("You Have Failed!!!",100,100);
      textFont(l,30);
      fill(0,255,0);
      text("Hit Enter to continue...",100,120);
      rasa=5;
    }
    for(int i=0;i<=inicio;i++)
    {
      if(vida==true)
        fill(col[i]);        
      ellipse(segx[i],segy[i],radio[i],radio[i]);
    }
  }
  void choque()
  {
    for(int i=0;i<inicio;i++)
      for(int j=i+1;j<inicio;j++)
      {
        float dx = segx[i]-segx[j];
        float dy = segy[i]-segy[j];
        float dis = sqrt(dx*dx+dy*dy);
        if(dis<radio[i]/2)
        {
          vida=false;
        }
      }
      
  }
}
class comida
{
  float x,y,r;
  color col;
  comida(float x_,float y_,float r_,color c)
  {
    x=x_;
    y=y_;
    r=r_;
    col=c;
  }
  void pintar()
  {
    fill(col);
    ellipse(x,y,r,r);
  }
  boolean comido(serpiente i)
  {
    float dx=x-i.segx[0];
    float dy=y-i.segy[0];
    float dis = sqrt(dx*dx+dy*dy);
    if(dis<=i.radio[0]+r)
      return true;
    else
      return false;
  }
}

