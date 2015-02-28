
// Cellul?rer Automat Nr. 1
// by MB 


// Created 25.11.05
// Updated 24.10.08

int mx=500,my=500;

float [][][] arena =new float [mx+1][my+1][2];
int x,y,z,gen=0;
float t;
int switcher=1;
void setup()
{
  size(mx,mx);
  //arena=new int [201][201][2]; 
  println("init");
  for (x=0;x<mx;x++)
    for (y=0;y<my;y++)
      arena[x][y][0]= random(50000);
}

void draw() 
{ 
  float add;
  gen=gen+1;
  switcher=1-switcher;
  for (x=1;x<=mx-1;x++)
    for (y=1;y<=my-1;y++){
      add=arena[x-1][y-1][switcher];
      add=add+arena[x][y-1][switcher];
      add=add+arena[x+1][y-1][switcher];
      add=add+arena[x-1][y][switcher];
      add=add+arena[x][y][switcher];
      add=add+arena[x+1][y][switcher];
      add=add+arena[x-1][y+1][switcher];
      add=add+arena[x][y+1][switcher];
      add=add+arena[x+1][y+1][switcher];
      arena[x][y][1-switcher]=add/9;
      if (mousePressed == true) { 
        arena[mouseX][mouseY][1-switcher]=500000;
      }
      t=arena[x][y][1-switcher];
      stroke(t%256,t%257,t%258); /*War so nett mit den Farben*/

      point(x,y);
    }
  println(gen);

  for (x=0;x<=mx;x++){
    arena[x][my][1-switcher]=arena[x][1][switcher];
    arena[x][0][1-switcher]=arena[x][my-1][switcher];
  }
  for (y=0;y<=my;y++){
    arena[mx][y][1-switcher]=arena[1][y][switcher];
    arena[0][y][1-switcher]=arena[mx-1][y][switcher];
  }
}


