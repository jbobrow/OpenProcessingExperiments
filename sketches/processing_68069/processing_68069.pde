
int a=0;
int b=0;
int cont=0;
void setup()
{
  size(800,600);
  frameRate(4);
}
void draw()
{
  background(0,0,0);
  fill(255);
  arc(295+cont,88,30,30,0,TWO_PI);//punta del gorro
  fill(255,0,0);
  triangle(300+cont,100,325+cont,300,415+cont,240);//gorro
  cont+=10;
  if(a==0)//parpadeo del pacman
  {
  fill(0,0,0);//exterior
  arc(400+cont,300,150,150,0,TWO_PI);
  fill(255,255,0);
  arc(400+cont,300,150,150,0.47,5.65);
  fill(255,255,0);
  arc(455+cont,300,30,30,0,TWO_PI);
  cont+=10;
  a=1;
  }
  else
  {
  fill(255,255,0);//exterior
  arc(400+cont,300,150,150,0.47,5.65);
  arc(400+cont,300,150,150,0,TWO_PI);
  cont+=10;
  a=0;
  }
  if(b==0)
  {
      fill(0,0,0);//interior
      arc(380+cont,260,30,30,0.47,5.65);
      fill(255,255,0);
     cont+=10; 
      b=1;
  }
  else
  {
    fill(0,0,0);//interior  
    arc(380+cont,260,30,30,0,TWO_PI); 
    cont+=10;
    b=0;
  }
  if(cont > width)//reinicio
  {
    cont=-300;
  }
  fill(255,255,0);//bolita siguiente
  arc(500+cont,300,30,30,0,TWO_PI);
  arc(570+cont,300,30,30,0,TWO_PI);
  arc(640+cont,300,30,30,0,TWO_PI);
  arc(710+cont,300,30,30,0,TWO_PI);
  arc(780+cont,300,30,30,0,TWO_PI);
  arc(850+cont,300,30,30,0,TWO_PI);
  arc(910+cont,300,30,30,0,TWO_PI);
  arc(980+cont,300,30,30,0,TWO_PI);
  cont+=10;
}

