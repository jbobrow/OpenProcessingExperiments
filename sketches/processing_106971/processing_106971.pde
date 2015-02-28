
void setup ()
{
  size(360,500);
}

void draw ()
{
}

void SetzeFarbe()
{
  float i = random(8);
  if (( 0 < i ) && ( 3 > i )) { fill(255,255,0); };
  if (( 3 < i ) && ( 5 > i )) { fill(255,0,0); };
  if (( 5 < i ) && ( 7 > i )) { fill(0,255,0); };
  if (( 7 < i ) && ( 8 > i )) { fill(0,0,255); };

}

void Ganzes(float xx, float xy, float yx, float yy)
{
  float aa = random(100)+12;
  SetzeFarbe();
  rect(xx, xy, yx, yy);
  fill(0,0,0);
  rect(xx,xy, yx, yy/ aa);
  rect(xx,(yy-yy/aa), yx, yy/aa);
  rect(xx, xy, yx/10, yy);
  rect((yx-yx/aa), xy, yx/aa, yy);
  
}

void HalbiereV(float xx, float xy, float yx, float yy, int Satz)
{
 TeileH(xx, xy, yx/2, yy, Satz);
 TeileH((xx + yx/2) , xy, yx, yy, Satz);
}

void HalbiereH(float xx, float xy, float yx, float yy, int Satz)
{
 TeileV(xx, xy, yx, yy/2, Satz);
 TeileV(xx , ( xy + yy/2), yx, yy, Satz);
}

void DrittelnV(float xx, float xy, float yx, float yy, int Satz)
{
 TeileH(xx, xy, yx/3, yy, Satz);
 TeileH((xx + yx/3) , xy, yx, yy, Satz);
 TeileH((xx + (2*yx/3)) , xy, yx, yy, Satz);
}

void DrittelnH(float xx, float xy, float yx, float yy, int Satz)
{
 TeileV(xx, xy, yx, yy/3, Satz);
 TeileV(xx, ( xy + yy/3), yx, yy, Satz);
 TeileV(xx, ( 2*yy/3)+ yx, yx, yy, Satz);
}

void TeileV(float xx, float xy, float yx, float yy, int Satz)
{
 Satz = Satz + 1; 
 float i = random(3);
 if( Satz < 6) { 
 if(i < 1) { Ganzes( xx, xy, yx, yy); }
 if((i < 2 ) && ( i> 1)) { HalbiereV (xx,xy, yx, yy, Satz);}
 if((i < 3 ) && ( i> 2)) { DrittelnV (xx,xy, yx, yy, Satz);}
 }
 else
 {
   Ganzes( xx, xy, yx, yy);
 }
}

void TeileH(float xx, float xy, float yx, float yy, int Satz)
{
 Satz = Satz + 1; 
 float i = random(3);
 if( Satz < 6) { 
 if(i < 1) { Ganzes( xx, xy, yx, yy); }
 if((i < 2 ) && ( i> 1)) { HalbiereH (xx,xy, yx, yy, Satz);}
 if((i < 3 ) && ( i> 2)) { DrittelnH (xx,xy, yx, yy, Satz);}
 }
 else
 {
   Ganzes( xx, xy, yx, yy);
 }
}


void keyPressed()
{ 
  TeileH(0,0,360,500,0);
  save("TestThomas");
}
