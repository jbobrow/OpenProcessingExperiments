
void setup()
{
  size(600,600);
}
boolean on = false;
void draw()
{
  
  if(on) {background(255,0,0);}
  
  else  {background(0);}
  
  on = !on;
  myDelay(1000);

  
  
}
void myDelay(int ms)
{
   try

  {    
    Thread.sleep(ms);
  }
  catch(Exception e){}
}


