
PFont fuente;
float x,y;
int ban[]={0,0,0,0,0,0};
char nombre[]={'D','A','N','I','E','L'};
String[] fontList =PFont.list();
void setup()
{
  size(400,400);
  frameRate(3);
}

void draw()
{
  background(0,120,249);
  fuente= createFont(fontList[200],10);
  textFont(fuente);
  fill(0);
  textLeading(0);
  text("Para liberar o colocar una letra presione su tecla respectiva",24,10);
  text("O espere a que las letras encuentren su posición",24,20);
  fuente= createFont(fontList[(int)random(1,260)],30);
  textFont(fuente);
  if(ban[0]==0)
  {
    x=random(0,400);
    y=random(0,400);
    fill(random(0,255));
    textLeading(random(0,255));
    text(nombre[0],x,y);
    if((x>=95&&x<=105)&&(y>=195&&y<=205))
      ban[0]=1;
  }
  else
  {
    text(nombre[0],100,200);
  }
  
  if(ban[1]==0)
  {
    x=random(0,400);
    y=random(0,400);
    fill(random(0,255));
    textLeading(random(0,255));
    text(nombre[1],x,y);
    if((x>=120&&x<=130)&&(y>=195&&y<=205))
      ban[1]=1;
  }
  else
  {
    text(nombre[1],125,200);
  }
  
  if(ban[2]==0)
  {
    x=random(0,400);
    y=random(0,400);
    fill(random(0,255));
    textLeading(random(0,255));
    text(nombre[2],x,y);
    if((x>=145&&x<=155)&&(y>=195&&y<=205))
      ban[2]=1;
  }
  else
  {
    text(nombre[2],150,200);
  }
  
  if(ban[3]==0)
  {
    x=random(0,400);
    y=random(0,400);
    fill(random(0,255));
    textLeading(random(0,255));
    text(nombre[3],x,y);
    if((x>=170&&x<=185)&&(y>=195&&y<=205))
      ban[3]=1;
  }
  else
  {
    text(nombre[3],175,200);
  }
  
  if(ban[4]==0)
  {
    x=random(0,400);
    y=random(0,400);
    fill(random(0,255));
    textLeading(random(0,255));  
    text(nombre[4],x,y);
    if((x>=185&&x<=195)&&(y>=195&&y<=205))
      ban[4]=1;
  }
  else
  {
    text(nombre[4],190,200);
  }
  
  if(ban[5]==0)
  {
    x=random(0,400);
    y=random(0,400);
    fill(random(0,255));
    textLeading(random(0,255));  
    text(nombre[5],x,y);
    if((x>=210&&x<=220)&&(y>=195&&y<=205))
      ban[5]=1;
  }
  else
  {
    text(nombre[5],215,200);
  }  
}

void keyPressed()
{
  switch(key)
  { 
  case 'd':
  case 'D':
    if(ban[0]==1)
      ban[0]=0;
    else
      ban[0]=1;
  break;
  case 'a':
  case 'A':
      if(ban[1]==1)
        ban[1]=0;
      else
        ban[1]=1;
  break;
  case 'n':
  case 'N':
    if(ban[2]==1)
       ban[2]=0;
    else
      ban[2]=1;
  break;
  case 'i':
  case 'I':
    if(ban[3]==1)
      ban[3]=0;
    else
      ban[3]=1;
  break;
  case 'e':
  case 'E':
    if(ban[4]==1)
      ban[4]=0;
    else
      ban[4]=1;
  break; 
  case 'l':
  case 'L':
     if(ban[5]==1)
      ban[5]=0;
    else
      ban[5]=1;
  break;
  }
}


