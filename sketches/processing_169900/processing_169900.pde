
class Particle
{
 
  float x,y,vx,vy,diam,a;
  boolean dead =false;
  
  Particle(float _x,float _y)
  {
    x=_x;
    y=_y;
    diam= random(.5,5);
 
    a=1;
    vx=mvelx*0.2+ random(-1,1);
    vy=mvely*0.2+ random(-1,1);
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
     
     
     
    fill(255,a*255); 
    noStroke();
    pushMatrix();
    translate(x,-y);
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
  
 background(194,210,252);
 
 stroke(2);
 fill(206,9,2);
 rect(200,250,100,100);
 rect(260,200,20,30);
 triangle(250,200,320,250,180,250);
 fill(62,39,4);
 rect(105,300,40,100);
 fill(0,252,27);
 triangle(130,100,85,300,165,300);
 fill(167,133,68);
 rect(220,290,30,60);
 fill(233,255,0);
 rect(260,280,30,30);
 fill(255);
 arc(250,400,400,100,PI,TWO_PI);
     stroke(1);
     fill(0,249,255,50);
     ellipse(250,250,500,480);
     
 
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
  
  stroke(2);
     fill(255,0,0);
     rect(50,400,400,100);
     noStroke();
     fill(255,235,49);
     rect(100,420,300,50);
     fill(0);
     textSize(40);
     text("Shake Mouse", 130,460);
}
  
}

void mouseDragged()
{ for(int i=0; i<5;i++)
  {parts.add(new Particle(mouseX,mouseY));
  }
}
