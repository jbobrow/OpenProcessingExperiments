
int o= #F62C10;
int s= #FC0898;
int c= #D908ED;
int a= #8B00F8;
int r= #0800F8;
int n= #00F888;
int i= #08F800;
int e= #F6FC16;
int t= #FC9016;
int v=#BEFA0D;
int l= #0DF7E8;
int g= #3C0C06;
int x=200;

void setup()
{
  size(600,600);
  background(0);
}
void draw()
{
  
v=v+o;
  stroke(0);
  fill(o);
  rect(550,0,50,50);
  fill(s);
  rect(550,50,50,50);
  fill(c);
  rect(550,100,50,50);
  fill(a);
  rect(550,150,50,50);
  fill(r);
  rect(550,200,50,50);
  fill(n);
  rect(550,250,50,50);
  fill(i);
  rect(550,300,50,50);
  fill(e);
  rect(550,350,50,50);
  fill(t);
  rect(550,400,50,50);
  fill(v);
  rect(550,450,50,50);
  fill(l);
  rect(550,500,50,50);
  fill(g);
  rect(550,550,50,50);
  stroke(x); 
  
  
  
  if(mousePressed){
    line(mouseX,mouseY,pmouseX,pmouseY);
    if((mouseY>0) && (mouseY<50) && (mouseX>550)){
      x=o;
    }
    if((mouseY>50) && (mouseY<100) && (mouseX>550)){
      x=s;
    }
    if((mouseY>100) && (mouseY<150) && (mouseX>550)){
      x=c;
    }
    if((mouseY>150) && (mouseY<200) && (mouseX>550)){
      x=a;
    }
    if((mouseY>200) && (mouseY<250) && (mouseX>550)){
      x=r;
    }
    if((mouseY>250) && (mouseY<300) && (mouseX>550)){
      x=n;
    }
    if((mouseY>300) && (mouseY<350) && (mouseX>550)){
      x=i;
    }
    if((mouseY>350) && (mouseY<400) && (mouseX>550)){
      x=e;
    }
    if((mouseY>400) && (mouseY<450) && (mouseX>550)){
      x=t;
    }
    if((mouseY>450) && (mouseY<500) && (mouseX>550)){
      x=v;
      
    }
    if((mouseY>500) && (mouseY<550) && (mouseX>550)){
      x=l;
    }
    if((mouseY>550) && (mouseY<600) && (mouseX>550)){
      x=g;
    }
  
  }
  
  }
