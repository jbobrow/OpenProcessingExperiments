
int tam=20,r_inicial=30;
serpiente[] e=new serpiente[tam];
void setup()
{
  size(900,450);
  for(int i=0;i<tam;i++)
    e[i]=new serpiente(15);
  background(0);
}
void draw()
{
  if(mousePressed)
  background(0);
  for(int i=0;i<tam;i++)
  {
    e[i].avanzar();
    e[i].pintar();
  }  
}
class serpiente
{
  float[] segx,segy,radio;
  float x,y,vx,vy,angulo;
  color col;
  serpiente(int s)
  {
    segx=new float[s];
    segy=new float[s];
    radio=new float[s];
    segx[0]=random(width);
    segy[0]=random(height);
    radio[0]=r_inicial;
    vx=0;
    vy=0;
    col= color(random(255),random(255),random(255));
    for(int i=1;i<s;i++)
    {
      segx[i]=segx[i-1]-5;
      segy[i]=segy[i-1]-5;
      radio[i]=radio[i-1]-radio[i-1]/s;
    } 
  }
  void avanzar()
  {
    float dx=mouseX-segx[0];
    float dy=mouseY-segy[0];
    float dis=sqrt(dx*dx+dy*dy);
    angulo=atan2(dy,dx);
    dx*=0.02;
    dy*=0.02;
    if(dis>5)
    {
    vx+=dx;
    vy+=dy;
    }
    segx[0]+=vx+random(-tam,tam);
    segy[0]+=vy+random(-tam,tam);
    vx*=0.95;
    vy*=0.95;
    for(int i=1;i<segx.length;i++)
    {
      float dxx=segx[i]-segx[i-1];
      float dyy=segy[i]-segy[i-1];
      float ang=atan2(dyy,dxx);
      segx[i]=segx[i-1]+20*cos(ang);
      segy[i]=segy[i-1]+20*sin(ang);
    }
  }
  void pintar()
  {
    fill(col,100);
    for(int i=0;i<segx.length;i++)
      ellipse(segx[i],segy[i],radio[i],radio[i]);
  }
}

                
                
