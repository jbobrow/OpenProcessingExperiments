
color night = color(10,10,100);
ArrayList sys;
void setup()
{
  size(700,500);
  sys = new ArrayList();
}
void draw()
{
  background(night);
  for(float n=random(1,8) ; n>0 ; n--)
    sys.add( new spark() );
   
  for(int i=sys.size()-1 ; i>0 ; i--)
  {
    spark s = (spark)sys.get(i);
    if(s.alive) {
      s.draw(); s.move();
    }else{
      sys.remove(i);
    }
  }
}





