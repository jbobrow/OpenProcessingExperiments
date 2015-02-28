
int a=50;
int s=50;

void setup ()
{
  size (600,600);
  background (#000000);
}

void draw ()
{

    ellipse (a,s,30,30);
   
    stroke (#00CEFF);   //change the color here
    //use the wsad controlls
    
      if (key=='c') { fill (random (0,255)); ellipse (a,s,30,30);}
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
  if (key=='c') { fill (random (0,255)); ellipse (a,s,30,30);}

}
