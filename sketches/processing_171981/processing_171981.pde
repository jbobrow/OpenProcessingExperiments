
void setup()
{

}

boolean  _licht = false;

void draw(){
  if(_licht)
  {
    background(255);
  }
  else
  {
    background(0);
  }
}

void mousePressed()
{
  _licht = !_licht;
}
