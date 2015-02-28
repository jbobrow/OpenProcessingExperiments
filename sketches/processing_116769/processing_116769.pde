
int x = 140;
  int speed = 1;
float xx = -1;
float yy= -20;
float ss = -1;
float ff = 100;
int gg = 0;
int hh = 0;
int jj = 0;


void setup()
{
size(300,300);

}

void draw()
{
 

  background(255,255,255);
  fill(0,0,0);
  
  //rub skyb bevegelse
  if(keyPressed)
  {
  if(keyCode == LEFT)
  {
  x= x - speed;
  println("l");
  }
  
  if(keyCode == RIGHT)
  {
  x= x + speed;
  println("r");
  }
  
  }
  rect(x,280,20,20);
  
  //meteorer
  if(xx == -1)
  {
  xx = random(300);
  }
  if(ss == -1);
  {
  ss = random(10);
  }
  if(yy >= 320)
  {
  xx=-1;
  yy=-20;
  }
  yy=yy+ss;
  
  //calcolade la distanza
  
  
  ff =abs( sqrt((xx-x)*(xx-x)+(yy-280)*(yy-280)));
  
  if(ff <=15)
  {
  
  gg = 1;
  noLoop();
  println("game over");
  for(hh=0;hh==120;hh += 1);
  {
  jj = jj + 1;
  fill(255,0,0);
  ellipse(x,280,jj,jj);
  }
  }
    
  ellipse(xx,yy,20,20);
  
  
 }
 
 void mouseReleased() {
  loop();
}
