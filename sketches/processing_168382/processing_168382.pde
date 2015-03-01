
int x=0;
int y=0;

int a=(#383838);
int s=(#FFFE00);
int c=0;

float e;
float r;
float t;
float u;

float g;
float h;
float j;
float p;
float q;
void setup()
{
size(800,800);
background(#ffffff); 
stroke(5);
line(0,width/2,height,width/2);
line(height/2,0,height/2,width);

}

void draw()
{
  
  e=random(width/2,width);
  r=random(height/2,height);
  t=random(0,width/2);
  u=random(0,height/2);
  g=random(255);
  h=random(255);
  j=random(255);
  p=random(10,50);
  q=random(10,50);




fill(0,j,h);
ellipse(e,r,p,q);
//4

fill(g,h,0);
ellipse(t,u,q,p);


//2
//fill(#FFC000);
//rect(400,0,400,400); 
fill(h,0,j);
rect(e,t,p,q);



//3

fill(h,0,j);
rect(t,r,q,p);
}





void mousePressed()
{
  fill(#ffffff);
  rect(0,0,width/2,height/2);
  rect(width/2,height/2,width,height);
  
}

