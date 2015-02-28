


PShape al;
PShape ar;

void setup (){
size (800,600);
background(255);
smooth();
frameRate (10);
al= loadShape ("ohrohrohr.svg");
ar= loadShape ("ohrohrohr2.svg");
}
void draw() 
{
  int posy = int (random(80,120));
  int posf = int (random(190,210));
  for (int i=0; i<20; i++)
  {
    background(255);
    shape(ar,20,posy);
    shape(al,250,posy);
  }
}


