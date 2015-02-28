
void setup()
{
  size(400,400);
}


void drugaFunkcja(int x, int y,int a, int b,int c){
  rect(50,50,50,50);
  fill (255,mouseX*0.1*b, mouseY*0.1*c);
  translate(x,y);
  float angle = (PI/180)*3*a;
  rotate (angle);
}
void draw () {
  background(0);
  translate (200,175);
  for ( int i=2; i<16; i++){
    drugaFunkcja(10,i,i,i,i);
    
    
  }
}
