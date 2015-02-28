
float sx,sy,rot;
int dist;
void setup()
{size(500,600);
background (255);
rect(0,0,500,600);
sx = 20f;
sy = 20f;
dist=200;
rot=0.0f;
}
void draw()
{
  if (key=='w')
  dist++;
  if (key=='s')
  dist--;
  if (key=='a')
  rot++;
  if (key=='d')
  rot--;
  fill (255,255,255);
  rect(0,0,500,600);
  translate(250,300);
rotate (rot/100);

for (int x = -250; x < 250; x+=(((float)dist)/10f))
 for (int y = -300; y < 300; y+=(((float)dist)/10f))
 { 
   fill(mouseX/2,y*256/600,x/2);
 ellipse(x,y,pow(abs(sx-x-250),.5f),pow(abs(sy-y-300),.5f));
 }
  sx=mouseX;
  sy=mouseY;  
}

