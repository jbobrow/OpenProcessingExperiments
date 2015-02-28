
char nombre[]={'C','A','R','L','O','S','R','A','M','I','R','E','Z'};
PFont tipo;
int x=0,posx=0,posy=0;

void setup()
{
  size(950,300);
  tipo=loadFont("ArialMT-48.vlw");
  frameRate(15);  
}

void draw()
{
  textFont(tipo,100);
  background(0);
  posx=(int)random(0,1000);
  posy=(int)random(0,300);
  if(x==0)
  {
    fill(random(50,255),0,0);
    text(nombre[x],posx,posy);
    if(posx==50||posy==200)
    {
      x=1;
    }
  }
  else if(x==1)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[x],posx,posy);
    if(posx==20||posy==200)
    {
      x=2;
    }
  }
  else if(x==2)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[x],posx,posy);
    if(posx==85||posy==200)
    {
      x=3;
    }
  }
  else if(x==3)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[x],posx,posy);
    if(posx==150||posy==200)
    {
      x=4;
    }
  }
  else if(x==4)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],220,200);
    text(nombre[x],posx,posy);
    if(posx==215||posy==200)
    {
      x=5;
    }
  }
  else if(x==5)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],220,200);
    text(nombre[4],270,200);
    text(nombre[x],posx,posy);
    if(posx==280||posy==200)
    {
      x=6;
    }
  }
  else if(x==6)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],220,200);
    text(nombre[4],270,200);
    text(nombre[5],345,200);
    text(" ",410,200);      
    fill(0,0,random(50,255));
    text(nombre[x],posx,posy);
    if(posx==345||posy==200)
    {
      x=7;
    }
  }
  else if(x==7)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],220,200);
    text(nombre[4],270,200);
    text(nombre[5],345,200);
    text(" ",410,200);      
    fill(0,0,random(50,255));
    text(nombre[6],475,200);
    text(nombre[x],posx,posy);
    if(posx==475||posy==200)
    {
      x=8;
    }
  }
  else if(x==8)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],220,200);
    text(nombre[4],270,200);
    text(nombre[5],345,200);
    text(" ",410,200);      
    fill(0,0,random(50,255));
    text(nombre[6],475,200);
    text(nombre[7],540,200);
    text(nombre[x],posx,posy);
    if(posx==50||posy==200)
    {
      x=9;
    }
  }
  else if(x==9)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],220,200);
    text(nombre[4],270,200);
    text(nombre[5],345,200);
    text(" ",410,200);      
    fill(0,0,random(50,255));
    text(nombre[6],475,200);
    text(nombre[7],540,200);
    text(nombre[8],605,200);
    text(nombre[x],posx,posy);
    if(posx==605||posy==200)
    {
      x=10;
    }
  }
  else if(x==10)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],220,200);
    text(nombre[4],270,200);
    text(nombre[5],345,200);
    text(" ",410,200);      
    fill(0,0,random(50,255));
    text(nombre[6],475,200);
    text(nombre[7],540,200);
    text(nombre[8],605,200);
    text(nombre[9],700,200);
    text(nombre[x],posx,posy);
    if(posx==670||posy==200)
    {
      x=11;
    }
  }
  else if(x==11)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],220,200);
    text(nombre[4],270,200);
    text(nombre[5],345,200);
    text(" ",410,200);      
    fill(0,0,random(50,255));
    text(nombre[6],475,200);
    text(nombre[7],540,200);
    text(nombre[8],605,200);
    text(nombre[9],700,200);
    text(nombre[10],735,200);
    text(nombre[x],posx,posy);
    if(posx==735||posy==200)
    {
      x=12;
    }
  }
  else if(x==12)
  {
    fill(random(50,255),0,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],220,200);
    text(nombre[4],270,200);
    text(nombre[5],345,200);
    text(" ",410,200);      
    fill(0,0,random(50,255));
    text(nombre[6],475,200);
    text(nombre[7],540,200);
    text(nombre[8],605,200);
    text(nombre[9],700,200);
    text(nombre[10],735,200);
    text(nombre[11],800,200);
    text(nombre[x],posx,posy);
    if(posx==800||posy==200)
    {
      x=13;
    }
  }
  else if(x==13)
  {
      fill(random(150,255),0,0);
      text(nombre[0],20,200);
      text(nombre[1],85,200);
      text(nombre[2],150,200);
      text(nombre[3],220,200);
      text(nombre[4],270,200);
      text(nombre[5],345,200);
      text(" ",410,200);      
      fill(0,0,random(150,255));
      text(nombre[6],475,200);
      text(nombre[7],540,200);
      text(nombre[8],605,200);
      text(nombre[9],700,200);
      text(nombre[10],735,200);
      text(nombre[11],800,200);
      text(nombre[12],865,200);
  }
  
}

