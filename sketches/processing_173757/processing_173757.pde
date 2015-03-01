
void setup()
{
  size(600,600);
}

void draw()
{
}

void keyPressed()
{
  int rot, grun, blau;
  int rot1, rot2, grun1, grun2, blau1, blau2;
  int zu1, zu2, zu3;
  for(int zz = 0; zz < 3; zz++)
  {
    zu1 = int(random(255));
    zu2 = int(random(255));
    zu3 = int(random(255));
  for(int z = 0; z < 3; z++)
  {
    rot = int(random(255));
    grun = int(random(255));
    blau = int(random(255));
    
    rot1 = rot;
    if(rot1 > zu1)
    {
      rot1 = zu1;
    }
    rot2 = 255-rot;
    if(rot2 > zu1)
    {
      rot2=zu1;
    }
    grun1 = grun;
    if(grun1 > zu2)
    {
      grun1 = zu2;
    }
    grun2 = 255-grun;
    if(grun2>zu2)
    {
      grun2 = zu2;
    }
    blau1 = blau;
    if(blau1 > zu3)
    {
      blau1 = zu3;
    }
    blau2 = 255 - blau;
    if(blau2 > zu3)
    {
     blau2 = zu3;
    }
    
    fill(rot1, grun1, blau1);
    rect(0+z*200,0+zz*200, 200,200);
    fill(rot2,grun2,blau2);
    if(zz==0)
    {
      triangle(z*200,200+zz*200, 100+z*200, zz*200, 200+z*200,200+zz*200); 
    }
    if(zz==1)
    {
      rect(z*200+50,zz*200+50, 100, 100);
    }
    if(zz==2)
    {
      ellipse(100+z*200,100+zz*200, 150,150);
    }
    
  } 
  }
}








