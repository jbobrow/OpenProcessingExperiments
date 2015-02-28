
int a=30;
int s=175;
int lives = 5;

void setup ()
{
  size (600,200);
}

void draw ()
{
  background (#ff00ff);
  fill (255);
  rect (0,0,600,10);
  fill(0);
  text ("score = ", 20,10);
  text (lives, 60,10);
    fill (255);
    rect(110,10,30,90);
    rect(250,110,30,120);
    rect(400,130,30,90);
    rect(400,10,30,60);
    rect(250,3,30,30);
    rect(110,170,30,30);
    ellipse (a,s,45,45);
  if (key=='w')
  {
    s--;
  }
  else if (key=='a')
  {
    a--;
  }
  else if (key=='s')
  {
    s++;
  }
  else if (key=='d')
  {
    a++;
  }
  if (a >90 && s > 150) { fill (0); rect (150,50,300,100); fill (255); text ("Your Dead", 300,100);  
//lives= lives- 1;
  {
if(a>110 && s > 50) { fill (0); rect (150,50,300,100); fill (255); text ("Your Dead", 300,100);}

}
  }
}
