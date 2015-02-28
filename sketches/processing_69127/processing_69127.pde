
//Brian Chu, Loops: Repeating Shapes, CP1 Mods 16/17
//http://brianswebsite12.webs.com/Loops.html

size(500, 500);
background(0);

//triangles
stroke(183, 101, 33);
int c = 0;
while (c<50)
{
  int r = 0;
  while (r<500)
  {
    fill(183, 48+r, 48+r, 100);
    triangle(300-c, 50, 200, 250+c, 390-c, 300-c);
    r = r +10;
    c = c +10;
  }
}

//circles
int rgb = 0;
while (rgb<190)
{
  stroke(63+rgb, 71+rgb, 196-rgb);
  fill(229-rgb, 65+rgb, 175-rgb, 120-rgb);
  ellipse(260+rgb, 380+rgb, 110-rgb, 198-rgb);
  rgb = rgb + 5;
}

//bezier
int bez = 0;
int weight = 0;
while (bez<1000)
while (weight<10)
{
  fill(216-bez,190-bez,57+bez,90-bez);
  stroke(203-bez,94+bez,10+bez,160-bez);
  strokeWeight(7+weight);
  bezier(300+bez,50+bez,1120,0,0,400,450-bez,450-bez);
  bez = bez+10;
  weight = weight +1;
}
