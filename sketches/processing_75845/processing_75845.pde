
//Matheson G. Computer Programming 1 Mods:14/15
PImage Washington;
PImage money;
int x=1;
void setup()
{
  size(500, 500);
  frameRate(1);
Washington=loadImage("http://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Gilbert_Stuart_Williamstown_Portrait_of_George_Washington.jpg/220px-Gilbert_Stuart_Williamstown_Portrait_of_George_Washington.jpg");
money=loadImage("http://upload.wikimedia.org/wikipedia/commons/7/7b/United_States_one_dollar_bill,_obverse.jpg");
}
void draw()
{
  image(Washington, 0, 0, 500, 500);
  int bill=1;
  while (bill<=x)
  { 
    image(money,int(random(500)), int(random(500)), 72, 41);
    bill++;
    
  }
  textSize(32);
  text(x,50,50);

 
  x=x*2;
  if(x>1025)
  {
   x=1;
  }
 
}
