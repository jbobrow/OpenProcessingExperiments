
void setup()
{
  size(600,600);
  background(0);
  noFill();
  stroke(255,200);
  frameRate(1);
}  

boolean zmianaK = true;

int ii = 1;

void draw()
{
  if(ii < 18)
  { background(1);
  dPitagorejskie(100,height/2-50, 55, 0.25, 0.4, ii);
  ii++;
  }
}

void dPitagorejskie(float X, float Y, float D, float wspP, float wspH, int ilRek)
{
  pushMatrix();
  translate(X,Y);
  rectMode(CENTER);
  dPitagorejskieR(D, wspP, wspH, ilRek);
  rectMode(CORNER);
  popMatrix(); 
}

void dPitagorejskieR(float D, float wspP, float wspH, int ilRek)
{
  if(ilRek > 0 && (wspP <= 1))
  {
    ilRek--;
    rect(0,0,D,D);
    
    pushMatrix();
    translate(D/2,0);
    float H = wspH*D;
    float rA = wspP*D;
    float rB = (1-wspP)*D;
    float A = dist(0, -D/2, H, rA-D/2); //przeciwprostokatna A
    float B = dist(0, D/2, H, D/2-rB); //przeciwprostokatna A
    float alfa = atan(H/rA);
    float beta = atan(H/rB);
    
    translate(H/2, rA/2-D/2);
    rotate(-alfa);
    translate(A/2, 0);
    dPitagorejskieR(A, zmianaK ? 1-wspP : wspP, wspH, ilRek);
    popMatrix();
    
    translate(D/2,D/2);
    translate(H/2, -rB/2);
    rotate(beta);
    translate(B/2, 0);
    
    dPitagorejskieR(B, zmianaK ? 1-wspP : wspP, wspH, ilRek);
    
  }
}

