
class Fish{

float speedX;
float speedY;
float x;
float y;
PVector loc,loc1,loc2,loc4,loc6,loc3,loc5,loc7;
Fish()
{
  init();
}
void init(){
  loc = new PVector();
  loc3 = new PVector();
  loc5 = new PVector();
  loc7 = new PVector();
  loc1= new PVector();
  loc2=new PVector();
  loc4=new PVector();
  loc6=new PVector();
 speedX = 2;//(float) random(2.0,4.0);
 speedY = 2;//(float) random(1.0,3.5);
 
 }
  void move()
  {
loc.x += speedX;
 }
 void move4()
  {
loc4.x += speedX;
 }
 void move6()
  {
loc6.x += speedX;
 }
  void move2()
  {
loc2.x += speedX;
 }
void move1()
{
  loc1.x -= speedX;
}
void move3()
{
  loc3.x -= speedX;
}
void move5()
{
  loc5.x -= speedX;
}
void move7()
{
  loc7.x -= speedX;
}
  PVector getLoc() 
{
    return loc;
  }
  void setLoc(PVector inLoc) {
    loc = inLoc;
  }
  PVector getLoc3() 
{
    return loc3;
  }
  void setLoc3(PVector inLoc3) {
    loc3 = inLoc3;
  }
  PVector getLoc5() 
{
    return loc5;
  }
  void setLoc5(PVector inLoc5) {
    loc5 = inLoc5;
  }
  PVector getLoc7() 
{
    return loc7;
  }
  void setLoc7(PVector inLoc7) {
    loc7 = inLoc7;
  }
  PVector getLoc4() 
{
    return loc4;
  }
  void setLoc4(PVector inLoc4) {
    loc4 = inLoc4;
  }
  PVector getLoc6() 
{
    return loc6;
  }
  void setLoc6(PVector inLoc6) {
    loc6 = inLoc6;
  }
   PVector getLoc2() 
{
    return loc2;
  }
  void setLoc2(PVector inLoc2) {
    loc2 = inLoc2;
  }

  PVector getLoc1() 
{
    return loc1;
  }
  void setLoc1(PVector inLoc1) {
    loc1 = inLoc1;
  }
}

