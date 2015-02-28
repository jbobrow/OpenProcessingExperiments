
void setup()
{
  size(600,600);
  background(0);
  noFill();
  stroke(255,200);
  frameRate(1);
}

int i = 1;

void draw()
{
  if(i < 16)
  { background(1);
  dPitagorejskie(100,height/2-100, 100, PI/3.5, 40, i);
  i++;
  }
}

void dPitagorejskie(float X, float Y, float D, float alfa, float Ht, int ilRek)
{
  pushMatrix();
  translate(X,Y);
  rectMode(CENTER);
  dPitagorejskieR(D, alfa, Ht, ilRek);
  rectMode(CORNER);
  popMatrix(); 
}

void dPitagorejskieR(float D, float alfa, float Ht, int ilRek)
{
  if(ilRek > 0 && (tan(alfa)*D >= Ht))
  {
    ilRek--;
    rect(0,0,D,D);
    float p = Ht/sin(alfa); //przeciwprostokątna
    
    pushMatrix();
    translate(D/2,-D/2);
    
    translate(sin(alfa)*p/2, cos(alfa)*p/2);
    rotate(-alfa);
    translate(p/2, 0);
    dPitagorejskieR(p, alfa, Ht*p/D, ilRek);
    popMatrix();
    
    translate(D/2,D/2);
    translate(Ht/2, -(D-cos(alfa)*p)/2);
    rotate(atan(Ht/(D-cos(alfa)*p)));
    translate(sqrt(pow(D-cos(alfa)*p,2)+pow(Ht,2))/2, 0);
    
    dPitagorejskieR(sqrt(pow(D-cos(alfa)*p,2)+pow(Ht,2)), alfa, Ht*sqrt(pow(D-cos(alfa)*p,2)+pow(Ht,2))/D, ilRek);
    
  }
}

