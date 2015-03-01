
float a=250;
float b=13;
float c=44;
 
float d;
float e;
float f=5;
float i=5;

float j=59;
float k=191;
float l=31;

float m;
float n;
float z=5;
float o=5;

float a1;
float a2;
float a3;

float s;
float t;
float u;
float v;

float ab;
float ad;
float ac;

float w;
float x;
float y;
float g;

void setup()
{
  
size( 600,600);


stroke(#050505);
 strokeWeight(2);

 line(width/2,0,height/2,width); 
  line(0,width/2,height,width/2);

}

void draw()
{ 
 
  a=random(250);
b=random(13);
c=random(44);
fill(a,b,c);

m=random(width/2,width);
n=random(0,height/2);
z=random (0,35);
o=random (0,35); 
rect( m,n,z,o);
  
j=random (59);
k=random (191);
l=random (31);
 fill(j,k,l);
 
 d=random (0,40);
 e=random (0,40);
 f=random (0,width/2);
 i=random (0,height/2);
ellipse(f,i,d,e);

a1= random (254);
a2= random (255);
a3= random (0);
fill(a1,a2,a3);

s= random(width/2,width);
t= random (height/2,height);
u= random (0,45);
v=random(0,45);

ellipse(s,t,u,v);

ad=random(3);
  ab=random(40);
  ac=random(111);
  fill(ad,ab,ac);

w=random(0,width/2);
x= random(height/2,height);
y=random(0,45);
g=random(0,45);
rect(w,x,y,g);
  
  }
  
  void mousePressed()
 
  {
     
 rect(0,0,width/2,height/2);
 
    
   rect(width/2,height/2,width,height);
    
    
  }
    
    
