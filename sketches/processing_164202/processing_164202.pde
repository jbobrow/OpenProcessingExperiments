
void setup()
{
  size(400,400);
}

void draw()
{
}

void keyPressed()
{
  noStroke(); 
  background(0);
  
  color[] farben = new color[6];
 
  int k;
  int g;
  int eRot;
  int eGrun;
  int eBlau;
  color zweiteFarbe;
  
  int z = int(random(5)+1);
 
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  color ersteFarbe = color(rot, grun, blau);
  
  farben[0] = ersteFarbe;
    
  for(int x = 1; x < z; x++)
  {
    eRot = int(red(farben[x-1])); 
    eGrun = int(green(farben[x-1]));;
    eBlau = int(blue(farben[x-1]));
    
    k = int(random(6));
    if(k==0)
    {
      eRot = 255-eRot;
    }
    if(k==1)
    {
      eGrun = 255-eGrun;
    }
    if(k==2)
    {
      eBlau = 255-eBlau;
    }
    if(k==3)
    {
      eRot = (eGrun + eBlau)/2;
    }
    if(k==4)
    {
      eGrun = (eRot + eBlau)/2;
    }
    if(k==5)
    {
      eBlau = (eGrun + eRot)/2;
    }
    
    zweiteFarbe = color(eRot, eGrun, eBlau);
  
    farben[x] = zweiteFarbe;
  }
  
float wert = 0;
float[] zwischenWert = new float[6];
  
for(int x = 0; x < z; x++)
{
  eRot = int(red(farben[x])); 
  eGrun = int(green(farben[x]));;
  eBlau = int(blue(farben[x]));
  zwischenWert[x] = eRot * 3 + eGrun * 8 + eBlau*5;
  wert = wert + zwischenWert[x];
}

float schleifenWert = 270;
float pruf;

for(int x = 0; x < z; x++)
{
  fill(farben[x]);
  ellipse(200,200, schleifenWert, schleifenWert);
  pruf = 270/wert*zwischenWert[x];
  schleifenWert = schleifenWert - pruf;
}
save("Test.png");
}












