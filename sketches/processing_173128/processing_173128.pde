
int db=10;
int[] atmerok= new int[db];

void setup(){
  size(900,600);
  for(int i=0;i<db;i++)
  {//1100
    atmerok[i]=1100*i/db;
  }
}

void draw(){
background(#AAAAAA);
noFill();
for(int i=0;i<db;i++)
{
  ellipse(450,300,atmerok[i],atmerok[i]);
}
for(int i=0;i<db;i++)
{
  atmerok[i]++;
  if(atmerok[i]>1100)
  {
    atmerok[i]=0;
  } 
}
}


