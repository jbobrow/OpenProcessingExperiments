
//Luis Valle,16-17,Repeating Shape, Pokeballs, CP1
//http://lufvalprogramming.webs.com/Programs/Pokeballz.html
size(700,640);
smooth();
strokeWeight(5);
int y=0;
while(y<256)
{
  stroke(255-y,255,y);
  line(0,6*y,6*y,0);
  y=y+1;
}
stroke(0);
int z = 100;
while(z<541)
{
int x=70;
while (x<630)
{
arc(x,z,100,100,0,PI);
fill(255,0,0);
arc(x,z,100,100,-PI,0);
line(-50+x,z,50+x,z);
fill(255,255,255);
ellipse(x,z,38,38);
x=x+110;
}
z=z+110;
}
