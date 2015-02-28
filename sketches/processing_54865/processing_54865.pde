
void setup() {
  size(500, 500);
  background(0);
  noStroke();
  smooth();
  fill(255);
  //noLoop();
  frameRate(1);
}

int i = 0;
boolean plus = true;

void draw() {
  if(i <= 9){
    background(0);
    paproc(width/2, height/2, 150,i);
    if(plus == true)
      i++;
    else
      i--;
  }
  if(i == 8)
    plus = false;
  if(i == 0)
    plus = true;
  }


void paproc(float X1, float Y1, float D, int ilRek)
{
  if(ilRek > 0)
  {
    ilRek--;
    ellipse(X1, Y1, D, D);
    paproc(X1+3/4.*D,Y1, D/2, ilRek);
    paproc(X1-3/4.*D,Y1, D/2, ilRek);
    paproc(X1,Y1+3/4.*D, D/2, ilRek);    
    paproc(X1,Y1-3/4.*D, D/2, ilRek);
   // paproc(X1-3/4.*D,Y1-3/4.*D, D/2, ilRek);
    
  }
}

