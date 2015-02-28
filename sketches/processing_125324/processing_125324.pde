
int _0point = 8; /* pontos fixos */
int _1point = 110; /* pontos com apoio variável */
int _2point = 110; /* pontos com apoio duplo */

Boolean show0p = false; /* mostrar os pontos fixos */
Boolean show1p = true; /* mostrar os pontos com apoio variável */
Boolean show2p = true; /* mostrar os pontos com apoio duplo */

/* a aleatoriedade da velocidade */
float p0rndSpd0 = 0;
float p0rndSpd1 = 2;

float p1rndSpd0 = 1;
float p1rndSpd1 = 10;

float p2rndSpd0 = 1;
float p2rndSpd1 = 3;

/* a aleatoriedade da distancia entre o ponto central */
float p0rndDis0= 150;
float p0rndDis1 = 200;

float p1rndDis0 = 1;
float p1rndDis1 = 10;

float p2rndDis0 = 3;
float p2rndDis1 = 15;

float p0Spacing =0;/* quanto mais próximo de 0.5, mais próximos os p0 */
float delay = 20; /* o delay para os pontos seguirem */
Boolean scroll = false; /* se é para a tela ir para o lado */
Boolean fade = true; /* se é para a tela escurecer o que ja passou */
int fadeSpeed = 15; /* velocidade de fade */
float stkWeight = 1; /* stroke Weight */
float opacity = 250;
Boolean rndSizes = false; /* se as esferas podem ter tamanhos aleatórios */

int sizeX = 640; /* largura da tela */
int sizeY = 480; /* altura da tela */

float spacingX = 1.8; /* os pontos podem ser elipsados em x */
float spacingY = 1; /* os pontos podem ser elipsados em y */


class RPoint
{
 private float x;
 private float y;
 private float dist;
 private RPoint center;
 private RPoint center1;
 private Boolean has2Centers=false;
 private Boolean hasCenter=false;
 private float angSpeed=0;
 private float angle=random(0,360);
 private Boolean toBeDrawn=true;
 private Boolean positiveSpeed=true;
 private float position[] = new float[2];
 private float oldPosition[] = new float[2];
 private int strokeW = (int)random(1,6);
 private Boolean firstTime = true;
 private Boolean mouse = false;
 private float xFactor =spacingX;
 private float yFactor =spacingY;
 
 protected float getX()
 {
   return position[0];
 }
 protected float getY()
 {
   return position[1]; 
 }
 

 

 
  public RPoint(RPoint c, RPoint c1, float _x, float _y, float d,  float a, Boolean t, Boolean ps, Boolean isDouble, Boolean isXY)
 {
   if(isXY)
   {
        x = _x;
        y = _y;
        has2Centers = false;
        hasCenter = false;
   }else if(isDouble)
   {
        center = c;
        center1 = c1;
        has2Centers = true;
        hasCenter = false;
   }else
   {
       center = c;
       has2Centers = false;
       hasCenter = true;
   }
  center = c;
  dist = d;
  angSpeed = a;
  toBeDrawn = t;
  positiveSpeed = ps;
 }
 
 public RPoint()
 {
   
 }
 
 public void speedUp(float value)
 {
   angSpeed*=value;
   if(angSpeed < 0)
    angSpeed = 0;
 }
 public void distUp(float value)
 {
   dist*=value;
   if(dist<0)
     dist = 0;
 }
 
 public void stepPoint()
 {

   if(random(0,100)<0.1)
   {
     positiveSpeed = !positiveSpeed;
   }
   
   if(hasCenter) /* se é p1*/
   {
     x = center.getX();
     y = center.getY();
   } 
   else
   if(has2Centers) /* se é p2 */
   {
     x = ((center.getX()+center1.getX())/2);
     y = ((center.getY()+center1.getY())/2); 
   }
   else
   if(mouse) /* se é controlado pelo mouse */
   {
     x = (x*50+mouseX)/51;
     y = (y*50+mouseY)/51;
   }
   
   
    oldPosition[0] = position[0];
    oldPosition[1] = position[1];
  
    position[0] = (delay*position[0] + (x+dist*sin(radians(angle))*xFactor) )/(delay+1);
    position[1] = (delay*position[1] + (y+dist*cos(radians(angle))*yFactor) )/(delay+1);
    
  
  
  /* rotating right or left */
  if(positiveSpeed)
    angle+=angSpeed;
  else
    angle-=angSpeed;
  /* preventing start-bug */
  if(firstTime)
  {
   if(toBeDrawn) point(position[0],position[1]);
    firstTime = false;
  }
  else
    /* if it is to be drawn */
    if(toBeDrawn) 
    {
      if(rndSizes)strokeWeight(strokeW);
      line(oldPosition[0],oldPosition[1],position[0],position[1]);
    }
 }
 
 
}


