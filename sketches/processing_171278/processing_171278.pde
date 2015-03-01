
class Particle
{
  
  float x,y,vx,vy,diam,a;
  boolean dead =false;
  
  Particle(float _x,float _y)
  {
    x=_x;
    y=_y;
    diam= random(5,100);
  
    a=1;
    vx=mvelx*0.5+ random(-1,1);
    vy=mvely*0.5+ random(-1,1);
  }
  
  void update()
  {
    vx+=noise(x*.01,y*.01,frameCount*.02)-.5;
    vy+=noise(y*0.01, x*0.01, frameCount*0.02+7375)-.5;
    diam++;
    x+=vx;
    y+=vy;  
    
    a*=0.98;
    if(a<0.05)
    {dead=true;
    }
   }
   void display()
   {
     
    fill(26,201,14,a*255);
    
    pushMatrix();
    translate(x,y);
    
   // rect(0,0,diam,diam);
    ellipse(0,0,diam,diam);
    popMatrix();
    
     }
}

ArrayList parts;

float mvelx, mvely;
void setup()
{
  size(500,500);
  
  parts=new ArrayList();
  
}

void draw()
{
 background(114,185,168);
 noStroke();
 fill(237,255,0);
 ellipse(250,150,180,100);
 fill(202,209,133);
 rect(0,150,500,400);
 fill(50,52,34,100);
 ellipse(250,350,400,300);
 fill(50,52,34,150);
 ellipse(250,350,350,220);
 fill(50,52,34,50);
 ellipse(250,350,150,100);
 stroke(2);
 fill(224,224,222);
 rect(160,180,180,270,6);
 stroke(1);
 ellipse(250,210,180,10);
 ellipse(250,430,180,10);
 stroke(1.5);
 fill(220,255,0);
 rect(160,250,180,120);
 noStroke();
 fill(0);
 ellipse(250,310,30,30);
 arc(250,310,120,120,0+QUARTER_PI,HALF_PI+QUARTER_PI);
 arc(240,300,100,100,PI,HALF_PI+PI);
 arc(260,300,100,100,HALF_PI+PI, TWO_PI);
 stroke(1);
 fill(129,82,12);
 rect(450,100,10,130);
 fill(255,153,0);
 triangle(455,50,480,100,430,100);
 fill(0);
 rect(452,60,5,30);
 ellipse(455,95,5,5);
 noStroke();
 fill(195,160);
 ellipse(100,20,300,50);
 ellipse(220,40,300,60);
 
 
 //quad(100,350,300,180,380,280,180,480);
noStroke();
float tempx=noise(frameCount*0.03)*width;
float tempy=noise(frameCount*0.03+258245)*height;
mvelx= mouseX-pmouseX;
mvely= mouseY-pmouseY;


parts.add(new Particle(tempx,tempy));


for(int i=0; i< parts.size();i++)
{
  Particle p= (Particle) parts.get(i);
  if (p.dead==true)
  {
    parts.remove(i);
  }
  p.update();
  p.display();
}
  
}

void mouseDragged()
{ for(int i=0; i<10;i++)
  {parts.add(new Particle(mouseX,mouseY));
  }
}
