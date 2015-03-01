
int GAP = 12;    // gap between squares
int SIZE = 80;   // square size
int I = 6;       // horizontal number of square width
int J = 6;       // vertical number of square
int SHAD = 6;    // shadow offset
int RANDW;       // random variation in horizontal square position
int RANDH;       // random variation in vertical square position
int R = 4;       // ratio 
/*********************************************/
void setup(){
  size(GAP+I*(GAP+SIZE),GAP+J*(GAP+SIZE));
  background(255);
  frameRate(2);
}
/*********************************************/
void draw(){
  background(255);
  for(int i = 0; i < I; i++)
  {
    for(int j=0; j < J; j++)
    {
      RANDW = int(random(-GAP/R, GAP/R));
      RANDH = int(random(-GAP/R, GAP/R));
      noStroke();
      fill(200);
      rect(RANDW+SHAD+GAP+(i*(SIZE+GAP)),RANDH+SHAD+GAP+(j*(SIZE+GAP)),SIZE,SIZE);
      fill(int( random (0,255)), int( random (0,255)), int(  random (0,255)) );
      rect(RANDW+GAP+(i*(SIZE+GAP)),RANDH+GAP+(j*(SIZE+GAP)),SIZE,SIZE);
    }
  }
}