RPoint points[] = new RPoint[_0point+ _1point+ _2point];
int time = 0;
int cTime =0;
PImage screen;
void setup()
{
    time = second() + 60*minute();
    
    background(0);
    size(sizeX,sizeY);
    strokeWeight(1);
    stroke(255); 
    colorMode(HSB);
    int i=0;
    int i2=0;
    
    for(i=i2 ; i < i2 + _0point ; i++)
    {
      if(random(0,100)>50)
        points[i] = new RPoint(new RPoint(),new RPoint(),random(sizeX*(2+p0Spacing)/5,sizeX*(3-p0Spacing)/5),random(sizeY*(2+p0Spacing)/5,sizeY*(3-p0Spacing)/5),random(p0rndDis0,p0rndDis1),random(p0rndSpd0,p0rndSpd1),show0p,true,false,true);
      else
        points[i] = new RPoint(new RPoint(),new RPoint(),random(sizeX*(2+p0Spacing)/5,sizeX*(3-p0Spacing)/5),random(sizeY*(2+p0Spacing)/5,sizeY*(3-p0Spacing)/5),random(p0rndDis0,p0rndDis1),random(p0rndSpd0,p0rndSpd1),show0p,false,false,true);
    }
    
    i2 = i;
    for(i=i2 ; i < i2 + _1point ; i++)
    {
     if(random(0,100)>50)
       points[i] = new RPoint(points[(int)random(0,i)],new RPoint(),0,0,random(p1rndDis0,p1rndDis1),random(p1rndSpd0,p1rndSpd1),show1p,true,false,false); 
     else
       points[i] = new RPoint(points[(int)random(0,i)],new RPoint(),0,0,random(p1rndDis0,p1rndDis1),random(p1rndSpd0,p1rndSpd1),show1p,false,false,false); 
    }
    
    i2 = i;
    for(i= i2 ; i < i2 + _2point ; i++)
    {         
      if(random(0,100)>50)
       points[i] = new RPoint(points[(int)random(0,i)],points[(int)random(0,i)],0,0,random(p2rndDis0,p2rndDis1),random(p2rndSpd0,p2rndSpd1),show2p,true,true,false); 
     else
       points[i] = new RPoint(points[(int)random(0,i)],points[(int)random(0,i)],0,0,random(p2rndDis0,p2rndDis1),random(p2rndSpd0,p2rndSpd1),show2p,false,true,false);
    }
    
    
  fill(0,fadeSpeed);
}


 void mousePressed()
 {
      //setup();
          for(int i=0 ; i< _0point + _1point + _2point ; i++)
      {
      
      points[i].speedUp(3); 
      }
      
 }
 
 void mouseReleased()
 {
         for(int i=0 ; i< _0point + _1point + _2point ; i++)
    {
      
      points[i].speedUp(-3); 
    }
   
 }

Boolean doing=true;
void draw()
{

  if(doing)
  {
    
    /* pintando primeiro tipo */
    strokeWeight(9);
    for(int i=0; i < _0point ; i++)
    {
     if(show0p)
     {
       stroke(45,random(180,255),random(180,255),min(min(points[i].getX(),points[i].getY()),min(width-points[i].getX(),height-points[i].getY())));
     }
     points[i].stepPoint();
    }
    
    /* pintando segundo tipo */
    if(!rndSizes) strokeWeight(stkWeight);
    for(int i= _0point ; i < _0point + _1point ; i++)
    {
     if(show1p)
     {
       stroke((random(30,50)+random(20,30)*cos(radians(points[i].getX()))+(random(30,50)+random(20,30)*sin(radians(points[i].getY()))))/2,
       255,200,(opacity/((width+height)/2))*min(min(points[i].getX(),points[i].getY()),min(width-points[i].getX(),height-points[i].getY())));
     } 
     points[i].stepPoint(); 
    }
    
    /* pintando terceiro tipo */
    for(int i= _0point + _1point; i < _0point + _1point + _2point ; i++)
    {
      if(show2p) {
       stroke((random(120,160)+random(45,65)*cos(radians(points[i].getX()))+(random(120,160)+random(45,65)*sin(radians(points[i].getY()))))/2,
       255,200,(opacity/((width+height)/2))*min(min(points[i].getX(),points[i].getY()),min(width-points[i].getX(),height-points[i].getY()))); 
      }
     points[i].stepPoint(); 
    }
    
    
    /* scroll e fade */
    if(fade)
    {
      noStroke();
      quad(0,0,width,0,width,height,0,height);
    }
    if(scroll)
    {
        screen = get(0,-1,sizeX,sizeY);
        set(-1,-1,screen);
    }
    
    }
}


