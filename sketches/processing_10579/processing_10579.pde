
boolean flag=false;
float x,y,a=40;
float aux=0;
float con;
void setup()
{
size(500,300);
//colorMode(HSB);
//background(250,200,300);
x=-25;
}

void draw()
{
smooth();
background(84,222,245);//cielo
y=(200+50*sin(0.1*x));
fill(108,255,153);
rect(0,225,500,500-225);
fill(244,82,247);
if(y<=200) //bolita que salta 
  {
  ellipse(x,y,50,50);
  }
else
  {
  ellipse(x,400-y,50,50);
  }

aux=(aux+1)%550;//contador extraño p bolita
x=aux-25;
fill(255,249,49);//amarillo sol
noStroke();
ellipse(400,60,a,a);//definimos sol
/*fill(84,222,245);//Cielo con transparencia
rect(375,35,50,50);*/

if(!flag)//movimiento del sol
  {
  a=a+0.1;
  if(a>=50)
    {
    flag=true;
    }
  }
if(flag)
  {
  a=a-0.1;
  if(a==40)  
    {
      flag=false;
    }
  }

fill(255,255,255);//blanco nubes
ellipse(con-25,40,50,50);
ellipse(con-45,30,50,50);
ellipse(con-55,45,50,50);
ellipse(con-75,40,50,50);
ellipse(con-100,50,50,50);
ellipse(con-115,40,50,50);
con=(con+0.5)%700;

}

