
float dRam = 140;  //dlugosc ramienia
float bRam = 7;    //szerokosc ramienia
int ilR = 7;       //ilość rekurencji

int ilRam = 6;

void setup() {
  size(700, 700);
  background(0);
  noStroke();
  smooth();
  fill(255);
  platekS(width/2, height/2, dRam, bRam, ilRam, ilR); 
  frameRate(29);
}

void draw() {
}
void mousePressed()
{
  background(0);
  ilRam = int(random(6)+3);

  platekS(width/2, height/2, dRam, bRam, ilRam, ilR);
}

void platekS(float X1, float Y1, float H, float B, int ilRam, int ilRek)
{
  int[] tabilRam = new int[ilRek];
  float[] tabH = new float[ilRek];
  float[] tabB = new float[ilRek];
  float[] tabalfaR = new float[ilRek];

  tabilRam[ilRek-1] = ilRam;       
  tabH[ilRek-1] = H;
  tabB[ilRek-1] = B;
  tabalfaR[ilRek-1] = 0;

  for (int i = ilRek-2; i >= 0; i--) {
    tabilRam[i] = int(random(6)+2);
    tabH[i] = tabH[i+1]*random(0.5, 0.7);
    tabB[i] = tabB[i+1]*random(0.4, 0.5);
    tabalfaR[i] = random(HALF_PI, PI-HALF_PI/2);
    print(i+": "+tabilRam[i]+" "+tabH[i]+" "+tabB[i]+" "+tabalfaR[i]+"\n");
  }
  platekR(X1, Y1, tabH, tabB, tabalfaR, tabilRam, ilRek);
}

void platekR(float X1, float Y1, float H[], float B[], float alfaR[], int ilRam[], int ilRek)
{
  ilRek--;
  if (ilRek+1 > 0 && ilRam[ilRek] != 0)
  {
    float alfa;
    if(alfaR[ilRek] == 0)
    alfa = (TWO_PI-alfaR[ilRek])/(ilRam[ilRek]);
    else
    alfa = (TWO_PI-alfaR[ilRek])/(ilRam[ilRek]-1);
    
    pushMatrix();
    translate(X1, Y1);
    rotate(-(TWO_PI-alfaR[ilRek])/2);
    for (int i = 0; i < ilRam[ilRek]; i++)
    {
     
      rect(0, -B[ilRek]/2, H[ilRek], B[ilRek]); 
      platekR(H[ilRek], 0, H, B, alfaR, ilRam, ilRek);
      rotate(alfa);
    }      
    popMatrix();
  }
}

