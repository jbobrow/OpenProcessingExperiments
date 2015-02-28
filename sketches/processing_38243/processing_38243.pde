
//Homework6
//Copyright by Andrew Viny Pittsburgh PA 15289
float x,y;
 
void setup() {
  size(400,400);
  smooth();
  background(255);
  noStroke();
  fill(255,0,0);
  x=0;
  y=0;
}
 
void draw()
{
  float z=0;
  while(z < 5)
  {
    float s=0, a=200, b=0;
    if(z==0)
    {
      b=20;
      s=20;
    }
    else if(z==1)
    {
      b=100;
      s=50;
    }
    else if(z==2)
    {
      b=200;
      s=80;
    }
    else if(z==3)
    {
      b=300;
      s=50;
    }
    else if(z==4)
    {
      b=380;
      s=20;
    }
    
    initials(a,b,a,b,a,b,s,s);
    z++;
  }
}
 
void initials(float ax,float ay,float bx,float by,float vx,float vy,float wd,float ht)
{
     
    //b
    fill(255);
    ellipse(bx,by,wd,ht);
     
    //A
    stroke(184,134,11);
    strokeWeight(2);
    beginShape();
    curveVertex(ax-2*wd,ay+.3*ht);
    curveVertex(ax-2*wd,ay+.3*ht);//1
    curveVertex(ax-1.85*wd,ay-.3*ht);//2
    curveVertex(ax-1.7*wd,ay+.3*ht);//3
    curveVertex(ax-1.775*wd,ay+.05*ht);//4
    curveVertex(ax-2.01*wd,ay-.06*ht);//5
    curveVertex(ax-2.01*wd,ay-.06*ht);
    endShape();
     
    //B
    stroke(25,25,112);
    strokeWeight(2);
    beginShape();
    curveVertex(bx-.18*wd,by+.28*ht);
    curveVertex(bx-.18*wd,by+.28*ht);//1
    curveVertex(bx-.16*wd,by-.28*ht);
    curveVertex(bx-.16*wd,by-.28*ht);//2
    curveVertex(bx+.12*wd,by-.28*ht);//3
    //curveVertex(bx+.2*wd,by-.2*ht);//4
    //curveVertex(bx+.2*wd,by-.1*ht);//5
    curveVertex(bx+.12*wd,by-.02*ht);//6
    curveVertex(bx+.0*wd,by-.01*ht);//7
    curveVertex(bx+.20*wd,by-.01*ht);//8
    curveVertex(bx+.2*wd,by+.28*ht);//9
    curveVertex(bx+.0*wd,by+.35*ht);//10
    curveVertex(bx-.18*wd,by+.28*ht);//11
    curveVertex(bx-.18*wd,by+.28*ht);
    endShape();
     
    //V
    stroke(184,134,11);
    strokeWeight(2);
    beginShape();
    curveVertex(vx+2*wd,vy-.3*ht);
    curveVertex(vx+2*wd,vy-.3*ht);//1
    curveVertex(vx+1.85*wd,vy+.3*ht);//2
    curveVertex(vx+1.7*wd,vy-.3*ht);//3
    curveVertex(vx+1.7*wd,vy-.3*ht);
    endShape();

 
}
