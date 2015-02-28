
//Move to move circle and 4 triangle.
//Click mouse to elongate and delongate triangle.
//Go to mouseX > 900 and mouseY >700 to get a effect thingy.
//Go to mouseX < 300 and mouseY < 300 for a black background.
//Go to mouseX > 900 and mouseY < 300 for a grey background.
float quadx,mover,move,d,f,g,e,r,random,ff,c,vv,y,uu,u,o,h,kk,k,n,q,w,popx,popy,popsize1,popsize2,roundx,roundy,roundsize1,roundsize2,tri1,tri2,popx2,popy2,popsize3,popsize4,power;
void setup()
{
  size(1200,1000);          //Window size.
  move = 1;
}
void draw()
{
  //background(random(0,500),random(0,500));          //Black or White
  background(random(0,500),random(0,500),random(0,350));          //Rainbowz!!!
  power = 0;          //Vars.
  quadx = 0;
  tri1 = random(10,990);
  tri2 = random(10,990);
  roundx = random(10,990);
  roundy = random(10,990);
  roundsize1 = random(100,300);
  roundsize2 = random(100,300);
  popx = random(10,990);
  popy = random(10,990);
  popsize1 = random(100,300);
  popsize2 = random(100,300);
  random = random(90,100);
  e = random(40,200);
  r = e;
  d = mouseX + e / 2 + 20 + random;
  ff = d - random;
  f = mouseY + 20 + random(10,50);
  g = mouseY - 20 - random(10,50);
  c = mouseX - e / 2 - 20 - random;
  vv = c + random;
  y = mouseY + e / 2 + 20 + random;
  uu = y - random;
  u = mouseX - 20 - random(10,50);
  o = mouseX + 20 + random(10,50);
  h = mouseY + e / 2 + 20 + random;
  kk = h - random;
  k = mouseX - 20 - random(10,50);
  n = mouseX + 20 + random(10,50);
  q = mouseY - e / 2 - 20 - random;
  w = q + random;
  if (mouseX > 900)
  {
    if (mouseY >700)
    {
      garg();
    }
  }
  if (mouseX < 300)
  {
    if (mouseY < 300)
    {
      colorblack();
    }
  }
  if (mouseX > 900)
  {
    if (mouseY < 300)
    {
      colorwhite();
    }
  }
  fill(random(3,500),random(3,500),random(3.500),random(100,500));      //Mouse shapes
  ellipse(mouseX,mouseY,e,r);
  fill(random(3,500),random(3,500),random(3,500),random(100,500));
  triangle(d + mover,mouseY,ff,f,ff,g);
  fill(random(3,500),random(3,500),random(3,500),random(100,500));
  triangle(c - mover,mouseY,vv,f,vv,g);
  fill(random(3,500),random(3,500),random(3,500),random(100,500));
  triangle(mouseX,h + mover,k,kk,n,kk);
  fill(random(3,500),random(3,500),random(3,500),random(100,500));
  triangle(mouseX,q - mover,k,w,n,w);
  fill(random(3,500),random(3,500),random(3,500),random(50,200));      //Random shapes.
  rect(popx,popy,popsize1,popsize2);
  fill(random(3,500),random(3,500),random(3,500),random(50,200));
  ellipse(roundx,roundy,roundsize1,roundsize2);
  fill(random(3,500),random(3,500),random(3,500),random(50,300));
  triangle(733,689,tri1,tri2,mouseX,mouseY);
  fill(random(3,500),random(3,500),random(3,500),random(50,200));
  if (popx * 2 > 1000);
  {
    popx2 = (popx * 2) - 1000;
  }
  if (popy * 2 > 1000)
  {
    popy2 = (popy * 2) - 1000;
  }
  popsize3 = popsize1 * 2;
  popsize4 = popsize2 * 2;
  rect(popx2,popy2,popsize3,popsize4);
  for (int infinity = 0; infinity < 1000; infinity = infinity + 15)
  {
    fill(random(3,500),random(3,500),random(3,500),45);
    rect(power,infinity,100,200);
    //fill(random(3,500),random(3,500),random(3,500),random(0,90));
    //rect(power * 3,infinity,100,200);
    fill(random(3,500),random(3,500),random(3,500),45);
    rect((power - 1000) * -1,infinity,100,200);
    power += 8;  
  }
} 
void mousePressed()
{
  if (move == 1)
  {
    mover += 20;
    if (mover == 400)
    {
    move = 2;
    } 
  }
  if (move == 2)
  {
    mover -= 30;
    if (mover <= 0)
    {
    move = 1;
    }
  }
}
void garg()
{
  while (quadx <= 1200)
  {
    fill(random(0,500),random(0,500),random(1,1000),random(300,500));
    quad(quadx,467,quadx + random(50,75),455,quadx + random(80,105),521,quadx + random(15,30),560);
    quadx += 7;
  }
} 
void colorblack()
{
  background(1);
}
void colorwhite()
{
  background(100,500);
}
