
//Sketch by Luke Noonan
//http://fareastcoastnoise.blogspot.com/


int[] xarray;
int[] yarray;
int[] vecarray;
int lines;

void setup()
{
  lines= 50;
  xarray = new int[lines+1];
  yarray = new int[lines+1];
  vecarray = new int[lines+1];
  background(255);
  size(500,500);
  stroke(0);
for(int i=lines; i>0; i--){
  xarray[i]=int(random(width));
  yarray[i]=int(random(height));
  vecarray[i]=int(random(1,8));
}
}

void draw()
{
for(int i=lines; i>0; i--)
{
  move(i);
}
}

void move(int index)
{
switch(vecarray[index]){
case 1://south
if(get(xarray[index],yarray[index]+1)==color(255))
{
  point(xarray[index],yarray[index]+1);
  yarray[index]+=1;
}
else
{vecarray[index] = int(random(1,8));}
break;
case 2://south east
if(get(xarray[index]+1,yarray[index]+1)==color(255))
{
  point(xarray[index]+1,yarray[index]+1);
  xarray[index]+=1;
  yarray[index]+=1;
}
else
{vecarray[index] = int(random(1,8));}

break;
case 3://east
if(get(xarray[index]+1,yarray[index])==color(255))
{
  point(xarray[index]+1,yarray[index]);
  xarray[index]+=1;
}
else
{vecarray[index] = int(random(1,8));}
break;

case 4://north east
if(get(xarray[index]+1,yarray[index]-1)==color(255))
{
  point(xarray[index]+1,yarray[index]-1);
  xarray[index]+=1;
  yarray[index]-=1;
}
else
{vecarray[index] = int(random(1,8));}

break;
case 5://north
if(get(xarray[index],yarray[index]-1)==color(255))
{
  point(xarray[index],yarray[index]-1);
  yarray[index]-=1;
}
else
{vecarray[index] = int(random(1,8));}

break;
case 6://north west
if(get(xarray[index]-1,yarray[index]-1)==color(255))
{
  point(xarray[index]-1,yarray[index]-1);
  xarray[index]-=1;
  yarray[index]-=1;
}
else
{vecarray[index] = int(random(1,8));}

break;
case 7://west
if(get(xarray[index]-1,yarray[index])==color(255))
{
  point(xarray[index]-1,yarray[index]);
  xarray[index]-=1;
}
else
{vecarray[index] = int(random(1,8));}

break;
case 8://south west
if(get(xarray[index]-1,yarray[index]+1)==color(255))
{
  point(xarray[index]-1,yarray[index]+1);
  xarray[index]-=1;
  yarray[index]+=1;
}
else
{vecarray[index] = int(random(1,8));}

break;
}
}
//http://fareastcoastnoise.blogspot.com/

