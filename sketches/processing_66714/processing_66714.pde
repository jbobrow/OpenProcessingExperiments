
void setup()
{
  size(500,500);
  for(int i = 1; i < 6 ; i++){
    ellipse(250,i*70,i*20,i*20);
    ellipse(500-(i*70),250,i*20,i*20);
  }
}

