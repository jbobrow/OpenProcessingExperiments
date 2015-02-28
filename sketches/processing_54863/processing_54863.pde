
class BigGuy
{
   float x, y;
   float mass;
   BigGuy(float tx, float ty, float tm)
   {
      x = tx;
      y = ty;
      mass = tm;
   } 
   void display()
   {
     fill(230,157,179);
     noStroke();
     ellipse(x,y, mass,mass);
   }
}

