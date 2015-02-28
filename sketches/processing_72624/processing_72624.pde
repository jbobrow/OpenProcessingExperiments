
char nombre[]={'J','u','a','n','A','n','g','e','l','L','e','o','n'};
PFont tipo;
int x=0,posx=0,posy=0;

void setup()
{
  size(900,350);
  tipo=loadFont("CooperBlack-48.vlw");
  frameRate(15);  
}

void draw()
{
  textFont(tipo,100);
  background(0);
 
  if(x==0)
  {
    posx=(int)random(0,300);
    posy=(int)random(0,150);
    fill(0,255,50);
    text(nombre[x],posx,posy);
    if(posx==20||posy==100)
    {
      x=1;
    }
  }
  else if(x==1)
  {
    posx=(int)random(0,300);
    posy=(int)random(0,150);
    fill(0,255,50);
    text(nombre[0],20,100);
    text(nombre[x],posx,posy);
    if(posx==90||posy==100)
    {
      x=2;
    }
  }
  else if(x==2)
  {
    posx=(int)random(0,300);
    posy=(int)random(0,150);
    fill(0,255,50);
    text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[x],posx,posy);
    if(posx==160||posy==100)
    {
      x=3;
    }
  }
  else if(x==3)
  {
    posx=(int)random(0,300);
    posy=(int)random(0,150);
    fill(0,255,50);
    text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[x],posx,posy);
    if(posx==230||posy==100)
    {
      x=4;
    }
  }
  else if(x==4)
  {
    posx=(int)random(0,300);
    posy=(int)random(0,150);
    fill(0,255,50);
    text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[3],230,100);
    text(" ",410,200);      
    fill(255,255,0);
    posx=(int)random(200,600);
    posy=(int)random(100,250);
    text(nombre[x],posx,posy);
    if(posx==230||posy==200)
   
    {
      x=5;
    }
  }
  else if(x==5)
  {
    fill(0,255,50);
    text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[3],230,100);
    text(" ",410,200);      
    fill(255,255,0);
    posx=(int)random(200,600);
    posy=(int)random(100,250);
    text(nombre[4],230,200);
    text(nombre[x],posx,posy);
    if(posx==320||posy==200)
    {
      x=6;
    }
  }
  else if(x==6)
  {
    fill(0,255,50);
   text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[3],230,100);
     fill(255,255,0);
    posx=(int)random(200,600);
    posy=(int)random(100,250);
    text(nombre[4],230,200);
    text(nombre[5],320,200);
    text(nombre[x],posx,posy);
    if(posx==390||posy==200)
    {
      x=7;
    }
  }
   else if(x==7)
  {
    fill(0,255,50);
   text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[3],230,100);
     fill(255,255,0);
    posx=(int)random(200,600);
    posy=(int)random(100,250);
    text(nombre[4],230,200);
    text(nombre[5],320,200);
    text(nombre[6],390,200);
    text(nombre[x],posx,posy);
    if(posx==460||posy==200)
    {
      x=8;
    }
  }
  else if(x==8)
  {
    fill(0,255,50);
   text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[3],230,100);
     fill(255,255,0);
    posx=(int)random(200,600);
    posy=(int)random(100,250);
    text(nombre[4],230,200);
    text(nombre[5],320,200);
    text(nombre[6],390,200);
    text(nombre[7],460,200);
    text(nombre[x],posx,posy);
    if(posx==530||posy==200)
    {
      x=9;
    }
  } 
 else if(x==9)
  {
    fill(0,255,50);
   text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[3],230,100);
     fill(255,255,0);
    posx=(int)random(200,600);
    posy=(int)random(100,250);
    text(nombre[4],230,200);
    text(nombre[5],320,200);
    text(nombre[6],390,200);
    text(nombre[7],460,200);
    text(nombre[8],530,200);
    text(" ",410,200);      
    fill(255,0,0);
    posx=(int)random(480,900);
    posy=(int)random(200,350);
    text(nombre[x],posx,posy);
    if(posx==530||posy==300)
    {
      x=10;
    }
  } 
else if(x==10)
  {
    fill(0,255,50);
    text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[3],230,100);
    text(" ",410,200);      
    fill(255,255,0);
    text(nombre[4],230,200);
    text(nombre[5],320,200);
    text(nombre[6],390,200);
    text(nombre[7],460,200);
    text(nombre[8],530,200);
     fill(255,0,0);
    posx=(int)random(480,900);
    posy=(int)random(200,350);
    text(nombre[9],530,300);
    text(nombre[x],posx,posy);
    if(posx==600||posy==300) 
   {
      x=11;
    }
  }
  else if(x==11)
  {
    fill(0,255,50);
    text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[3],230,100);
    text(" ",410,200);  
    fill(255,255,0);
    text(nombre[4],230,200);
    text(nombre[5],320,200);
    text(nombre[6],390,200);
    text(nombre[7],460,200);
    text(nombre[8],530,200);    
    fill(255,0,0);
    posx=(int)random(480,900);
    posy=(int)random(200,350);
    text(nombre[9],530,300);
    text(nombre[10],600,300);
    text(nombre[x],posx,posy);
    if(posx==670||posy==300)
  
  {
      x=12;
    }
  }
 else if(x==12)
  {
    fill(0,255,50);
    text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[3],230,100);
    text(" ",410,200);  
    fill(255,255,0);
    text(nombre[4],230,200);
    text(nombre[5],320,200);
    text(nombre[6],390,200);
    text(nombre[7],460,200);
    text(nombre[8],530,200);    
    fill(255,0,0);
    posx=(int)random(480,900);
    posy=(int)random(200,350);
    text(nombre[9],530,300);
    text(nombre[10],600,300);
    text(nombre[11],670,300);
    text(nombre[x],posx,posy);
    if(posx==740||posy==300)
    
      {
      x=13;
    }
  }
  else if(x==13)
  {
    fill(0,255,50);
    text(nombre[0],20,100);
    text(nombre[1],90,100);
    text(nombre[2],160,100);
    text(nombre[3],230,100);
    text(" ",410,200);  
    fill(255,255,0);
    text(nombre[4],230,200);
    text(nombre[5],320,200);
    text(nombre[6],390,200);
    text(nombre[7],460,200);
    text(nombre[8],530,200);    
    fill(255,0,0);
    posx=(int)random(480,900);
    posy=(int)random(200,350);
    text(nombre[9],530,300);
    text(nombre[10],600,300);
    text(nombre[11],670,300);
    text(nombre[12],740,300);
  }
    
}

