
//Bryan Lee, Repeating Shapes, Computer Programming 1, Block 7
int a = 250;
int b = 0;
int c = 250;
float d = 0;
float e = 0;
float f = 0;
int g = 300;
int h = 300;
float i = 155;
float j = 35;
float x = 0;
size(500,300);
while(x < 300)
{
float k = random(150,351);
float l = random(0,141);
  stroke(255,170,0);
  fill(255,170,0);
  ellipse(0,0,100,100);
  noFill();
  stroke(i,j,0);
  i = i + 100.0/300;
  j = j + 20.0/300;
  line(0,g,500,h);
  g--;
  h--;
  if(x % 5 == 0)
  {
    noStroke();
   fill(random(0,150));
  ellipse(k,l,50,50);
  }
  fill(d,e,f);
  stroke(d,e,f);
  bezier(250,250,c,b,a,b,250,250);
  d = d + 256.0/300;
  e = e + 256.0/300;
  f = f + 256.0/300;
  a+=3;
  b+=1;
  c-=3;

  x++;
}
