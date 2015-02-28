
boolean[][] on;
boolean start=false;
boolean juh=false;
pixel pix[][];
int k=0;
void setup()
{on=new boolean[100][100];
  pix=new pixel[100][100];
size(1000,1000);
int i=5;
int j=5;

for(int x=0; x<100;x++)
{j=5;
for(int y=0;y<100;y++)
{
pix[x][y]=new pixel(i,j,x,y);
on[x][y]=false;
j=j+10;
}
i=i+10;
}
rectMode(CENTER);
smooth();
on[50][49]=true;
on[50][51]=true;
on[49][49]=true;
on[49][51]=true;
on[48][50]=true;
on[51][50]=true;
on[52][50]=true;
on[53][50]=true;
on[53][49]=true;
}
void draw()
{
if(juh==true)
{stroke(255);}
else{
stroke(0);
}
for(int x=0; x<100;x++)
{
for(int y=0;y<100;y++)
{
pix[x][y].display();

}

}
for(int x=0; x<100;x++)
{
for(int y=0;y<100;y++)
{
pix[x][y].display();

}

}
}
void keyReleased()
{
if(key=='s'&&start==false)
{
start=true;
}
else if(key=='s'&&start==true)
{
start=false;
}
else if(key=='d')
{
if(juh==false){
for(int x=0; x<100;x++)
{
for(int y=0;y<100;y++)
{

on[x][y]=false;

}

}}
else{
for(int x=0; x<100;x++)
{
for(int y=0;y<100;y++)
{

on[x][y]=true;

}

}
}
start=false;
}
else if(key=='c')
{if(juh==false){
for(int x=0; x<100;x++)
{
for(int y=0;y<100;y++)
{

on[x][y]=true;

}

}}
else{
for(int x=0; x<100;x++)
{
for(int y=0;y<100;y++)
{

on[x][y]=false;

}

}
}
if(juh==true)
{
juh=false;
}
else{
juh=true;
}
start=false;
}
}


